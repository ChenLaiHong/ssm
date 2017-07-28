<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果</title>

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

<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?aa5c701f4f646931bf78b6f40b234ef5";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
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
		<div class="data_list_title">
		<img src="${APP_PATH}/static/images/search_icon.png"/>
		搜索&nbsp;<font color="red">${q }</font>&nbsp;的结果 &nbsp;(总共搜索到&nbsp;${resultTotal}&nbsp;条记录) </div>
		<div class="datas search">
			<ul>
				<c:choose>
					<c:when test="${blogList.size()==0 }">
						<div align="center" style="padding-top: 20px">未查询到结果，请换个关键字试试看！</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="blog" items="${blogList }">
					  	  <li style="margin-bottom: 20px">
						  	<span class="title"><a href="${APP_PATH}/blog/articles/${blog.bid}.do" target="_blank">${blog.title }</a></span>
						  	<span class="summary">摘要: ${blog.content }...</span>
						  	<span class="link"><a href="${APP_PATH}/blog/articles/${blog.bid}.do">http://localhost:8080/ssm/blog/articles/${blog.bid}.do</a>&nbsp;&nbsp;&nbsp;&nbsp;发布日期：${blog.releaseDateStr }</span>
						  </li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		${pageCode }
   </div>

				
			</div>

		</div>

	</div>
</body>
</html>