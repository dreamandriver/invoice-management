package cn.riverdream.pojo;

import java.util.Date;

public class TbCheck {
    private Integer serialno;

    private String checkno;

    private Integer contractserialno;

    private Date incomedate;

    private Double incomeamount;

    private Integer taxpoint;

    private Double taxamount;

    private Double payamount;

    private Date paydate;

    private Double account;

    private String company;

    private Integer status;

    private String consumer;

    private String comment;

    private Date createdate;

    private Integer createuser;

    public Integer getSerialno() {
        return serialno;
    }

    public void setSerialno(Integer serialno) {
        this.serialno = serialno;
    }

    public String getCheckno() {
        return checkno;
    }

    public void setCheckno(String checkno) {
        this.checkno = checkno == null ? null : checkno.trim();
    }

    public Integer getContractserialno() {
        return contractserialno;
    }

    public void setContractserialno(Integer contractserialno) {
        this.contractserialno = contractserialno;
    }

    public Date getIncomedate() {
        return incomedate;
    }

    public void setIncomedate(Date incomedate) {
        this.incomedate = incomedate;
    }

    public Double getIncomeamount() {
        return incomeamount;
    }

    public void setIncomeamount(Double incomeamount) {
        this.incomeamount = incomeamount;
    }

    public Integer getTaxpoint() {
        return taxpoint;
    }

    public void setTaxpoint(Integer taxpoint) {
        this.taxpoint = taxpoint;
    }

    public Double getTaxamount() {
        return taxamount;
    }

    public void setTaxamount(Double taxamount) {
        this.taxamount = taxamount;
    }

    public Double getPayamount() {
        return payamount;
    }

    public void setPayamount(Double payamount) {
        this.payamount = payamount;
    }

    public Date getPaydate() {
        return paydate;
    }

    public void setPaydate(Date paydate) {
        this.paydate = paydate;
    }

    public Double getAccount() {
        return account;
    }

    public void setAccount(Double account) {
        this.account = account;
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

    public String getConsumer() {
        return consumer;
    }

    public void setConsumer(String consumer) {
        this.consumer = consumer == null ? null : consumer.trim();
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getCreateuser() {
        return createuser;
    }

    public void setCreateuser(Integer createuser) {
        this.createuser = createuser;
    }
}