package cn.riverdream.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.riverdream.mapper.TbCheckMapper;
import cn.riverdream.mapper.TbContractMapper;
import cn.riverdream.mapper.TbDictMapper;
import cn.riverdream.mapper.TbInvoiceMapper;
import cn.riverdream.model.CheckVo;
import cn.riverdream.model.Contract;
import cn.riverdream.model.ContractVo;
import cn.riverdream.model.InvoiceVo;
import cn.riverdream.pojo.TbCheck;
import cn.riverdream.pojo.TbCheckExample;
import cn.riverdream.pojo.TbContract;
import cn.riverdream.pojo.TbContractExample;
import cn.riverdream.pojo.TbDict;
import cn.riverdream.pojo.TbDictExample;
import cn.riverdream.pojo.TbDictExample.Criteria;
import cn.riverdream.pojo.TbInvoice;
import cn.riverdream.pojo.TbInvoiceExample;
import cn.riverdream.service.CheckService;
import cn.riverdream.service.ContractService;
import cn.riverdream.service.InvoiceService;
import cn.riverdream.utils.DataGridResultInfo;

@Service
public class ContractServiceImpl implements ContractService {

	@Autowired
	private TbContractMapper contractMapper;

	@Autowired
	private TbDictMapper dictMapper;

	@Autowired
	private TbInvoiceMapper invoiceMapper;

	@Autowired
	private TbCheckMapper checkMapper;
	
	@Autowired
	private InvoiceService invoiceService;
	
	@Autowired
	private CheckService checkService;

	@Override
	public Integer save(TbContract contract) {

		contract.setFlag(1);
		BigDecimal bigDecimal = new BigDecimal(Double.toString(contract.getAmount())).setScale(2, BigDecimal.ROUND_HALF_UP);
		contract.setAmount(bigDecimal.doubleValue());
		contract.setFinish(0);
		contractMapper.insert(contract);

		String contractNo = getcontractNo();
		String contractno2 = contract.getContractno();
		if (contractNo.equalsIgnoreCase(contractno2)) {
			TbDict dict = new TbDict();
			dict.setItem("contractNo");
			dict.setValue(contractNo);
			TbDictExample dictExample = new TbDictExample();
			Criteria dictCriteria = dictExample.createCriteria();
			dictCriteria.andItemEqualTo("contractNo");

			dictMapper.updateByExample(dict, dictExample);
		}

		return contract.getSerialno();
	}

