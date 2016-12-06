package cn.riverdream.model;

import cn.riverdream.pojo.TbContract;

public class Contract extends TbContract {

	private String cinvoice;

	private String sinvoice;

	private String check;

	public String getCinvoice() {
		return cinvoice;
	}

	public void setCinvoice(String cinvoice) {
		this.cinvoice = cinvoice;
	}

	public String getSinvoice() {
		return sinvoice;
	}

	public void setSinvoice(String sinvoice) {
		this.sinvoice = sinvoice;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}
}
