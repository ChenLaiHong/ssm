<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>友情链接管理页面</title>

<%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${APP_PATH}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

	var url;
	 
	 function formatEmail(val,row,index){
		if(val==null){
			return "<font color='red'>没有填写邮箱！</font>";
		}else{
			return "<a target='_blank' href='${APP_PATH}/admin/email/goSendEmail.do?email="+row.email+"'>"+row.email+"</a>";			
		}
	}
</script>
</head>
<body style="margin: 1px">
<table id="dg" title="注册用户管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="${APP_PATH}/admin/user/list.do" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="uid" width="20" align="center">编号</th>
   		<th field="uname" width="100" align="center">用户名</th>
   		<th field="sex" width="20" align="center">性别</th>
   		<th field="phone" width="100" align="center">电话</th>
   		<th field="email" width="100" align="center" formatter="formatEmail">邮箱</th>
   		<th field="sign" width="100" align="center">个性签名</th>
   	</tr>
   </thead>
 </table>
  
</body>
</html>