	@Override
	public String getcontractNo() {
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
				if (num < 10) {
					contractNo = year + month + "00" + num;
				} else if (num < 100) {
					contractNo = year + month + "0" + num;
				} else {
					contractNo = year + month + num;
				}
			}
		}
		return contractNo;
	}

	@Override
	public DataGridResultInfo find(ContractVo vo) {
		String consumer = vo.getConsumer();
		String contractno = vo.getContractno();
		String projectname = vo.getProjectname();
		String company = vo.getCompany();
		Date start = vo.getStart();
		Date end = vo.getEnd();

		TbContractExample example = new TbContractExample();
		cn.riverdream.pojo.TbContractExample.Criteria criteria = example.createCriteria();
		if (StringUtils.isNoneBlank(consumer)) {
			criteria.andConsumerLike("%" + consumer + "%");
		}
		if (StringUtils.isNoneBlank(company)) {
			criteria.andCompanyLike("%" + company + "%");
		}
		if (StringUtils.isNotBlank(contractno)) {
			criteria.andContractnoEqualTo(contractno);
		}
		if (StringUtils.isNotBlank(projectname)) {
			criteria.andProjectnameLike("%" + projectname + "%");
		}
		if (start != null) {
			criteria.andCreatedateGreaterThanOrEqualTo(start);
		}
		if (end != null) {
			criteria.andCreatedateLessThanOrEqualTo(end);
		}
		criteria.andFlagEqualTo(1);
		example.setOrderByClause("createdate desc, contractno desc");
		int page = vo.getPage();
		int rows = vo.getRows();
		PageHelper.startPage(page, rows);
		List<TbContract> list = contractMapper.selectByExample(example);
		List<Contract> newList = new ArrayList<Contract>();
		for (TbContract c : list) {
			Contract dest = new Contract();
			try {
				BeanUtils.copyProperties(dest, c);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String contractno2 = c.getContractno();
			//普票合计
			InvoiceVo civ = new InvoiceVo();
			civ.setContractno(contractno2);
			DataGridResultInfo civResult = invoiceService.find(0, civ);
			@SuppressWarnings("unchecked")
			HashMap<String, String> civMap= (HashMap<String, String>) civResult.getFooter().get(0);
			dest.setCinvoice(civMap.get("amount"));
			
			//专票合计
			InvoiceVo siv = new InvoiceVo();
			siv.setContractno(contractno2);
			DataGridResultInfo sivResult = invoiceService.find(1, siv);
			@SuppressWarnings("unchecked")
			HashMap<String, String> sivMap= (HashMap<String, String>) sivResult.getFooter().get(0);
			dest.setSinvoice(sivMap.get("amount"));
			
			//支票合计
			CheckVo ch = new CheckVo();
			ch.setContractno(c.getContractno());
			DataGridResultInfo chResult = checkService.find(ch);
			@SuppressWarnings("unchecked")
			HashMap<String, String> chMap = (HashMap<String, String>) chResult.getFooter().get(0);
			dest.setCheck(chMap.get("incomeamount"));
			
			newList.add(dest);
		}

		// 取分页信息
		PageInfo<TbContract> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		DataGridResultInfo result = new DataGridResultInfo();

		// 身份
		// Subject subject = SecurityUtils.getSubject();
		// TbUser activeUser = (TbUser) subject.getPrincipal();
		// if ("admin".equalsIgnoreCase(activeUser.getPermission1())) {
		// 合计
		List<TbContract> listsum = contractMapper.selectByExample(example);
		BigDecimal totalAmount = new BigDecimal(0);
		for (TbContract t : listsum) {
			Double amount = t.getAmount();
			totalAmount = totalAmount.add(new BigDecimal(amount));
		}
		List<Map<String, String>> sum = new ArrayList<>();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("amount", totalAmount.setScale(2, BigDecimal.ROUND_HALF_UP).toString());
		map.put("contractno", "合计");
		sum.add(map);

		result.setFooter(sum);
		// }
		result.setTotal(total);
		result.setRows(newList);
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
		String contractno = vo.getContract().getContractno();
		String consumer = vo.getContract().getConsumer();
		BigDecimal bigDecimal = new BigDecimal(Double.toString(vo.getContract().getAmount())).setScale(2, BigDecimal.ROUND_HALF_UP);
		vo.getContract().setAmount(bigDecimal.doubleValue());
		TbContractExample example = new TbContractExample();
		cn.riverdream.pojo.TbContractExample.Criteria criteria = example.createCriteria();
		criteria.andSerialnoEqualTo(serialno);
		contractMapper.updateByExampleSelective(vo.getContract(), example);

		TbInvoiceExample invoiceExample = new TbInvoiceExample();
		cn.riverdream.pojo.TbInvoiceExample.Criteria criteria2 = invoiceExample.createCriteria();
		criteria2.andContractserialnoEqualTo(serialno);
		TbInvoice invoice = new TbInvoice();
		invoice.setContractno(contractno);
		invoice.setConsumer(consumer);
		invoiceMapper.updateByExampleSelective(invoice, invoiceExample);

		TbCheckExample checkExample = new TbCheckExample();
		cn.riverdream.pojo.TbCheckExample.Criteria criteria3 = checkExample.createCriteria();
		criteria3.andContractserialnoEqualTo(serialno);
		TbCheck check = new TbCheck();
		check.setContractno(contractno);
		check.setConsumer(consumer);
		checkMapper.updateByExampleSelective(check, checkExample);

	}

	@Override
	public TbContract findBySerialNo(int serialNo) {
		TbContractExample example = new TbContractExample();
		cn.riverdream.pojo.TbContractExample.Criteria criteria = example.createCriteria();
		criteria.andFlagEqualTo(1);
		criteria.andSerialnoEqualTo(serialNo);
		List<TbContract> list = contractMapper.selectByExample(example);
		TbContract contract = new TbContract();
		if (list != null && list.size() > 0) {
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

	@Override
	public TbContract findByContractNo(String contractNo) {
		TbContractExample example = new TbContractExample();
		cn.riverdream.pojo.TbContractExample.Criteria criteria = example.createCriteria();

		if (StringUtils.isNotBlank(contractNo)) {
			criteria.andContractnoEqualTo(contractNo);
		}
		criteria.andFlagEqualTo(1);
		List<TbContract> list = contractMapper.selectByExample(example);
		if (list == null || list.size() == 0) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public void changeFinish(TbContract contract) {
		Integer serialno = contract.getSerialno();
		Integer finish = contract.getFinish();
		TbContract ncontract = new TbContract();
		ncontract.setSerialno(serialno);
		ncontract.setFinish(finish);
		
		TbContractExample example = new TbContractExample();
		cn.riverdream.pojo.TbContractExample.Criteria criteria = example.createCriteria();
		criteria.andSerialnoEqualTo(serialno);
		contractMapper.updateByExampleSelective(ncontract, example);
	}

}
