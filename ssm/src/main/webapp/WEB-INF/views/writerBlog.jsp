<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写博客页面</title>
 <%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>

<meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	

<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${APP_PATH}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" charset="UTF-8" src="${APP_PATH}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="UTF-8" src="${APP_PATH}/static/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="UTF-8" src="${APP_PATH}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
 <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/style2.css" />
 
  <script type="text/javascript" src="${APP_PATH}/static/js/modernizr-1.5.min.js"></script>
<script type="text/javascript">
	
	function submitData(){
		var title=$("#title").val();
		
    //获得select选中的值，就是我们自己设定的id值
         var typeId=$("#typeId").val();
		
		var content=UE.getEditor('editor').getContent();
		var keyWord=$("#keyWord").val();
		
		if(title==null || title==''){
			alert("请输入标题！");
		}else if(typeId==null || typeId==''){
			alert("请选择博客类别！");
		}else if(content==null || content==''){
			alert("请输入内容！");
		}else{
			$.post("${APP_PATH}/blog/save.do",{'title':title,'type.typeId':typeId,'content':content,'contentNoTag':UE.getEditor('editor').getContentTxt(),'summary':UE.getEditor('editor').getContentTxt().substr(0,155),'keyWord':keyWord},function(result){
				if(result.success){
					alert("博客发布成功！");
					resetValue();
				}else{
					alert("博客发布失败！");
				}
			},"json");
		}
	}
	
	// 重置数据
	function resetValue(){
		$("#title").val("");
		$("#typeId").val("");
		UE.getEditor('editor').setContent("");
		$("#keyWord").val("");
	}
	
</script>
</head>
<body style="margin: 10px">
	 <div id="main">
  
      <jsp:include page="/common/menu.jsp"/>   
	
    <div id="site_content">

	<table cellspacing="20px">
   		<tr>
   		 <input type="hidden" id="author" name="author" value="${currentUser.uname }"/>
   			<td width="80px">博客标题：</td>
   			<td><input type="text" id="title" name="title" style="width: 400px;"/></td>
   		</tr>
   		<tr>
   			<td>所属类别：</td>
   			<td>
   				<select id="typeId" name="type.typeId" >
					<option value="">请选择博客类别...</option>	
				    <c:forEach var="type" items="${pageInfo.list }">
				    	<option value="${type.typeId }">${type.typeName }</option>
				    </c:forEach>			
                </select>
   			</td>
   		</tr>
   		<tr>
   			<td valign="top">博客内容：</td>
   			<td>
				   <script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
   			</td>
   		</tr>
   		<tr>
   			<td>关键字：</td>
   			<td><input type="text" id="keyWord" name="keyWord" style="width: 400px;"/>&nbsp;(多个关键字中间用空格隔开)</td>
   		</tr>
   		<tr>
   			<td></td>
   			<td>
   				<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">发布博客</a>
   			</td>
   		</tr>
   	</table>
   	
		</div>
		<jsp:include page="/common/foot.jsp"/>   
	
	</div>
	 <script type="text/javascript" src="${APP_PATH}/static/js/jquery.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.sooperfish.js"></script>
 
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


</script>
</body>
</html>