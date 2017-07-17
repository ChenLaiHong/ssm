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
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="${APP_PATH}/static/js/modernizr-1.5.min.js"></script>
  
  <script type="text/javascript">
	
	function submitData(){
		var nickName=$("#nickName").val();
		var sign=$("#sign").val();
		var proFile=UE.getEditor('proFile').getContent();
		
		if(nickName==null || nickName==''){
			alert("请输入昵称！");
		}else if(sign==null || sign==''){
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
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.html">个人<span class="logo_colour">_博客_中心</span></a></h1>
          <h2>${currentUser.sign}</h2>
        </div>
      </div>
      <div><c:if test="${currentUser.imageName ==null}"> 
				<img src="${APP_PATH}/static/images/moren.png"  class="img-circle" width="60" height="60" style="display: inline-block;" > 
			</c:if>
			<c:if test="${currentUser.imageName !=null}"> 
				<img src="${APP_PATH}/static/images/${currentUser.imageName }"  class="img-circle" width="60" height="60" style="display: inline-block;" > 
			</c:if></div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li class="selected"><a href="index.html">博客列表</a></li>
          <li><a href="toLogin">写博客</a></li>
          <li><a href="portfolio.html">评论管理</a></li>
          <li><a href="blog.html">Blog</a></li>
           <li><a href="contact.php">源码下载</a></li>
          <li><a href="#">设置</a>
            <ul>
              <li><a href="#">修改个人信息</a></li>
              <li><a href="#">修改密码</a> </li>
              <li><a href="#">安全退出</a> </li>
             
            </ul>
          </li>
         
        </ul>
      </nav>
    </header>
	<div class="inner_copyright">Collect from <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a></div>
    <div id="site_content">
     
      
        <form id="form1" action="${APP_PATH}/admin/blogger/save.do" method="post" enctype="multipart/form-data">
	 	<table cellspacing="20px">
	   		<tr>
	   			<td width="80px">用户名：</td>
	   			<td>
	   				<input type="hidden" id="id" name="id" value="${currentUser.uid }"/>
	   				<input type="text" id="userName" name="userName" style="width: 200px;" value="${currentUser.uname }" readonly="readonly"/>
	   			</td>
	   		</tr>
	   		<tr>
	   			<td>昵称：</td>
	   			<td><input type="text" id="nickName" name="nickName"  style="width: 200px;"/></td>
	   		</tr>
	   		<tr>
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
    <footer>
      <p>Copyright &copy; photo_style_two | <a href="http://www.cssmoban.com">网页模板</a></p>
    </footer>
  </div>
  <p>&nbsp;</p>
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.sooperfish.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/image_fade.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('ul.sf-menu').sooperfish();
    });


    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('proFile');

    ue.addListener("ready",function(){
        //通过ajax请求数据
        UE.ajax.request("${APP_PATH}/admin/blogger/find.do",
            {
                method:"post",
                async : false,  
                data:{},
                onsuccess:function(result){
                	result = eval("(" + result.responseText + ")");  
                	$("#nickName").val(result.nickName);
                	$("#sign").val(result.sign);
                	$("#nickName").val(result.nickName);
       				UE.getEditor('proFile').setContent(result.proFile);
                }
            }
        );
    });
    
</script>
</body>
</html>
