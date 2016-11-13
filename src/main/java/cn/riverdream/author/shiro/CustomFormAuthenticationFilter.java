package cn.riverdream.author.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CustomFormAuthenticationFilter extends FormAuthenticationFilter {

	private static final Logger log = LoggerFactory
			.getLogger(CustomFormAuthenticationFilter.class);

	// 重写两个方法
	// 访问拦截方法
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		if (isLoginRequest(request, response)) {
			if (isLoginSubmission(request, response)) {//执行post请求login.action
				if (log.isTraceEnabled()) {
					log.trace("Login submission detected.  Attempting to execute login.");
				}
				
				//校验验证码
				//获取页面提交的验证码
				String validateCode = httpServletRequest.getParameter("validateCode");
				//从session中取出正确的验证码
				HttpSession session = httpServletRequest.getSession();
				String validateCode_session = (String) session.getAttribute("validateCode");
				//页面请求和session的验证码比较
				if(!validateCode_session.equals(validateCode)){
					//将验证码失败信息写入request域
					httpServletRequest.setAttribute("shiroLoginFailure", "randomCodeError");
					//重定向到登陆login.action
					return true;
				}
				
				
				return executeLogin(request, response);
			} else {
				if (log.isTraceEnabled()) {
					log.trace("Login page view.");
				}
				// allow them to see the login page ;)
				//判断当前请求是ajax，返回一个json，提示用户“当前的操作需要登陆后继续”
			  if (!"XMLHttpRequest".equalsIgnoreCase(httpServletRequest
        				.getHeader("X-Requested-With"))) {//如果非ajax请求，重定向到页面
        			return true;
        		} else {//如果是ajax，返回一个json，提示用户“当前的操作需要登陆后继续”
        			response.setCharacterEncoding("utf-8");
        			response.setContentType("application/json;charset=utf-8");
        			response.getWriter().write("{\"resultInfo\":{\"type\":\"1\",\"messageCode\":\"106\",\"message\":\"您的操作需要登陆后继续\"}}");
        			return false;
        		}

			}
		} else {
			if (log.isTraceEnabled()) {
				log.trace("Attempting to access a path which requires authentication.  Forwarding to the "
						+ "Authentication url [" + getLoginUrl() + "]");
			}

			saveRequestAndRedirectToLogin(request, response);
			return false;
		}
	}

	// 认证成功调用的方法
	protected boolean onLoginSuccess(AuthenticationToken token,
			Subject subject, ServletRequest request, ServletResponse response)
			throws Exception {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		//注意屏蔽此方法，不使用重定向方法
//		issueSuccessRedirect(request, response);
		
		//如果请求是一个ajax请求，转json
		if("XMLHttpRequest".equals(httpServletRequest.getHeader("X-Requested-With"))){
			//构造 一个成功，转json输出
			//ajax请求
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");//指定输出的格式为json
			response.getWriter().write("{\"resultInfo\":{\"type\":\"1\",\"messageCode\":\"906\",\"message\":\"登陆成功\"}}");
			
			return false;
		}else{
			//调用父类方法进行重定向
			return super.onLoginSuccess(token, subject, httpServletRequest, response);
			
		}
		
	}
}
