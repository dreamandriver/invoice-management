package cn.riverdream.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import cn.riverdream.pojo.TbContract;

public class ContractVo {

	private int serialno;

	private TbContract contract;

	private String contractno;

	private String consumer;

	private String company;
	
	private String projectname;
	
	//是否正式合同 0=否,1=是
	private String ifformal;
	
	//是否完成  1=完成; 0=未完成
	private String createruserid;

	public String getIfformal() {
		return ifformal;
	}

	public void setIfformal(String ifformal) {
		this.ifformal = ifformal;
	}

	public String getCreateruserid() {
		return createruserid;
	}

	public void setCreateruserid(String createruserid) {
		this.createruserid = createruserid;
	}

	private Date startDate;

	private Date endDate;

	private int page;

	private int rows;

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public int getSerialno() {
		return serialno;
	}

	public void setSerialno(int serialno) {
		this.serialno = serialno;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getContractno() {
		return contractno;
	}

	public void setContractno(String contractno) {
		this.contractno = contractno;
	}

	public String getConsumer() {
		return consumer;
	}

	public void setConsumer(String consumer) {
		this.consumer = consumer;
	}

	public Date getStart() {
		return startDate;
	}

	public void setStart(String start) {
		SimpleDateFormat formatter;
		formatter = new SimpleDateFormat("yyyy/MM/dd");
		try {
			this.startDate = formatter.parse(start);
		} catch (ParseException e) {
			this.startDate = null;
		}

	}

	public Date getEnd() {
		return endDate;
	}

	public void setEnd(String end) {
		SimpleDateFormat formatter;
		formatter = new SimpleDateFormat("yyyy/MM/dd");
		try {
			this.endDate = formatter.parse(end);
		} catch (ParseException e) {
			this.endDate = null;
		}
	}

	public TbContract getContract() {
		return contract;
	}

	public void setContract(TbContract contract) {
		this.contract = contract;
	}

}
