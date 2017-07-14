package com.lh.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lh.bean.User;
import com.lh.service.UserService;

@Controller
public class RegisterController {

	@Autowired
	UserService userService;

	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

	// 判断用户名是否存在数据库
	@RequestMapping("/zhuceyanzhenguname")
	@ResponseBody
	public String zhuceyanzheng(@RequestParam("uname") String uname) {
		boolean b = userService.selectuname(uname);
		if (b) {
			return "1";
		} else {
			return "2";
		}
	}

	// 手机验证码验证
	@RequestMapping("/shoujiyanzhengma")
	@ResponseBody
	public String shoujiyanzhengma(@RequestParam(value = "phone") String phone) {

		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod(Url);

		client.getParams().setContentCharset("GBK");
		method.setRequestHeader("ContentType",
				"application/x-www-form-urlencoded;charset=GBK");

		int mobile_code = (int) ((Math.random() * 9 + 1) * 100000);

		String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");

		NameValuePair[] data = {// 提交短信
				new NameValuePair("account", "C43454848"),
				new NameValuePair("password",
						"46ea2bdefb105a2ec5da62e8c8d803af"), // 查看密码请登录用户中心->验证码、通知短信->帐户及签名设置->APIKEY
				// new NameValuePair("password",
				// util.StringUtil.MD5Encode("密码")),
				new NameValuePair("mobile", phone),
				new NameValuePair("content", content), };
		method.setRequestBody(data);

		try {
			client.executeMethod(method);

			String SubmitResult = method.getResponseBodyAsString();

			// System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();

			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");

			System.out.println(mobile_code);
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);

			if ("2".equals(code)) {
				System.out.println("短信提交成功");
			}

		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mobile_code + "";
	}

	// 注册操作
	@RequestMapping(value = "/zhucecaozuo", method = RequestMethod.POST)
	@ResponseBody
	public String zhucecaozuo(HttpServletRequest request, User user) {
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		userService.insertuser(user);
		request.setAttribute("msg", "注册成功！");
		return "views/login.jsp";
	}

}
