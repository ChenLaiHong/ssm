package com.lh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lh.bean.User;
import com.lh.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;

	// 前台 登陆页面的验证

	@RequestMapping("/login")
	public String Login(HttpServletRequest request,
			HttpServletResponse response, HttpSession httpSession)
			throws Exception {

		String uname = request.getParameter("uname");
		String password = DigestUtils.md5Hex(request.getParameter("password"));
		String validate = request.getParameter("Captcha");
		User user = userService.findUserByName(uname);
		if (user.getPassword().equals(password)
				&& user.getUname().equals(uname)) {
			if (validate.equals((String) httpSession
					.getAttribute("validateCode"))) {
				request.getSession().setAttribute("currentUser", user);
				return "redirect:/types";//
				// 如果验证通过了就去indexController中执行types后去到index1页面也就是主页面
			} else {
				request.setAttribute("errorInfo", "验证码错误！");
				return "login";
			}
		} else {

			request.setAttribute("errorInfo", "用户名或密码错误！");
			return "login";
		}

	}

	// 前台退出操作
	@RequestMapping(value = "/loginout")
	public String loginout(HttpSession session) throws Exception {
		// 清除Session
		session.invalidate();
		return "redirect:/types";
	}

	@RequestMapping("/adminLogin")
	public String adminLogin(HttpServletRequest request,
			HttpServletResponse response) {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		if (!userName.equals("admin") && !password.equals("admin")) {
			request.setAttribute("errorInfo", "用户名或密码错误！");
			return "adminLogin";
		} else {
			request.getSession().setAttribute("admin", userName);
			return "adminMain";// 去后台的主页
		}

	}

	// 后台退出操作
	@RequestMapping(value = "/adminLoginout")
	public String adminLoginout(HttpSession session) throws Exception {
		// 清除Session
		session.removeAttribute("admin");
		return "redirect:/adminLogin.jsp";
	}
}
