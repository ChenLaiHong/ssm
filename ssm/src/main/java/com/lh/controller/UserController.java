package com.lh.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lh.bean.User;
import com.lh.service.UserService;
import com.lh.utils.DateUtil;
import com.lh.utils.ResponseUtil;

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

		userService.updateByPrimaryKeySelective(user);

		return "redirect:/toMain";
	}

	/**
	 * 查询博主信息
	 * 
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/find/{uid}")
	public String find(@PathVariable("uid") Integer uid,
			HttpServletResponse response) throws Exception {
		User user = userService.find(uid);
		JSONObject jsonObject = JSONObject.fromObject(user);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
}
