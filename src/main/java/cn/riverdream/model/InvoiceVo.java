package cn.riverdream.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import cn.riverdream.pojo.TbContract;
import cn.riverdream.pojo.TbInvoice;

public class InvoiceVo {

	private Integer serialno;

	private TbInvoice invoice;

	private TbContract contract;
	
	private String consumer;
	
	private String contractno;

	private String invoiceno;

	private Date startDate;

	private Date endDate;

	private int page;

	private int rows;

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

	public TbContract getContract() {
		return contract;
	}

	public void setContract(TbContract contract) {
		this.contract = contract;
	}

	public Integer getSerialno() {
		return serialno;
	}

	public void setSerialno(Integer serialno) {
		this.serialno = serialno;
	}

	public TbInvoice getInvoice() {
		return invoice;
	}

	public void setInvoice(TbInvoice invoice) {
		this.invoice = invoice;
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

	public String getInvoiceno() {
		return invoiceno;
	}

	public void setInvoiceno(String invoiceno) {
		this.invoiceno = invoiceno;
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

}
