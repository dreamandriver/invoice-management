package cn.riverdream.utils;

import java.util.ArrayList;
import java.util.List;
/**
 * 数据查询列表结果
 * @author Thinkpad
 *
 */
public class DataGridResultInfo implements ProcessResult {
	
	public DataGridResultInfo(){}

	
	//总条数
	private long total;
	
	//结果集
	private List rows = new ArrayList();
	
	

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

	
	
	
}
