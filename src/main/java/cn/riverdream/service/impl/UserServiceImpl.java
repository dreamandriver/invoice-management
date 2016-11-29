package cn.riverdream.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.riverdream.mapper.TbUserMapper;
import cn.riverdream.model.UserVo;
import cn.riverdream.pojo.TbUser;
import cn.riverdream.pojo.TbUserExample;
import cn.riverdream.pojo.TbUserExample.Criteria;
import cn.riverdream.service.UserService;
import cn.riverdream.utils.DataGridResultInfo;
import cn.riverdream.utils.MD5;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private TbUserMapper userMapper;

	@Override
	public Integer save(TbUser user) {
		MD5 m = new MD5();
		String password = user.getPassword();
		String pwd = m.getMD5ofStr(password);
		user.setPassword(pwd);
		userMapper.insert(user);
		return user.getSerialno();
	}

	@Override
	public DataGridResultInfo find(UserVo vo) {
		
		int page = vo.getPage();
		int rows = vo.getRows();
		
		TbUserExample example = new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUseridNotEqualTo("");
		
		PageHelper.startPage(page, rows);
		List<TbUser> list = userMapper.selectByExample(example);
		
		// 取分页信息
		PageInfo<TbUser> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		
		DataGridResultInfo result = new DataGridResultInfo();
		result.setTotal(total);
		result.setRows(list);
		return result;
	}

	@Override
	public void delete(UserVo vo) {
		Integer serialno = vo.getSerialno();
		userMapper.deleteByPrimaryKey(serialno);
	}

	@Override
	public void update(UserVo vo) {
		
		TbUser user = vo.getUser();
		MD5 m = new MD5();
		String password = user.getPassword();
		String pwd = m.getMD5ofStr(password);
		user.setPassword(pwd);
		if(StringUtils.isBlank(user.getPermission1())){
			user.setPermission1("");
		}
		if(StringUtils.isBlank(user.getPermission2())){
			user.setPermission2("");
		}
		userMapper.updateByPrimaryKey(user);
		
		
	}

	@Override
	public TbUser findBySerialNo(int serialNo) {
		TbUser user = userMapper.selectByPrimaryKey(serialNo);
		return user;
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
