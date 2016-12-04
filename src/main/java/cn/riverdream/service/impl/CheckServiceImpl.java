package cn.riverdream.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.riverdream.mapper.TbCheckMapper;
import cn.riverdream.model.CheckVo;
import cn.riverdream.pojo.TbCheck;
import cn.riverdream.pojo.TbCheckExample;
import cn.riverdream.pojo.TbCheckExample.Criteria;
import cn.riverdream.service.CheckService;
import cn.riverdream.utils.DataGridResultInfo;

@Service
public class CheckServiceImpl implements CheckService {

	@Autowired
	private TbCheckMapper checkMapper;

	@Override
	public Integer save(TbCheck check) {
		check.setStatus(1);
		check.setCreatedate(new Date());
		Double payamount = check.getPayamount();
		Double incomeamount = check.getIncomeamount();
		Integer taxpoint = check.getTaxpoint();
		Double other = check.getOther();
		BigDecimal p = new BigDecimal(Double.toString(payamount));
		BigDecimal i = new BigDecimal(Double.toString(incomeamount));
		BigDecimal t = new BigDecimal(Double.toString(taxpoint));
		BigDecimal o = new BigDecimal(Double.toString(other));

		BigDecimal result = i.multiply(new BigDecimal(100).subtract(t)).divide(new BigDecimal(100)).subtract(p)
				.subtract(o);
		check.setAccount(result.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue());
		BigDecimal tax = i.multiply(t).divide(new BigDecimal(100));
		check.setTaxamount(tax.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue());
		checkMapper.insert(check);
		return check.getSerialno();
	}

	@Override
	public DataGridResultInfo find(CheckVo vo) {
		String contractno = vo.getContractno();
		String consumer = vo.getConsumer();
		String checkno = vo.getCheckno();
		Date instart = vo.getInstart();
		Date inend = vo.getInend();
		Date outstart = vo.getOutstart();
		Date outend = vo.getOutend();
		int page = vo.getPage();
		int rows = vo.getRows();

		TbCheckExample example = new TbCheckExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusNotEqualTo(0);

		if (StringUtils.isNotBlank(checkno)) {
			criteria.andChecknoEqualTo(checkno);
		}
		if (StringUtils.isNotBlank(contractno)) {
			criteria.andContractnoEqualTo(contractno);
		}
		if (StringUtils.isNotBlank(consumer)) {
			criteria.andConsumerLike("%" + consumer + "%");
		}
		if (instart != null) {
			criteria.andIncomedateGreaterThanOrEqualTo(instart);
		}
		if (inend != null) {
			criteria.andIncomedateLessThanOrEqualTo(inend);
		}
		if (outstart != null) {
			criteria.andPaydateGreaterThanOrEqualTo(outstart);
		}
		if (outend != null) {
			criteria.andPaydateLessThanOrEqualTo(outend);
		}

		example.setOrderByClause("incomedate desc, checkno desc");
		PageHelper.startPage(page, rows);
		List<TbCheck> list = checkMapper.selectByExample(example);

		// 取分页信息
		PageInfo<TbCheck> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();

		BigDecimal ba = new BigDecimal(0);
		BigDecimal bi = new BigDecimal(0);
		BigDecimal bt = new BigDecimal(0);
		BigDecimal bp = new BigDecimal(0);
		BigDecimal ot = new BigDecimal(0);
		DataGridResultInfo result = new DataGridResultInfo();

		// 身份
		// Subject subject = SecurityUtils.getSubject();
		// TbUser activeUser = (TbUser) subject.getPrincipal();
		// if("admin".equalsIgnoreCase(activeUser.getPermission1())){
		// 合计
		List<TbCheck> listsum = checkMapper.selectByExample(example);
		for (TbCheck t : listsum) {
			Double account = t.getAccount();
			Double incomeamount = t.getIncomeamount();
			Double taxamount = t.getTaxamount();
			Double payamount = t.getPayamount();
			Double other = t.getOther();
			if (other == null) {
				other = 0.00;
			}
			ba = ba.add(new BigDecimal(account));
			bi = bi.add(new BigDecimal(incomeamount));
			bt = bt.add(new BigDecimal(taxamount));
			bp = bp.add(new BigDecimal(payamount));
			ot = ot.add(new BigDecimal(other));
		}
		List<Map<String, String>> sum = new ArrayList<>();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("account", ba.setScale(2, BigDecimal.ROUND_HALF_UP).toString());
		map.put("incomeamount", bi.setScale(2, BigDecimal.ROUND_HALF_UP).toString());
		map.put("taxamount", bt.setScale(2, BigDecimal.ROUND_HALF_UP).toString());
		map.put("payamount", bp.setScale(2, BigDecimal.ROUND_HALF_UP).toString());
		map.put("other", ot.setScale(2, BigDecimal.ROUND_HALF_UP).toString());
		map.put("contractno", "合计");
		sum.add(map);
		result.setFooter(sum);
		// }

		result.setTotal(total);
		result.setRows(list);
		return result;
	}

