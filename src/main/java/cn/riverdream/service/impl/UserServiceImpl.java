package cn.riverdream.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.riverdream.mapper.TbUserMapper;
import cn.riverdream.model.UserVo;
import cn.riverdream.pojo.TbContract;
import cn.riverdream.pojo.TbUser;
import cn.riverdream.pojo.TbUserExample;
import cn.riverdream.pojo.TbUserExample.Criteria;
import cn.riverdream.service.UserService;
import cn.riverdream.utils.DataGridResultInfo;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private TbUserMapper userMapper;

	@Override
	public Integer save(TbUser user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DataGridResultInfo find(UserVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(UserVo vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(UserVo vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public TbContract findBySerialNo(int serialNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TbUser findByUserId(String userId) {
		TbUserExample example = new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridEqualTo(userId);
		List<TbUser> list = userMapper.selectByExample(example);
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	
}
