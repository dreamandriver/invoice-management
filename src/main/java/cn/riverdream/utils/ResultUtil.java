package cn.riverdream.utils;

import java.util.List;

/**
 * 系统结果工具类
 * @author mrt
 *
 */
public class ResultUtil {

	
	  /**
     * 创建错误结果
     * @param MESSAGE
     * @return
     */
    public static ResultInfo createFail(String message,int messageCode){
    	return new ResultInfo(ResultInfo.TYPE_RESULT_FAIL,messageCode,message);
    }
    /**
     * 创建敬告提示结果
     */
    public static ResultInfo createWarning(String message,int messageCode){
    	return new ResultInfo(ResultInfo.TYPE_RESULT_WARN,messageCode,message);
    }
    
    /**
     * 创建成功提示结果
     */
    public static ResultInfo createSuccess(String message,int messageCode){
    	
    	return new ResultInfo(ResultInfo.TYPE_RESULT_SUCCESS,messageCode,message);
    }
    
    
    
    /**
     * 创建普通信息提示结果
     */
    public static ResultInfo createInfo(String message,int messageCode){
    	
    	return new ResultInfo(ResultInfo.TYPE_RESULT_INFO,messageCode,message);
    }
    
	/**
	 * 创建提交结果信息
	 * @param resultInfo
	 * @return
	 */
	public static SubmitResultInfo createSubmitResult(ResultInfo resultInfo){
		return new SubmitResultInfo(resultInfo);
	}
	/**
	 * 创建提交结果信息，包括明细信息
	 * @param resultInfo
	 * @param details
	 * @return
	 */
	public static SubmitResultInfo createSubmitResult(ResultInfo resultInfo,List<ResultInfo> details){
		if(resultInfo != null){
			resultInfo.setDetails(details);
		}
		return new SubmitResultInfo(resultInfo);
	}
	
	@SuppressWarnings("rawtypes")
	public static DataGridResultInfo createDataGridResultInfo(int page,long total,List rows){
		DataGridResultInfo dataGridResultInfo = new DataGridResultInfo();
		dataGridResultInfo.setRows(rows);
		dataGridResultInfo.setTotal(total);
		return dataGridResultInfo;
	}
	
}
