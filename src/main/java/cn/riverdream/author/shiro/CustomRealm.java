package cn.riverdream.author.shiro;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import cn.riverdream.pojo.TbUser;
import cn.riverdream.service.UserService;

/**
 * 
 * <p>
 * Title: CustomRealm
 * </p>
 * <p>
 * Description:自定义realm
 * </p>
 */
public class CustomRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;

	// 得到一个realm的name
	@Override
	public String getName() {
		return "customRealm";
	}

	// 只支持UsernamePasswordToken token
	@Override
	public boolean supports(AuthenticationToken token) {
		// TODO Auto-generated method stub
		return token instanceof UsernamePasswordToken;
	}

	// 认证时调用doGetAuthenticationInfo方法获取用户身份信息
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		// token是用户输入的账号和密码
		// 获取subject的身份信息
		// subject认证时构造 token UsernamePasswordToken token = new
		// UsernamePasswordToken("zhang", "123");
		// "zhang"就是身份信息
		// 获取用户输入的账号
		String userId = (String) token.getPrincipal();
		// 根据输入的账号从数据库查询
		TbUser user = userService.findByUserId(userId);
		if (user == null) {
			// 如果从数据库查询不到用户
			return null;
		}
		// 执行到这里账号存在，开始校验密码
		// 查询数据库获取一个正确密码
		// 采用静态代码表示正确的密码，应该是md5加密后
		String password = user.getPassword();

		// 返回AuthenticationInfo 身份信息
		// 参数：1、身份信息即账号，实际系统定义pojo对象，第二个参数：密码，第三个参数：
		// 调用service获取用户的 身份信息activeUser
		// 将用户身份对象存入shiro框架simpleAuthenticationInfo中
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user, password, getName());

		return simpleAuthenticationInfo;
	}

	// 授权时调用doGetAuthorizationInfo获取权限数据
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 从数据库获取用户真实的权限数据
		// 获取用户身份信息
		// 获取主身份信息
		TbUser user = (TbUser) principals.getPrimaryPrincipal();

		// 根据账号从数据库查询用户的权限
		// ...
		// 使用静态数据表示从数据查询到权限数据

		List<String> premissions = new ArrayList<String>();

		// 将上边的静态数据改为从数据库获取
		// 这里不获取用户的菜单，只获取用户的权限标识符
		String permission1 = user.getPermission1();
		// 解析sysPermissions
		if (StringUtils.isNoneBlank(permission1)) {
			// 添加权限标识 符串
			premissions.add(permission1);
		}
		String permission2 = user.getPermission2();
		//解析sysPermissions
			if(StringUtils.isNoneBlank(permission2)){
				//添加权限标识 符串
				premissions.add(permission2);
			}
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		// 将从数据库查询到权限存储到SimpleAuthorizationInfo对象
		// 向simpleAuthorizationInfo添加权限标识 符必须不能为空
		simpleAuthorizationInfo.addStringPermissions(premissions);

		return simpleAuthorizationInfo;
	}

}
