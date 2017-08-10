<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客</title>

<%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/css/blog.css">
<link href="http://blog.java1234.com/favicon.ico" rel="SHORTCUT ICON">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/jquery-1.11.2.min.js"></script>
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<link rel="stylesheet"
	href="${APP_PATH}/static/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>

<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?aa5c701f4f646931bf78b6f40b234ef5";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
</script>
<script type="text/javascript">
	function submitData() {
		var content = $("#content").val();
		if (content == null || content == '') {
			alert("请输入评论内容！");
		} 
		else {
			$.post("${APP_PATH}/comment/save.do", {
				'content' : content,
				'blog.bid' : '${blog.bid}'
			}, function(result) {
				if (result.success) {
					
					alert("评论已提交成功，审核通过后显示！");
					window.location.reload();
					resetValue();
				} else {
					alert("请先登录再进行评论！");
				}
			}, "json");
		}
	}

	function showOtherComment() {
		$('.otherComment').show();
	}
	
	// 重置数据
	function resetValue(){
		$("#content").val("");
	}
</script>
<style type="text/css">
body {
	padding-top: 10px;
	padding-bottom: 40px;
}
</style>
</head>
<body>
	<div class="container">

		<jsp:include page="/common/search.jsp" />

		<div class="row">
			<div class="col-md-12">
			<div class="data_list">
	<div>
		<div class="blog_title">
			<h3>
				<strong>${blog.title }</strong>
			</h3>
		</div>
		<div class="blog_info">
			发布时间：『
			<fmt:formatDate value="${blog.releaseDate }" type="date"
				pattern="yyyy-MM-dd HH:mm:ss" />
			』&nbsp;&nbsp;博客类别：${blog.type.typeName}&nbsp;&nbsp;阅读(${blog.clickHit})
			评论(${blog.replyHit})
		</div>
		<div class="blog_content">${blog.content }</div>
		<div class="blog_keyWord">
			<font><strong>关键字：</strong>
			</font>
			<c:choose>
				<c:when test="${keyWords==null}">
					&nbsp;&nbsp;无
				</c:when>
				<c:otherwise>
					<c:forEach var="keyWord" items="${keyWords }">
						&nbsp;&nbsp;<a href="${APP_PATH}/q.do?q=${keyWord}"
							target="_blank">${keyWord }</a>&nbsp;&nbsp;
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<div class="data_list">
	<div class="data_list_title">
		<img src="${APP_PATH}/static/images/comment_icon.png" /> 评论信息
		<c:if test="${commentList.size()>10}">
			<a href="javascript:showOtherComment()"
				style="float: right;padding-right: 40px;">显示所有评论</a>
		</c:if>
	</div>
	<div class="commentDatas">
		<c:choose>
			<c:when test="${commentList.size()==0}">
				暂无评论
			</c:when>
			<c:otherwise>
				<c:forEach var="comment" items="${commentList }" varStatus="status">
					<c:choose>
						<c:when test="${status.index<10 }">
							<div class="comment">
								<span><font>${status.index+1
										}楼(${comment.author })&nbsp;&nbsp;&nbsp;&nbsp;</font>${comment.content
									}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<fmt:formatDate
										value="${comment.commentDate }" type="date"
										pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;]</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="otherComment">
								<div class="comment">
									<span><font>${status.index+1
											}楼&nbsp;&nbsp;&nbsp;&nbsp;</font>${comment.content
										}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<fmt:formatDate
											value="${comment.commentDate }" type="date"
											pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;]</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<div class="data_list">
	<div class="data_list_title">
		<img src="${APP_PATH}/static/images/publish_comment_icon.png" /> 发表评论
	</div>
	 <c:if test="${currentUser.uname ==null}">
		<a href="${APP_PATH}/toLogin.do">去登录</a>
	</c:if>
	<div class="publish_comment">
		<div>
			<textarea style="width: 100%" rows="3" id="content" name="content"
				placeholder="智慧如你，不想发表一点想法咩~ "></textarea>
		</div>

		<div class="publishButton">
			<button class="btn btn-primary" type="button" onclick="submitData()">发表评论</button>
		</div>
		</form>
	</div>
</div>
		    </div>
		</div>
		</div>
</body>
</html>