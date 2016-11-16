package cn.riverdream.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.riverdream.mapper.TbContractMapper;
import cn.riverdream.mapper.TbDictMapper;
import cn.riverdream.model.ContractVo;
import cn.riverdream.pojo.TbContract;
import cn.riverdream.pojo.TbContractExample;
import cn.riverdream.pojo.TbDict;
import cn.riverdream.pojo.TbDictExample;
import cn.riverdream.pojo.TbUser;
import cn.riverdream.pojo.TbDictExample.Criteria;
import cn.riverdream.service.ContractService;
import cn.riverdream.utils.DataGridResultInfo;

@Service
public class ContractServiceImpl implements ContractService {

	@Autowired
	private TbContractMapper contractMapper;

	@Autowired
	private TbDictMapper dictMapper;

	@Override
	public Integer save(TbContract contract) {

		String contractNo;
		// 生成合同编号 编号规则：1610001（两位年份+两位月份+三位流水）
		SimpleDateFormat formatter;
		formatter = new SimpleDateFormat("yyyy-MM-dd KK:mm:ss a");
		String ctime = formatter.format(new Date());
		String year = ctime.substring(2, 4);
		String month = ctime.substring(5, 7);

		TbDictExample dictExample = new TbDictExample();
		Criteria dictCriteria = dictExample.createCriteria();
		dictCriteria.andItemEqualTo("contractNo");
		List<TbDict> dictList = dictMapper.selectByExample(dictExample);
		if (dictList == null || dictList.size() == 0) {
			contractNo = year + month + "001";
		} else {
			TbDict dict = dictList.get(0);
			if (dict == null || dict.getValue() == null) {
				contractNo = year + month + "001";
			} else if (!dict.getValue().startsWith(year)) {
				contractNo = year + month + "001";
			} else if (!dict.getValue().startsWith(year + month)) {
				contractNo = year + month + "001";
			} else {
				Integer num = Integer.parseInt(dict.getValue().substring(4)) + 1;
				if(num<10){
					contractNo = year + month + "00" + num;
				}else if(num<100){
					contractNo = year + month + "0" + num;
				}else{
					contractNo = year + month + num;
				}
			}
		}

		contract.setContractno(contractNo);
		contract.setCreatedate(new Date());
		contract.setFlag(1);

		contractMapper.insert(contract);
		TbDict dict = new TbDict();
		dict.setItem("contractNo");
		dict.setValue(contractNo);
		dictMapper.updateByExample(dict, dictExample);

		return contract.getSerialno();
	}

	@Override
	public DataGridResultInfo find(ContractVo vo) {
		String consumer = vo.getConsumer();
		String contractno = vo.getContractno();
		Date start = vo.getStart();
		Date end = vo.getEnd();

		TbContractExample example = new TbContractExample();
		cn.riverdream.pojo.TbContractExample.Criteria criteria = example.createCriteria();
		if (StringUtils.isNoneBlank(consumer)) {
			criteria.andConsumerLike("%" + consumer + "%");
		}
		if (StringUtils.isNotBlank(contractno)) {
			criteria.andContractnoEqualTo(contractno);
		}
		if (start != null) {
			criteria.andCreatedateGreaterThanOrEqualTo(start);
		}
		if (end != null) {
			criteria.andCreatedateLessThanOrEqualTo(end);
		}
		criteria.andFlagEqualTo(1);
		int page = vo.getPage();
		int rows = vo.getRows();
		PageHelper.startPage(page, rows);
		List<TbContract> list = contractMapper.selectByExample(example);

		// 取分页信息
		PageInfo<TbContract> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		DataGridResultInfo result = new DataGridResultInfo();
		
		//身份
		Subject subject = SecurityUtils.getSubject();
		TbUser activeUser = (TbUser) subject.getPrincipal();
		if ("admin".equalsIgnoreCase(activeUser.getPermission())) {
			//合计
			List<TbContract> listsum = contractMapper.selectByExample(example);
			BigDecimal totalAmount = new BigDecimal(0);
			for (TbContract t : listsum) {
				Double amount = t.getAmount();
				totalAmount = totalAmount.add(new BigDecimal(amount));
			}
			List<Map<String,String>> sum = new ArrayList<>();
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("amount", totalAmount.setScale(2,BigDecimal.ROUND_HALF_UP).toString());
			map.put("contractno", "合计");
			sum.add(map);
			
			result.setFooter(sum);
		}
		result.setTotal(total);
		result.setRows(list);
		return result;
	}

	@Override
	public void delete(ContractVo vo) {
		Integer serialno = vo.getSerialno();
		TbContractExample example = new TbContractExample();
		cn.riverdream.pojo.TbContractExample.Criteria criteria = example.createCriteria();
		criteria.andSerialnoEqualTo(serialno);
		TbContract contract = new TbContract();
		contract.setFlag(0);
		contract.setSerialno(serialno);
		contractMapper.updateByPrimaryKeySelective(contract);
	}

	@Override
	public void update(ContractVo vo) {
		Integer serialno = vo.getContract().getSerialno();
		TbContractExample example = new TbContractExample();
		cn.riverdream.pojo.TbContractExample.Criteria criteria = example.createCriteria();
		criteria.andSerialnoEqualTo(serialno);
		contractMapper.updateByExampleSelective(vo.getContract(), example);
	}

	@Override
	public TbContract findBySerialNo(int serialNo) {
		TbContractExample example = new TbContractExample();
		cn.riverdream.pojo.TbContractExample.Criteria criteria = example.createCriteria();
		criteria.andFlagEqualTo(1);
		criteria.andSerialnoEqualTo(serialNo);
		List<TbContract> list = contractMapper.selectByExample(example);
		TbContract contract = new TbContract();
		if(list!= null && list.size()>0){
			contract = list.get(0);
		}
		return contract;
	}

	@Override
	public List<TbContract> findAll(ContractVo vo) {
		String consumer = vo.getConsumer();
		String contractno = vo.getContractno();
		Date start = vo.getStart();
		Date end = vo.getEnd();

		TbContractExample example = new TbContractExample();
		cn.riverdream.pojo.TbContractExample.Criteria criteria = example.createCriteria();
		if (StringUtils.isNoneBlank(consumer)) {
			criteria.andConsumerLike("%" + consumer + "%");
		}
		if (StringUtils.isNotBlank(contractno)) {
			criteria.andContractnoEqualTo(contractno);
		}
		if (start != null) {
			criteria.andCreatedateGreaterThanOrEqualTo(start);
		}
		if (end != null) {
			criteria.andCreatedateLessThanOrEqualTo(end);
		}
		criteria.andFlagEqualTo(1);
		List<TbContract> list = contractMapper.selectByExample(example);
		return list; 
	}

}
