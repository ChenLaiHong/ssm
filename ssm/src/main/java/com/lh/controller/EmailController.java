package com.lh.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lh.utils.JavaEmailSender;

@Controller
@RequestMapping("/admin/email")
public class EmailController {

	/**
	 * 跳转到发送邮件页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goSendEmail")
	public ModelAndView goSendEmail(
			@RequestParam(value = "email", required = false) String email,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = this.getModelAndView();
		// String email = request.getParameter("email");
		if (email != null && !"".equals(email)) {
			email = email.trim();
			mv.setViewName("send_email");
			mv.addObject("email", email);
		}
		return mv;
	}

	/**
	 * 发送邮件
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sendEmail", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object sendEmail(HttpServletRequest request) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		String msg = "ok"; // 发送状态
		String toEMAIL = request.getParameter("EMAIL"); // 对方邮箱
		String TITLE = request.getParameter("TITLE"); // 标题
		String CONTENT = request.getParameter("CONTENT"); // 内容
		JavaEmailSender.sendEmail(toEMAIL, TITLE, CONTENT);
		map.put("result", msg);
		return map;
	}

	public ModelAndView getModelAndView() {
		return new ModelAndView();
	}

}
