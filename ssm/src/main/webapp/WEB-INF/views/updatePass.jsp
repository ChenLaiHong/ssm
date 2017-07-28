<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/css/style2.css" />

<!-- modernizr enables HTML5 elements and feature detects -->
<script type="text/javascript"
	src="${APP_PATH}/static/js/modernizr-1.5.min.js"></script>
</head>
<body>
<div id="main">

		<jsp:include page="/common/menu.jsp" />

		<div id="site_content">
			<jsp:include page="/common/photo.jsp" />

			<div id="content">
	<form method="post" action="${APP_PATH}/user/updatePass.do"
		onsubmit="return checkForm()" class="fh5co-form animate-box"
		data-animate-effect="fadeInLeft">
	<table cellspacing="8px">
		<h2>修改密码(下一次登录生效)</h2>
		<tr>
			<td>用户名：</td>
			<td><input type="text" id="uname" name="uname"
				readonly="readonly" value="${currentUser.uname }"
				style="width: 200px" />
			</td>
		</tr>
		<tr>
			<td>新密码：</td>
			<td><input type="password" id="newPassword" name="newPassword"
				class="easyui-validatebox" required="true" style="width: 200px" />
			</td>
		</tr>
		<tr>
			<td>确认新密码：</td>
			<td><input type="password" id="newPassword2" name="newPassword2"
				class="easyui-validatebox" required="true" style="width: 200px" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="提交" class="btn btn-primary" >
			</td>
		</tr>
	</table>
	</form>
	</div>
		</div>

		<jsp:include page="/common/foot.jsp" />

	</div>
	
	<p>&nbsp;</p>
	<!-- javascript at the bottom for fast page loading -->
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/js/jquery.easing-sooper.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/js/jquery.sooperfish.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/js/image_fade.js"></script>

</body>
<script type="text/javascript">
function checkForm(){
	
	var newPassword=$("#newPassword").val();
	var newPassword2=$("#newPassword2").val();
	if(newPassword==null||newPassword==""){
		alert("请输入修改密码！");
		return false;
	}
	if(newPassword2==null||newPassword2==""){
		alert("请输入确认密码！");
		return false;
	}
	if(newPassword!=newPassword2){
		alert("两次密码不一致");
		return false;
	}
	return true;
}
</script>
</html>