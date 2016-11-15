package cn.riverdream.service;

import cn.riverdream.model.UserVo;
import cn.riverdream.pojo.TbContract;
import cn.riverdream.pojo.TbUser;
import cn.riverdream.utils.DataGridResultInfo;

public interface UserService {
	public Integer save( TbUser user);

	public DataGridResultInfo find(UserVo vo);

	public void delete(UserVo vo);
	
	public void update(UserVo vo);
	
	public TbUser findBySerialNo(int serialNo);
	
	public TbUser findByUserId(String userId);
}
