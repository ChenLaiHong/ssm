<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发送邮件</title>
<%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${APP_PATH}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.tips.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="UTF-8" src="${APP_PATH}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="UTF-8" src="${APP_PATH}/static/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="UTF-8" src="${APP_PATH}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
  <script type="text/javascript">
//发送
function sendEm(){
   
    var EMAIL = $("#EMAIL").val();
    var TITLE = $("#TITLE").val();
    var CONTENT = UE.getEditor('editor').getContent();
   if($("#EMAIL").val()==""){
       alert("请输入邮箱！");
    }
    else if($("#TITLE").val()==""){
         alert("标题不能为空！");
    }
    else if(CONTENT==""){
         alert("内容不能为空！");
    }else{
        $.post('${APP_PATH}/admin/email/sendEmail.do?tm='+new Date().getTime(), 
        {EMAIL:EMAIL,TITLE:TITLE,CONTENT:CONTENT},
        function(result){
            if(result.success){
               alert("成功发送！");
    	        resetValue();
            }else{
                 alert("发送失败！");
    	     }
        },"json");
}
}
// 重置数据
	function resetValue(){
		$("#EMAIL").val("");
		$("#TITLE").val("");
		UE.getEditor('editor').setContent("");
		
	}
</script>
</head>
<body>
<center>
        <div>
        <table style="width:78%;" >
            <tr>
                <td style="margin-top:0px;">
                     <div style="float: left;" style="width: 81%"><textarea name="EMAIL" id="EMAIL" rows="1" cols="50" style="width:200px;height:20px;" placeholder="请选输入对方邮箱！" title="请选输入对方邮箱!">${email}</textarea></div>
                     
                </td>
            </tr>
            <tr>
                <td>
                     <input type="text" name="TITLE" id="TITLE" value="" placeholder="请选输入邮件标题" style="width:55%"/>
                </td>
            </tr>
            <tr>
                <td id="nr">
                     <script id="editor" type="text/plain" style="width:650px;height:259px;"></script>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;">
                <a href="javascript:sendEm()" class="easyui-linkbutton" iconCls="icon-ok">发送</a>
                </td>
            </tr>
        </table>
        </div>
     </div>    
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


</script>
</center>
</body>
</html>