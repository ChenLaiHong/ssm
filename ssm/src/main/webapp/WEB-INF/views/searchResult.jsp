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
					<div class="datas search">
						<ul>
							<c:choose>
								<c:when test="${searchResult.size()==0 }">
									<div align="center" style="padding-top: 20px">未查询到结果，请换个关键字试试看！</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="blog" items="${searchResult.list }">
										<li style="margin-bottom: 20px"><span class="title"><a
												href="${APP_PATH}/blog/articles/${blog.bid}.html"
												target="_blank">${blog.title }</a>
										</span> <span class="summary">摘要: ${blog.summary }...</span> <span
											class="link"><a
												href="${APP_PATH}/blog/articles/${blog.bid}.html">http://blog.java1234.com/blog/articles/${blog.bid}.html</a>&nbsp;&nbsp;&nbsp;&nbsp;发布日期：${blog.releaseDateStr
												}</span></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>

				<div>
					<div class="row">
						<div class="col-md-6">当前第${searchResult.pageNum
							}页，总${searchResult.pages }页，总${searchResult.total }条记录</div>
						<div class="col-md-6">
							<nav aria-label="Page navigation">
							<ul class="pagination pagination-sm">
								<li><a href="${APP_PATH}/q?pn=1">首页</a> <c:if
										test="${searchResult.hasPreviousPage }">
										<li><a href="${APP_PATH}/q?pn=${searchResult.pageNum-1 }"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if> <c:forEach items="${searchResult.navigatepageNums }"
										var="page_Num">
										<c:if test="${page_Num == searchResult.pageNum }">
											<li class="active"><a href="#">${page_Num }</a>
											</li>
										</c:if>
										<c:if test="${page_Num != searchResult.pageNum }">
											<li><a href="${APP_PATH}/q?pn=${page_Num }">${page_Num
													}</a>
											</li>
										</c:if>
									</c:forEach> <c:if test="${searchResult.hasNextPage }">
										<li><a href="${APP_PATH}/q?pn=${searchResult.pageNum+1 }"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								<li><a href="${APP_PATH}/blogList?pn=${searchResult.pages}">末页</a>
							</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
</body>
</html>