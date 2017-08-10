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
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/css/style2.css" />

<!-- modernizr enables HTML5 elements and feature detects -->
<script type="text/javascript"
	src="${APP_PATH}/static/js/modernizr-1.5.min.js"></script>
</head>
<body style="margin: 20px">
	 <div id="main">
  
      <jsp:include page="/common/menu.jsp"/>   
	
    <div id="site_content">

		<div class="container">
		<table>
	
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
		  </table>
   	
		</div>
		<jsp:include page="/common/foot.jsp"/>   
	
	</div>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/js/jquery.easing-sooper.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/js/jquery.sooperfish.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/js/image_fade.js"></script>
</body>
</html>