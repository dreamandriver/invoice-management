package cn.riverdream.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.riverdream.utils.ResultInfo;
import cn.riverdream.utils.ResultUtil;

@Controller
public class BaseController {

	@RequestMapping("/base")
	public String toBasePage(Model model) {
		model.addAttribute("version_number", "1.0");
		model.addAttribute("version_date", "2016年11月14日");
		return "base/first";
	}

	@RequestMapping("/welcome")
	public String toWelcomPage(Model model) {
		return "base/welcome";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String tologin(Model model) {
		return "base/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public ResultInfo login(Model model, String usercode, String pwd, String validateCode, HttpServletRequest request) {
		String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
		ResultInfo info =null;
		if (exceptionClassName != null) {
			if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
				// 账号不存在
				info = ResultUtil.createFail("账号不存在", ResultInfo.TYPE_RESULT_FAIL);
			} else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
				// 用户名或密码 错误
				info =  ResultUtil.createFail("用户名或密码错误", ResultInfo.TYPE_RESULT_FAIL);
			} else if ("randomCodeError".equals(exceptionClassName)) {
				// 验证码错误
				info =  ResultUtil.createFail("验证码错误", ResultInfo.TYPE_RESULT_FAIL);
			} else {
				// 最终在异常处理器生成未知错误
				info =  ResultUtil.createFail("未知错误", ResultInfo.TYPE_RESULT_FAIL);
			}
		}
		return info;
	}
	
	@RequestMapping("/logout")
	public String toLogout(Model model) {
		return "base/welcome";
	}
}
