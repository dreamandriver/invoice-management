package cn.riverdream.service;

import cn.riverdream.model.CheckVo;
import cn.riverdream.pojo.TbCheck;
import cn.riverdream.utils.DataGridResultInfo;

public interface CheckService {
	public Integer save( TbCheck check);

	public DataGridResultInfo find(CheckVo checkvo);

	public void delete(CheckVo checkvo);
	
	public void update(CheckVo checkvo);
	
	public TbCheck findBySerialNo(int serialNo);
}
