package cn.riverdream.service;

import cn.riverdream.model.ContractVo;
import cn.riverdream.pojo.TbContract;
import cn.riverdream.utils.DataGridResultInfo;

public interface ContractService {
	public Integer save( TbContract contract);

	public DataGridResultInfo find(ContractVo contractvo);

	public void delete(ContractVo contractvo);
	
	public void update(ContractVo contractvo);
	
	public TbContract findBySerialNo(int serialNo);
}
