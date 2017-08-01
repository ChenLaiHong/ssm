<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑邮箱</title>
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

<style type="text/css">
		#dialog-add,#dialog-message,#dialog-comment{width:100%; height:100%; position:fixed; top:0px; z-index:99999999; display:none;}
		.commitopacity{position:absolute; width:100%; height:700px; background:#7f7f7f; filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity: 0.5; opacity: 0.5; top:0px; z-index:99999;}
		.commitbox{width:100%; margin:0px auto; position:absolute; top:0px; z-index:99999;}
		.commitbox_inner{width:96%; height:255px;  margin:6px auto; background:#efefef; border-radius:5px;}
		.commitbox_top{width:100%; height:253px; margin-bottom:10px; padding-top:10px; background:#FFF; border-radius:5px; box-shadow:1px 1px 3px #e8e8e8;}
		.commitbox_top textarea{width:95%; height:195px; display:block; margin:0px auto; border:0px;}
		.commitbox_cen{width:95%; height:40px; padding-top:10px;}
		.commitbox_cen div.left{float:left;background-size:15px; background-position:0px 3px; padding-left:18px; color:#f77500; font-size:16px; line-height:27px;}
		.commitbox_cen div.left img{width:30px;}
		.commitbox_cen div.right{float:right; margin-top:7px;}
		.commitbox_cen div.right span{cursor:pointer;}
		.commitbox_cen div.right span.save{border:solid 1px #c7c7c7; background:#6FB3E0; border-radius:3px; color:#FFF; padding:5px 10px;}
		.commitbox_cen div.right span.quxiao{border:solid 1px #f77400; background:#f77400; border-radius:3px; color:#FFF; padding:4px 9px;}
		</style>
  <script type="text/javascript">
//发送
function sendEm(){

    if($("#TYPE").val()=="1"){
        $("#CONTENT").val(getContentTxt());
    }else{
        var CONTENT=UE.getEditor('editor').getContent();
    }
    if($("#EMAIL").val()==""){
        $("#EMAIL").tips({
            side:3,
            msg:'请输入邮箱',
            bg:'#AE81FF',
            time:2
        });
        $("#EMAIL").focus();
        return false;
    }
    if($("#TITLE").val()==""){
        $("#TITLE").tips({
            side:3,
            msg:'请输入标题',
            bg:'#AE81FF',
            time:2
        });
        $("#TITLE").focus();
        return false;
    }
    if(CONTENT==""){

        $("#nr").tips({
            side:1,
            msg:'请输入内容',
            bg:'#AE81FF',
            time:3
        });
        return false;
    }

    var EMAIL = $("#EMAIL").val();
    var TYPE  = $("#TYPE").val();
    var TITLE = $("#TITLE").val();
    var CONTENT = UE.getEditor('editor').getContent();

    $("#zhongxin").hide();
    $("#zhongxin2").show();

    $.ajax({
        type: "POST",
        url: '${APP_PATH}/admin/email/sendEmail.do?tm='+new Date().getTime(),
        data: {EMAIL:EMAIL,TITLE:TITLE,CONTENT:CONTENT},
        dataType:'json',
        //beforeSend: validateData,
        cache: false,
        success: function(data){
            if("ok" == data.result){
            
               alert("发送成功！"); 
               $("#zhongxin2").hide();  
            }else{
                alert("发送失败！");  
            }

        }
    });

}

</script>
</head>
<body>
        <div>
        <table style="width:78%;" >
            <tr>
                <td style="margin-top:0px;">
                     <div style="float: left;" style="width: 81%"><textarea name="EMAIL" id="EMAIL" rows="1" cols="50" style="width:200px;height:20px;" placeholder="请选输入对方邮箱,多个请用(;)分号隔开" title="请选输入对方邮箱,多个请用(;)分号隔开">${email}</textarea></div>
                     
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
        <div id="zhongxin2" class="center" style="display:none"><br/><img width="60" height="60" src="${APP_PATH}/static/images/jiazai2.gif" id='msg' /><br/><h4 class="lighter block green" id='msg'>正在发送...</h4>
      
        </div>
        </div>    
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


</script>
</body>
</html>