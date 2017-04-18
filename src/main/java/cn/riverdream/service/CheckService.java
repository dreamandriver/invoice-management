package cn.riverdream.service;

import java.util.List;

import cn.riverdream.model.CheckVo;
import cn.riverdream.pojo.TbCheck;
import cn.riverdream.utils.DataGridResultInfo;

public interface CheckService {
	public Integer save( TbCheck check);

	public DataGridResultInfo find(CheckVo checkvo);
	
	public List<TbCheck> findAll(CheckVo checkvo);

	public void delete(CheckVo checkvo);
	
	public void update(CheckVo checkvo);
	
	public TbCheck findBySerialNo(int serialNo);

	public void changeFinish(TbCheck check);
}