	@Override
	public void delete(CheckVo vo) {
		Integer serialno = vo.getSerialno();
		TbCheckExample example = new TbCheckExample();
		Criteria criteria = example.createCriteria();
		criteria.andSerialnoEqualTo(serialno);
		TbCheck check = new TbCheck();
		check.setStatus(0);// 0标记为删除
		check.setSerialno(serialno);
		checkMapper.updateByPrimaryKeySelective(check);
	}

	@Override
	public void update(CheckVo vo) {
		Integer serialno = vo.getCheck().getSerialno();
		TbCheckExample example = new TbCheckExample();
		Criteria criteria = example.createCriteria();
		criteria.andSerialnoEqualTo(serialno);
		checkMapper.updateByPrimaryKeySelective(vo.getCheck());
		// checkMapper.updateByExampleSelective(vo.getCheck(), example);

		TbCheck check = checkMapper.selectByPrimaryKey(serialno);
		Double payamount = check.getPayamount();
		Double incomeamount = check.getIncomeamount();
		Integer taxpoint = check.getTaxpoint();
		Double other = check.getOther();
		BigDecimal p = new BigDecimal(Double.toString(payamount));
		BigDecimal i = new BigDecimal(Double.toString(incomeamount));
		BigDecimal t = new BigDecimal(Double.toString(taxpoint));
		BigDecimal o = new BigDecimal(Double.toString(other));

		BigDecimal result = i.multiply(new BigDecimal(100).subtract(t)).divide(new BigDecimal(100)).subtract(p)
				.subtract(o);
		check.setAccount(result.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue());
		BigDecimal tax = i.multiply(t).divide(new BigDecimal(100));
		check.setTaxamount(tax.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue());
		// checkMapper.updateByExampleSelective(check, example);
		checkMapper.updateByPrimaryKeySelective(check);
	}

	@Override
	public TbCheck findBySerialNo(int serialNo) {
		TbCheckExample example = new TbCheckExample();
		Criteria criteria = example.createCriteria();
		criteria.andSerialnoEqualTo(serialNo);
		criteria.andStatusNotEqualTo(0);
		List<TbCheck> list = checkMapper.selectByExample(example);
		TbCheck check = new TbCheck();
		if (list != null && list.size() > 0) {
			check = list.get(0);
		}
		return check;
	}

	@Override
	public List<TbCheck> findAll(CheckVo vo) {
		String contractno = vo.getContractno();
		String consumer = vo.getConsumer();
		String checkno = vo.getCheckno();
		Date instart = vo.getInstart();
		Date inend = vo.getInend();
		Date outstart = vo.getOutstart();
		Date outend = vo.getOutend();

		TbCheckExample example = new TbCheckExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusNotEqualTo(0);

		if (StringUtils.isNotBlank(checkno)) {
			criteria.andChecknoEqualTo(checkno);
		}
		if (StringUtils.isNotBlank(contractno)) {
			criteria.andContractnoEqualTo(contractno);
		}
		if (StringUtils.isNotBlank(consumer)) {
			criteria.andConsumerLike("%" + consumer + "%");
		}
		if (instart != null) {
			criteria.andIncomedateGreaterThanOrEqualTo(instart);
		}
		if (inend != null) {
			criteria.andIncomedateLessThanOrEqualTo(inend);
		}
		if (outstart != null) {
			criteria.andPaydateGreaterThanOrEqualTo(outstart);
		}
		if (outend != null) {
			criteria.andPaydateLessThanOrEqualTo(outend);
		}
		List<TbCheck> list = checkMapper.selectByExample(example);
		return list;
	}

}
