<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>登录</title>
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
					

				
					<form  method="post" action="${APP_PATH}/login.do" onsubmit="return checkForm()" class="fh5co-form animate-box" data-animate-effect="fadeInLeft">
						<h2>登录</h2>
						<div class="form-group">
						   <font color="red" id="error">${errorInfo }</font>
							<label for="uname" class="sr-only">用户名</label>
							<input type="text" class="form-control" id="uname" name="uname" placeholder="请输入用户名" autocomplete="off">
							
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">密码</label>
							<input type="password" class="form-control" id="password" name="password" placeholder="请输入用密码" autocomplete="off">
							</div>
						<div class="form-group">
							<label for="remember">
							<input class="Captcha" name="Captcha" maxlength="4" id="Captcha" placeholder="请输入验证码！" type="Captcha">
							</label>
							<img id="imgObj" src="${APP_PATH}/xuan/verifyCode"  width="160" height="40"></img>
							
						</div>
						<div class="form-group">
							<p>没有注册? <a href="toRegister">马上注册！</a> |</p>
						</div>
						<div class="form-group">
							<input type="submit" value="登录" class="btn btn-primary" >
						</div>
					 </form>  
					
					
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
	<script type="text/javascript">
  	
  	$('#imgObj').click(function() {
		location.reload();
	});

	function checkForm(){
	var uname=$("#uname").val();
	var password=$("#password").val();
	var Captcha=$("#Captcha").val();
	if(uname==null||uname==""){
		$("#error").html("用户名不能为空！");
		return false;
	}
	if(password==null||password==""){
		$("#error").html("密码不能为空！");
		return false;
	}
	if(Captcha==null||Captcha==""){
		$("#error").html("验证码不能为空！");
		return false;
	}
	return true;
}
	
	
  </script>
</html>
