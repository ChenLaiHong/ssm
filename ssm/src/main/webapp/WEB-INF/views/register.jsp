<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>注册</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	

  <%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/static/css/animate.css">
	<link rel="stylesheet" href="${APP_PATH}/static/css/style1.css">

	<!-- Modernizr JS -->
	<script src="${APP_PATH}/static/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="${APP_PATH}/static/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body class="style-2">

		<div class="container">
			
			<div class="row">
				<div class="col-md-4">
					

					<!-- Start Sign In Form -->
					<form method="post" action="${APP_PATH}/zhucecaozuo.do" onsubmit="return zhucecaozuo();" class="fh5co-form animate-box" data-animate-effect="fadeInLeft">
						<h2>注册</h2>
						<div class="form-group">
							<div class="alert alert-success" role="alert">Welcome register for this website!</div>
						</div>
						<div class="form-group">
							<label for="name" class="sr-only">*用户名</label>
							<input type="text" class="form-control" name="uname" id="uname" placeholder="Name" autocomplete="off">
							<font id="unametishi" color="red">
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">*密码</label>
							<input type="password" class="form-control" name="password" id="password" placeholder="Password" autocomplete="off">
							<font id="passwordtishi" color="red"></font>
						</div>
						<div class="form-group">
							<label for="email" class="sr-only">邮箱</label>
							<input type="email" class="form-control" name="email" id="email" placeholder="Email" autocomplete="off">
							<font id="emailtishi" color="red"></font>
						</div>
						<div class="form-group">
							<label class="radio-inline">
  								<input type="radio" name="sex" id="sex1" value="0"> 男
							</label>
							<label class="radio-inline">
  								<input type="radio" name="sex" id="sex2" value="1"> 女
							</label>
						</div>
						<div class="form-group">
							<label for="phone" class="sr-only">*手机号</label>
							<input type="text" name="phone" id="phone" placeholder="请输入手机号码" /><font
								id="phonetishi"></font><br> <input type="text" id="yanzhengma" name="yanzhengma"
								placeholder="请输入验证码" /><input type="button" disabled="true" id="btn"
								value="免费获取验证码" onclick="settime(this)" /><font id="yanzhengmatishi" color="red"></font>
						</div>
						
						
						<div class="form-group">
							<p>已经注册? <a href="toLogin">登录</a></p>
						</div>
						<div class="form-group">
							<input type="submit" value="注册" class="btn btn-primary" id="user_save">
							<font color="red" id="xxx"></font>
						</div>
					</form>
					<!-- END Sign In Form -->


				</div>
			</div>
			<div class="row" style="padding-top: 60px; clear: both;">
				<div class="col-md-12 text-center"><p><small>&copy; All Rights Reserved. More Templates - Collect from </small></p></div>
			</div>
		</div>
	
	<!-- jQuery -->
	<script src="${APP_PATH}/static/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="${APP_PATH}/static/js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="${APP_PATH}/static/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="${APP_PATH}/static/js/main.js"></script>

	</body>
	
	<script>
	var yanzhengma=null;
	$("#uname").keyup(function() {
		var u = this.value;
		$.ajax({
			url : '${APP_PATH}/zhuceyanzhenguname', //要请求的地址
			//参数
			data : "uname="+u,
			type : "POST",	
			
			success : function(data) {	
					
				if(data=="1"){
				$("#unametishi").css("color", "green");
				$("#unametishi").html('√该用户可以注册!');
				}
				if(data=="2"){
				$("#unametishi").css("color","red");
				$("#unametishi").html('×该用户已存在!');
				}			

			}
		});
	});
	
	$("#password").keyup(function(){
		var p=$(this).val();
		if(p &&  /[0-9A-Za-z]/.test(p)){
			$("#passwordtishi").css("color", "green");
			$("#passwordtishi").html('√密码验证通过!');
		}else{
			$("#passwordtishi").css("color", "red");
			$("#passwordtishi").html('×密码格式只允许用字母和数字!');
		}
	});
	
	$("#email").keyup(function(){
		var e=$(this).val();
		if(e &&  /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/.test(e)){
			$("#emailtishi").css("color", "green");
			$("#emailtishi").html('√邮箱通过!');
		}else{
			$("#emailtishi").css("color", "red");
			$("#emailtishi").html('×邮箱格式不正确!');
		}
	});
	$("#phone").keyup(function() {
		var phone = $("#phone").val();
		if (phone && /^1[3|4|5|8]\d{9}$/.test(phone)) {
			$("#btn").removeAttr("disabled");
			$("#phonetishi").css("color", "green");
			$("#phonetishi").html('√手机格式正确!');
		} else {
			$("#btn").attr("disabled", "disabled");
			$("#phonetishi").css("color", "red");
			$("#phonetishi").html('×手机格式不对!');
		}
		
	});
	
	
	$("#yanzhengma").keyup(function() {
		var v = $("#yanzhengma").val();
		if(v==yanzhengma){
			$("#yanzhengmatishi").css("color", "green");
			$("#yanzhengmatishi").html('√验证码正确!');
		}else{
			$("#yanzhengmatishi").css("color", "red");
			$("#yanzhengmatishi").html('×验证码不对!');
		}
	});
	
	
	
	$("#btn").click(function() {
		/* 获取手机号码验证 */
		var phone = $("#phone").val();
		$.ajax({
			url : '${APP_PATH}/shoujiyanzhengma', //要请求的地址
			//参数
			data : {
				phone : phone,
			},
			success : function(data) {			
				yanzhengma=data;
			}
		});
	});
</script>

<!-- 验证码倒计时 -->
<script type="text/javascript">
	var countdown = 60;
	function settime(obj) {

		if (countdown == 0) {
			obj.removeAttribute("disabled");
			obj.value = "免费获取验证码";
			countdown = 60;

			return;
		} else {

			obj.setAttribute("disabled", true);
			obj.value = "重新发送(" + countdown + ")";
			countdown--;
		}
		setTimeout(function() {
			settime(obj)
		}, 1000)
	}
	
	function zhucecaozuo(){
		if($('#unametishi').html()=="√该用户可以注册!" && $('#passwordtishi').html()=="√密码验证通过!" && $('#yanzhengmatishi').html()=="√验证码正确!"){
			return true;
		}
		$("#xxx").html('有验证没通过！');
		return false;
	}
	
	$("#user_save").click(function(){
		$.ajax({
			url : '${APP_PATH}/zhucecaozuo',
			type:"POST", 
			data:$("form").serialize(),
			
		});
	});
	
</script>
</html>

