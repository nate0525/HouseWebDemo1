package com.company.ssmdemo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.ssmdemo.pojo.User;
import com.company.ssmdemo.service.UserService;

@RequestMapping("user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("loginUI")
	public String loginUI(String cityid, Model model) {
		model.addAttribute("cityid", cityid);
		return "login";
	}

	@RequestMapping("login")
	public String login(User user, String cityid, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (cityid == null) {
			cityid = "guangzhou";
		}
		User loginByUser = userService.loginByUser(user);
		if (loginByUser != null) {
			request.getSession().setAttribute("user", loginByUser);
			response.sendRedirect("/mySSMdemo1/house/index.action?cityid=" + cityid);
		} else {
			model.addAttribute("loginErreo", "账号或密码错误,请重试");
			return "login";
		}
		return null;
	}

	@RequestMapping("register")
	public String register(User user, String cityid, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		if (user.getUserName() == null || user.getUserName().trim().length() == 0 || user.getUserPassWord() == null
				|| user.getUserPassWord().trim().length() == 0 || user.getUserPhone() == null
				|| user.getUserPhone().trim().length() != 11) {
			model.addAttribute("registerInfo", "注册失败!请重试");
			return "login";
		} else {
			int i = userService.checkUserByUser(user);

			if (i == 1) {
				int i2 = userService.registerByUser(user);
				if (i2 == 1) {
					model.addAttribute("registerInfo", "注册成功!去登陆吧");
				} else {
					model.addAttribute("registerInfo", "注册失败!请重试");
				}
			} else if (i == -1) {
				model.addAttribute("registerInfo", "用户名已被注册");
			} else if (i == -2) {
				model.addAttribute("registerInfo", "手机已被注册");
			}

			return "login";
		}
	}

	@RequestMapping("logOut")
	public void logOut(String cityid, HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (cityid == null) {
			cityid = request.getParameter("cityid");
		}
		if (cityid == null) {
			cityid = request.getParameter("queryVo.cityid");
		}
		if (cityid == null) {
			cityid = "guangzhou";
		}
		request.getSession().removeAttribute("user");

		response.sendRedirect("/mySSMdemo1/house/index.action?cityid=" + cityid);

	}


}
