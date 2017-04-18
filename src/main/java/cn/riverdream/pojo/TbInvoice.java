package cn.riverdream.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TbInvoice {
	private Integer serialno;

	private String invoiceno;

	private Integer invoicetype;

	private String contractno;

	private Integer contractserialno;

	private String consumer;

	private Date createdate;

	private Integer createuser;

	private Double amount;

	private String company;

	private Integer status;

	private String comment;

	private Date workdate;

	private Integer workuser;

	private Double taxpoint;

	private Double taxamount;

	private Integer finish;

	public Integer getFinish() {
		return finish;
	}

	public void setFinish(Integer finish) {
		this.finish = finish;
	}

	public Integer getSerialno() {
		return serialno;
	}

	public void setSerialno(Integer serialno) {
		this.serialno = serialno;
	}

	public String getInvoiceno() {
		return invoiceno;
	}

	public void setInvoiceno(String invoiceno) {
		this.invoiceno = invoiceno == null ? null : invoiceno.trim();
	}

	public Integer getInvoicetype() {
		return invoicetype;
	}

	public void setInvoicetype(Integer invoicetype) {
		this.invoicetype = invoicetype;
	}

	public String getContractno() {
		return contractno;
	}

	public void setContractno(String contractno) {
		this.contractno = contractno == null ? null : contractno.trim();
	}

	public Integer getContractserialno() {
		return contractserialno;
	}

	public void setContractserialno(Integer contractserialno) {
		this.contractserialno = contractserialno;
	}

	public String getConsumer() {
		return consumer;
	}

	public void setConsumer(String consumer) {
		this.consumer = consumer == null ? null : consumer.trim();
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getCreatedatestr() {
		SimpleDateFormat formatter;
		formatter = new SimpleDateFormat("yyyy-MM-dd");
		String ctime = formatter.format(this.createdate);
		return ctime;
	}

	public Integer getCreateuser() {
		return createuser;
	}

	public void setCreateuser(Integer createuser) {
		this.createuser = createuser;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company == null ? null : company.trim();
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment == null ? null : comment.trim();
	}

	public Date getWorkdate() {
		return workdate;
	}

	public void setWorkdate(Date workdate) {
		this.workdate = workdate;
	}

	public Integer getWorkuser() {
		return workuser;
	}

	public void setWorkuser(Integer workuser) {
		this.workuser = workuser;
	}

	public Double getTaxpoint() {
		return taxpoint;
	}

	public void setTaxpoint(Double taxpoint) {
		this.taxpoint = taxpoint;
	}

	public Double getTaxamount() {
		return taxamount;
	}

	public void setTaxamount(Double taxamount) {
		this.taxamount = taxamount;
	}
}