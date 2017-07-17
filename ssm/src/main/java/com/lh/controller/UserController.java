package com.lh.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lh.bean.User;
import com.lh.service.UserService;
import com.lh.utils.DateUtil;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/save")
	public String save(@RequestParam("imageFile") MultipartFile imageFile,
			User user, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (!imageFile.isEmpty()) {
			String filePath = request.getServletContext().getRealPath("/");
			String imageName = DateUtil.getCurrentDateStr() + "."
					+ imageFile.getOriginalFilename().split("\\.")[1];
			imageFile.transferTo(new File(filePath + "static/userImages/"
					+ imageName));
			user.setImageName(imageName);
		}
		/**
		 * int resultTotal = userService.update(user); StringBuffer result = new
		 * StringBuffer(); if (resultTotal > 0) { result.append(
		 * "<script language='javascript'>alert('修改成功！');</script>"); } else {
		 * result
		 * .append("<script language='javascript'>alert('修改失败！');</script>"); }
		 * ResponseUtil.write(response, result);
		 */
		return null;
	}
}
