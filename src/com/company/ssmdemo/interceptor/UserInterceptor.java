package com.company.ssmdemo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 自定义拦截器
 * 
 * @author Steven
 *
 */
public class UserInterceptor implements HandlerInterceptor {

	// 在preHandle执行后执行,第3个运行
	// 只要preHandle通过就会被执行
	// 方法执行后被执行
	// 处理异常，清资源，记录日志等等
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		//System.out.println("MyInterceptor.afterCompletion.......");
	}

	// 在preHandle执行后执行,第2个运行
	// 方法执行之后，返回ModelAndView之前被执行
	// 设置页面的共用参数等等
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		//System.out.println("MyInterceptor.postHandle.......");
	}

	// 预处理方法,第1个运行
	// 进入方法前被执行
	// 登录拦截，权限验证等等
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {

		if (request.getSession().getAttribute("user") != null) {
			// true放行,false拦截
			return true;
		} else {
			request.setAttribute("msg", "你必须登录账号才能继续操作");
			response.sendRedirect(request.getContextPath()+"/user/loginUI.action");
			return false;
		}

	}

}
