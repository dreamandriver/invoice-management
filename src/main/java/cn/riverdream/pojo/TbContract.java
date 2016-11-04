package cn.riverdream.pojo;

import java.util.Date;

public class TbContract {
    private Integer serialno;

    private String contractno;

    private Integer createruserid;

    private Date createdate;

    private String consumerid;

    private Double amount;

    private String company;

    private String comment;

    private Integer ifformal;

    private Integer flag;

    public Integer getSerialno() {
        return serialno;
    }

    public void setSerialno(Integer serialno) {
        this.serialno = serialno;
    }

    public String getContractno() {
        return contractno;
    }

    public void setContractno(String contractno) {
        this.contractno = contractno == null ? null : contractno.trim();
    }

    public Integer getCreateruserid() {
        return createruserid;
    }

    public void setCreateruserid(Integer createruserid) {
        this.createruserid = createruserid;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getConsumerid() {
        return consumerid;
    }

    public void setConsumerid(String consumerid) {
        this.consumerid = consumerid == null ? null : consumerid.trim();
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public Integer getIfformal() {
        return ifformal;
    }

    public void setIfformal(Integer ifformal) {
        this.ifformal = ifformal;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
}