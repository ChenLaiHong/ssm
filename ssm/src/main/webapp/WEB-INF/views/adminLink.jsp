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

	function deleteLink(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			 $.messager.alert("系统提示","请选择要删除的数据！");
			 return;
		 }
		 var strIds=[];
		 for(var i=0;i<selectedRows.length;i++){
			 strIds.push(selectedRows[i].id);
		 }
		 var ids=strIds.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
				if(r){
					$.post("${APP_PATH}/admin/link/delete.do",{ids:ids},function(result){
						if(result.success){
							 $.messager.alert("系统提示","数据已成功删除！");
							 $("#dg").datagrid("reload");
						}else{
							$.messager.alert("系统提示","数据删除失败！");
						}
					},"json");
				} 
	   });
	}
	
	function openLinkAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加友情链接信息");
		url="${APP_PATH}/admin/link/save.do";
	}
	
	function openLink(){
		$("#upl").dialog("open").dialog("setTitle","上传文件");
		
	}
	
	//执行批量导入功能/////////////////////////////////////////
      function winClose() {
    	 $("#upl").dialog("close");
		 resetValue();
    }
    
    var showDiv = function(str) {    
    	var msgw = 350;
        var msgh = 90; 
        var bordercolor;
        titleheight =  25; //提示窗口标题高度    
        bordercolor = "#00CCCC"; //提示窗口的边框颜色    
        titlecolor = "#00CCCC"; //提示窗口的标题颜色    
        var sWidth, sHeight;    
        //获取当前窗口尺寸    
        sWidth = document.body.offsetWidth;    
        sHeight = document.body.offsetHeight;    
        //背景div    
        var bgObj = document.createElement("div");    
        bgObj.setAttribute('id', 'alertbgDiv');    
        bgObj.style.position = "absolute";    
        bgObj.style.top = "0";    
        bgObj.style.background = "#E8E8E8";    
        bgObj.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";    
        bgObj.style.opacity = "0.6";    
        bgObj.style.left = "0";    
        bgObj.style.width = sWidth + "px";    
        bgObj.style.height = sHeight + "px";    
        bgObj.style.zIndex = "10000";    
        document.body.appendChild(bgObj);    
        //创建提示窗口的div    
        var msgObj = document.createElement("div");    
        msgObj.setAttribute("id", "alertmsgDiv");    
        msgObj.setAttribute("align", "center");    
        msgObj.style.background = "white";    
        msgObj.style.border = "1px solid " + bordercolor;    
        msgObj.style.position = "absolute";    
        msgObj.style.left = "50%";    
        msgObj.style.font = "12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";    
        //窗口距离左侧和顶端的距离     
        msgObj.style.marginLeft = "-280px";    
        //窗口被卷去的高+（屏幕可用工作区高/2）-150    
        msgObj.style.top = document.body.scrollTop+(window.screen.availHeight/2)- 180 + "px";    
        msgObj.style.width = msgw + "px";    
        msgObj.style.height = msgh + "px";    
        msgObj.style.textAlign = "center";    
        msgObj.style.lineHeight ="25px";    
        msgObj.style.zIndex = "10001";    
        document.body.appendChild(msgObj);    
        //提示信息标题    
        var title=document.createElement("h4");    
        title.setAttribute("id", "alertmsgTitle");    
        title.setAttribute("align", "left");    
        title.style.margin = "0";    
        title.style.padding = "3px";    
        title.style.background = bordercolor;    
        title.style.filter = "progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";    
        title.style.opacity = "0.75";    
        title.style.border = "1px solid " + bordercolor;    
        title.style.height = "18px";    
        title.style.font = "12px Verdana, Geneva, Arial, Helvetica, sans-serif";    
        title.style.color = "white";    
        title.innerHTML = "提示信息";    
        document.getElementById("alertmsgDiv").appendChild(title);    
        //提示信息    
        var txt = document.createElement("p");    
        txt.setAttribute("id", "msgTxt");    
        txt.style.margin="16px 0";    
        txt.innerHTML = str;    
        document.getElementById("alertmsgDiv").appendChild(txt);    
    };    
  //关闭提示框
    var closeDiv = function() {    
        document.body.removeChild(document.getElementById("alertbgDiv"));    
        document.getElementById("alertmsgDiv").removeChild(document.getElementById("alertmsgTitle"));    
        document.body.removeChild(document.getElementById("alertmsgDiv"));    
    };
    
    
    
  //执行批量导入功能
    function importSubmit(){
    		var link = $.trim($("#link").val());
    	if(link == "") {
    		top.$.messager.alert('提示信息', '请选择要批量导入的excel文件!', 'error');
    		return;
    	}
    	$("#fi").form("submit", {
    	    url: "${APP_PATH}/admin/link/read",
    	    onSubmit: function() {
    	    	showDiv("批量导入时间较长，请耐心等待，勿作其它操作，谢谢！");
    	    },
    	    success: function(result) {
    	    	var date = eval('('+result+')');
    	        if(date.status == "ok") {
    	        	closeDiv(); //关闭提示信息框
    	        	top.$.messager.alert('提示信息', date.message, 'info', function() {
    	        		winClose();
    					grid.datagrid("reload");
    					
    				});
    	        } else if(date.status == "fail") {
    	        	closeDiv(); //关闭提示信息框
    	        	winClose(); //关闭对话框
    	        	top.$.messager.alert('提示信息', date.message, 'error');
    	        	return;
    	        }
    	    },
    	    error: function() {
    	    	closeDiv(); //关闭提示信息框
            	winClose(); //关闭对话框
            	return;
    	    }
    	});
    	
    }; 
    
    /////////////////////////////////////////////
	
	function openLinkModifyDialog(){
		var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要编辑的数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 $("#dlg").dialog("open").dialog("setTitle","编辑友情链接信息");
		 $("#fm").form("load",row);
		 url="${APP_PATH}/admin/link/save.do?id="+row.id;
	 }
	
	function saveLink(){
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
		 $("#linkName").val("");
		 $("#linkUrl").val("");
		 $("#orderNo").val("");
	 }
	
	 function closeLinkDialog(){
		 $("#dlg").dialog("close");
		 resetValue();
	 }
	
