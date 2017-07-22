<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客类别管理页面</title>

<%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>

<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="${APP_PATH}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

	var url;

	function deleteBlogType(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			 $.messager.alert("系统提示","请选择要删除的数据！");
			 return;
		 }
		 var strIds=[];
		 for(var i=0;i<selectedRows.length;i++){
			 strIds.push(selectedRows[i].typeId);
		 }
		 var ids=strIds.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
				if(r){
					$.post("${APP_PATH}/admin/blogType/delete.do",{ids:ids},function(result){
						if(result.success){
							if(result.exist){
								 $.messager.alert("系统提示",result.exist);
							}else{
								 $.messager.alert("系统提示","数据已成功删除！");								
							}
							 $("#dg").datagrid("reload");
						}else{
							$.messager.alert("系统提示","数据删除失败！");
						}
					},"json");
				} 
	   });
	}
	
	function openBlogTypeAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加博客类别信息");
		url="${APP_PATH}/admin/blogType/save.do";
	}
	
	function openBlogTypeModifyDialog(){
		var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要编辑的数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 $("#dlg").dialog("open").dialog("setTitle","编辑博客类别信息");
		 $("#fm").form("load",row);
		 url="${APP_PATH}/admin/blogType/save.do?typeId="+row.typeId;
	 }
	
	function saveBlogType(){
		 $("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功！");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","保存失败！");
					return;
				}
			}
		 });
	 }
	 
	function resetValue(){
		 $("#typeName").val("");
		 $("#describes").val("");
		  $("#imageFile").val("");
		 $("#orderNo").val("");
	 }
	
	 function closeBlogTypeDialog(){
		 $("#dlg").dialog("close");
		 resetValue();
	 }
	 
	 function formatImg(val,row){
	 	if(val){
	 		return '<img src=static/userImages/'+val+' style=width:80px;height:50px;>'
	 	}else{
	 		return '<img src='+APP_PATH+'/static/userImages/moren.png style=width:80px;height:50px;>'
	 	}
	 }
</script>
</head>
<body style="margin: 1px">


	<table id="dg" title="博客类别管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true"
		url="${APP_PATH}/admin/blogType/list.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="typeId" width="20" align="center">编号</th>
				<th field="typeName" width="20" align="center">博客类型名称</th>
				<th field="describes" width="50" align="center">类别描述</th>
				<th field="imageName" width="20" align="center" data-options="formatter:formatImg">图片</th>
				<th field="orderNo" width="10" align="center">排序序号</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openBlogTypeAddDialog()"
				class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openBlogTypeModifyDialog()"
				class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteBlogType()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width:500px;height:180px;padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">

		<form id="fm" method="post" enctype="multipart/form-data">
			<table cellspacing="8px">
				<tr>
					<td>博客类别名称：</td>
					<td><input type="text" id="typeName" name="typeName"
						class="easyui-validatebox" required="true" />
					</td>
				</tr>
				<tr>
					<td>类别描述：</td>
					<td><input type="text" id="describes" name="describes"
						class="easyui-validatebox" required="true" />
					</td>
				</tr>
				<tr>
					<td>图片：</td>
					<td><input type="file" id="imageFile" name="imageFile"
						class="easyui-validatebox" required="true" />
					</td>
				</tr>
				<tr>
					<td>博客类别排序：</td>
					<td><input type="text" id="orderNo" name="orderNo"
						class="easyui-numberbox" required="true" style="width: 60px" />&nbsp;(类别根据排序序号从小到大排序)</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveBlogType()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeBlogTypeDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

</body>
</html>