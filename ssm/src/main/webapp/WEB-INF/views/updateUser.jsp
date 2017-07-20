<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>

<head>
  <title>个人博客中心</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  
  <%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
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
		
		var sign=$("#sign").val();
		var proFile=UE.getEditor('proFile').getContent();
		
		
		if(sign==null || sign==''){
			alert("请输入个性签名！");
		}else if(proFile==null || proFile==''){
			alert("请输入个性简介！");
		}else{
			$("#pF").val(proFile);
			$('#form1').submit();
		}
	}
	
	
	
</script>
</head>

<body>
  <div id="main">
  
      <jsp:include page="/common/menu.jsp"/>   
	
    <div id="site_content">
     
        <form id="form1" action="${APP_PATH}/user/save.do" method="post" enctype="multipart/form-data">
	 	<table cellspacing="20px">
	   		<tr>
	   			<td width="80px">用户名：</td>
	   			<td>
	   				  <input type="hidden" id="uid" name="uid" value="${currentUser.uid }"/>
	   				<input type="text" id="uname" name="uname" style="width: 200px;" value="${currentUser.uname }" readonly="readonly"/>
	   			</td>
	   		</tr>
	   		
	   			<td>个性签名：</td>
	   			<td><input type="text" id="sign" name="sign" value="${currentUser.sign }" style="width: 400px;"/></td>
	   		</tr>
	   		<tr>
	   			<td>个人头像：</td>
	   			<td><input type="file" id="imageFile" name="imageFile" style="width: 400px;"/></td>
	   		</tr>
	   		<tr>
	   			<td valign="top">个人简介：</td>
	   			<td>
					   <script id="proFile" type="text/plain" style="width:100%;height:400px;"></script>
					   <input type="hidden" id="pF" name="proFile"/>
	   			</td>
	   		</tr>
	   		<tr>
	   			<td></td>
	   			<td>
	   				<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">提交</a>
	   			</td>
	   		</tr>
	   	</table>
   	</form>
     
    </div>
    
     <jsp:include page="/common/foot.jsp"/>   
     
  </div>
  <p>&nbsp;</p>
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.sooperfish.js"></script>
    <!--
  <script type="text/javascript" src="${APP_PATH}/static/js/image_fade.js"></script>
  -->
  <script type="text/javascript">
    $(document).ready(function() {
      $('ul.sf-menu').sooperfish();
    });


    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('proFile');

    ue.addListener("ready",function(){
        //通过ajax请求数据
        UE.ajax.request("${APP_PATH}/user/find/${currentUser.uid }.do",
            {
                method:"post",
                async : false,  
                data:{},
                onsuccess:function(result){
                	result = eval("(" + result.responseText + ")");  
                	$("#sign").val(result.sign);
                	$("#imageFile").val(result.imageFile);
       				UE.getEditor('proFile').setContent(result.proFile);
                }
            }
        );
    });
    
</script>
</body>
</html>
