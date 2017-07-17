package com.lh.controller;

import java.io.IOException;

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

	// 登陆页面的验证

	@RequestMapping("/login")
	public String Login(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String uname = request.getParameter("uname");
		String password = DigestUtils.md5Hex(request.getParameter("password"));
		User user = userService.findUserByName(uname);

		// if (user != null) {
		if (user.getPassword().equals(password)
				&& user.getUname().equals(uname)) {

			// Cookie cookie = new Cookie("uname", uname);
			// response.addCookie(cookie);
			request.getSession().setAttribute("currentUser", user);

			return "index1";
		} else {

			request.setAttribute("errorInfo", "用户名或密码错误！");
			return "login";
		}
		/**
		 * } else { // out.println(2); // 用户或密码不正确
		 * request.setAttribute("errorInfo", "用户名或密码错误！"); return "login"; }
		 */
	}

	// 退出操作
	@RequestMapping(value = "/loginout")
	public String loginout(HttpSession session) throws Exception {
		// 清除Session
		session.invalidate();
		return "index1";
	}

}
