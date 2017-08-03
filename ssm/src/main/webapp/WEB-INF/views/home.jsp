<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>

<head>
<title>个人博客中心</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/css/style2.css" />

<!-- modernizr enables HTML5 elements and feature detects -->
<script type="text/javascript"
	src="${APP_PATH}/static/js/modernizr-1.5.min.js"></script>


</head>

<body>
	<div id="main">

		<jsp:include page="/common/menu.jsp" />

		<div id="site_content">
		<jsp:include page="/common/photo.jsp" /> 

		<div id="content"> 
				<div id="blog_container">
					<c:forEach var="selfBlogs" items="${selfBlogs.list }">
				<a href="${APP_PATH}/blog/delete.do?bid=${selfBlogs.bid }"><img src="${APP_PATH}/static/images/delete.jpg" width="20" height="20" alt="删除" title="删除" ></a>
						<h4 class="select">
							<a href="${APP_PATH}/blog/selfBlog/articles/${selfBlogs.bid}.do">${selfBlogs.title }</a>
						</h4>
						<p>
							${selfBlogs.summary } <a href="${APP_PATH}/blog/selfBlog/articles/${selfBlogs.bid}.do">read more.....</a>
						</p>

					</c:forEach>

			</div> 
			</div>
			<div class="row">
				<div>当前第${selfBlogs.pageNum}页，总${selfBlogs.pages
					}页，总${selfBlogs.total }条记录</div>
				<ul class="pagination pagination-sm">
					<a href="${APP_PATH}/toMain?pn=1">首页</a>
					<c:if test="${selfBlogs.hasPreviousPage }">
						<a href="${APP_PATH}/toMain?pn=${selfBlogs.pageNum-1 }"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
					</c:if>
					<c:forEach items="${selfBlogs.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == selfBlogs.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != selfBlogs.pageNum }">
							<a href="${APP_PATH}/toMain?pn=${page_Num }">${page_Num}</a>
						</c:if>
					</c:forEach>
					<c:if test="${selfBlogs.hasNextPage }">
						<a href="${APP_PATH}/toMain?pn=${selfBlogs.pageNum+1 }"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a>
					</c:if>
					<a href="${APP_PATH}/toMain?pn=${selfBlogs.pages}">末页</a>

				</ul>
				</li>
			</div>
		</div>


		<jsp:include page="/common/foot.jsp" />

	</div>

	<p>&nbsp;</p>
	<!-- javascript at the bottom for fast page loading -->
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/js/jquery.easing-sooper.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/js/jquery.sooperfish.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/js/image_fade.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('ul.sf-menu').sooperfish();
		});
	</script>
</body>
</html>
