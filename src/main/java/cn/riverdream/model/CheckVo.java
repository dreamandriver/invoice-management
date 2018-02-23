package cn.riverdream.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import cn.riverdream.pojo.TbCheck;
import cn.riverdream.pojo.TbContract;

public class CheckVo {

	private Integer serialno;

	private TbCheck Check;

	private TbContract contract;

	private String consumer;

	private String company;

	private String contractno;

	private String checkno;

	private Date instartDate;

	private Date inendDate;

	private Date outstartDate;

	private Date outendDate;

	private int page;

	private int rows;
	
	private String invoiceids;

	public String getInvoiceids() {
		return invoiceids;
	}

	public void setInvoiceids(String invoiceids) {
		this.invoiceids = invoiceids;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Integer getSerialno() {
		return serialno;
	}

	public void setSerialno(Integer serialno) {
		this.serialno = serialno;
	}

	public TbContract getContract() {
		return contract;
	}

	public void setContract(TbContract contract) {
		this.contract = contract;
	}

	public String getConsumer() {
		return consumer;
	}

	public void setConsumer(String consumer) {
		this.consumer = consumer;
	}

	public String getContractno() {
		return contractno;
	}

	public void setContractno(String contractno) {
		this.contractno = contractno;
	}

	public String getCheckno() {
		return checkno;
	}

	public void setCheckno(String checkno) {
		this.checkno = checkno;
	}

	public Date getInstart() {
		return instartDate;
	}

	public void setInstart(String instart) {
		SimpleDateFormat formatter;
		formatter = new SimpleDateFormat("yyyy/MM/dd");
		try {
			this.instartDate = formatter.parse(instart);
		} catch (ParseException e) {
			this.instartDate = null;
		}
	}

	public Date getInend() {
		return inendDate;
	}

	public void setInend(String inend) {
		SimpleDateFormat formatter;
		formatter = new SimpleDateFormat("yyyy/MM/dd");
		try {
			this.inendDate = formatter.parse(inend);
		} catch (ParseException e) {
			this.inendDate = null;
		}
	}

	public Date getOutstart() {
		return outstartDate;
	}

	public void setOutstart(String outstart) {
		SimpleDateFormat formatter;
		formatter = new SimpleDateFormat("yyyy/MM/dd");
		try {
			this.outstartDate = formatter.parse(outstart);
		} catch (ParseException e) {
			this.outstartDate = null;
		}
	}

	public Date getOutend() {
		return outendDate;
	}

	public void setOutend(String outend) {
		SimpleDateFormat formatter;
		formatter = new SimpleDateFormat("yyyy/MM/dd");
		try {
			this.outendDate = formatter.parse(outend);
		} catch (ParseException e) {
			this.outendDate = null;
		}
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

	public TbCheck getCheck() {
		return Check;
	}

	public void setCheck(TbCheck check) {
		Check = check;
	}

}
