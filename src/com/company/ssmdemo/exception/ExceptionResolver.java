package com.company.ssmdemo.exception;

/**
 * 异常处理类
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class ExceptionResolver implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object arg2,
			Exception ex) {
		String result = "服务器出错了...请稍后再刷新";
		if (ex instanceof MyException) {
			result = ((MyException) ex).getMsg();
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", result);
		mav.setViewName("msg");
		return mav;
	}

}
