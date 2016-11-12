package cn.riverdream.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TbContract {
    private Integer serialno;

    private String contractno;

    private Integer createruserid;

    private Date createdate;

    private String consumer;

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
    
    public String getCreatedatestr(){
    	SimpleDateFormat formatter; 
        formatter = new SimpleDateFormat ("yyyy-MM-dd"); 
        String ctime = formatter.format(this.createdate); 
        return ctime;
    }

    public String getConsumer() {
        return consumer;
    }

    public void setConsumer(String consumer) {
        this.consumer = consumer == null ? null : consumer.trim();
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