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
	
	private Date startDate;
	
	private Date endDate;
	
	private int page;
	
	private int rows;
	
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
        formatter = new SimpleDateFormat ("yyyy/MM/dd"); 
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
        formatter = new SimpleDateFormat ("yyyy/MM/dd"); 
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
