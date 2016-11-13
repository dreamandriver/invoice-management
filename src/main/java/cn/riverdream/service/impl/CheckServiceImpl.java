package cn.riverdream.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

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
		BigDecimal p = new BigDecimal(Double.toString(payamount));
		BigDecimal i = new BigDecimal(Double.toString(incomeamount));
		BigDecimal t = new BigDecimal(Double.toString(taxpoint));
		
		BigDecimal result = i.multiply(new BigDecimal(100).subtract(t)).divide(new BigDecimal(100)).subtract(p);
		check.setAccount(result.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());
		BigDecimal tax = i.multiply(t).divide(new BigDecimal(100));
		check.setTaxamount(tax.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());
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
		PageHelper.startPage(page, rows);
		List<TbCheck> list = checkMapper.selectByExample(example);
		

		// 取分页信息
		PageInfo<TbCheck> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		
		DataGridResultInfo result = new DataGridResultInfo();
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
		check.setStatus(0);//0标记为删除
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
//		checkMapper.updateByExampleSelective(vo.getCheck(), example);
		
		TbCheck check = checkMapper.selectByPrimaryKey(serialno);
		Double payamount = check.getPayamount();
		Double incomeamount = check.getIncomeamount();
		Integer taxpoint = check.getTaxpoint();
		BigDecimal p = new BigDecimal(Double.toString(payamount));
		BigDecimal i = new BigDecimal(Double.toString(incomeamount));
		BigDecimal t = new BigDecimal(Double.toString(taxpoint));
		
		BigDecimal result = i.multiply(new BigDecimal(100).subtract(t)).subtract(p);
		check.setAccount(result.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());
		BigDecimal tax = i.multiply(t).divide(new BigDecimal(100));
		check.setTaxamount(tax.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());
//		checkMapper.updateByExampleSelective(check, example);
		checkMapper.updateByPrimaryKeySelective(vo.getCheck());
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

}