</script>
</head>
<body style="margin: 1px">
<table id="dg" title="友情链接管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="${APP_PATH}/admin/link/list.do" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="id" width="20" align="center">编号</th>
   		<th field="linkName" width="200" align="center">友情链接名称</th>
   		<th field="linkUrl" width="200" align="center">友情链接地址</th>
   		<th field="orderNo" width="100" align="center">排序序号</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 	    <a href="javascript:openLinkAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openLinkModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteLink()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 		<a href="${APP_PATH}/admin/link/exportLink" class="easyui-linkbutton" iconCls="icon-redo" plain="true">导出</a>
 		<a href="javascript:openLink()" class="easyui-linkbutton" iconCls="icon-print" plain="true">上传</a>
 	</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
 </div>
  <div id="upl" class="easyui-dialog" style="width:500px;height:200px;padding: 10px 20px"
   closed="true" buttons="#upl-buttons">
   
   <form id="fi"  enctype="multipart/form-data" method="post">
   	<table cellspacing="8px">
				选择文件：<input type="file" name="link" id="link" />
   	</table>
   </form>
 </div>
 
 <div id="dlg" class="easyui-dialog" style="width:500px;height:200px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>友情链接名称：</td>
   			<td><input type="text" id="linkName" name="linkName" class="easyui-validatebox" required="true"/></td>
   		</tr>
   		<tr>
   			<td>友情链接地址：</td>
   			<td><input type="text" id="linkUrl" name="linkUrl" class="easyui-validatebox" validtype="url" required="true" style="width: 250px"/></td>
   		</tr>
   		<tr>
   			<td>友情链接排序：</td>
   			<td><input type="text" id="orderNo" name="orderNo" class="easyui-numberbox" required="true" style="width: 60px"/>&nbsp;(友情链接根据排序序号从小到大排序)</td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:saveLink()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeLinkDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
 <div id="upl-buttons">
 	<a href="javascript:importSubmit()" class="easyui-linkbutton" iconCls="icon-ok">导入</a>
 	<a href="javascript:winClose()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
</body>
</html>