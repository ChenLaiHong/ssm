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
                         <input type="hidden" id="typeId" name="typeId" value="${typeId }"/>
					<div class="datas">
						<ul>
							<c:forEach var="blog" items="${pageInfom.list }">
								<li style="margin-bottom: 30px"><span class="date"><a
										href="${APP_PATH}/blog/articles/${blog.bid}.do"><fmt:formatDate
												value="${blog.releaseDate }" type="date"
												pattern="yyyy年MM月dd日 HH时mm分ss秒" />
									</a>
								</span> <span class="title"><a
										href="${APP_PATH}/blog/articles/${blog.bid}.do">${blog.title
											}</a>
								</span> <span class="summary">摘要: ${blog.summary }...</span> <span
									class="img"> <c:forEach var="image"
											items="${blog.imagesList }">
											<a href="${APP_PATH}/blog/articles/${blog.bid}.do">${image
												}</a>
					  		&nbsp;&nbsp;
				  		</c:forEach> </span> <span class="info">发表于 <fmt:formatDate
											value="${blog.releaseDate }" type="date"
											pattern="yyyy-MM-dd HH:mm:ss" /> 阅读(${blog.clickHit})
										评论(${blog.replyHit}) 作者(${blog.author})</span></li>
								<hr
									style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:  10px;" />
							</c:forEach>
						</ul>
					</div>
				</div>

				<div>
					<div class="row">
						<div class="col-md-6">当前第${pageInfom.pageNum
							}页，总${pageInfom.pages }页，总${pageInfom.total }条记录</div>
						<div class="col-md-6">
							<nav aria-label="Page navigation">
							<ul class="pagination pagination-sm">
								<li><a href="${APP_PATH}/blogList?pn=1&typeId=${typeId }">首页</a> <c:if
										test="${pageInfom.hasPreviousPage }">
										<li><a
											href="${APP_PATH}/blogList?pn=${pageInfom.pageNum-1 }&typeId=${typeId }"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if> <c:forEach items="${pageInfom.navigatepageNums }"
										var="page_Num">
										<c:if test="${page_Num == pageInfom.pageNum }">
											<li class="active"><a href="#">${page_Num }</a>
											</li>
										</c:if>
										<c:if test="${page_Num != pageInfom.pageNum }">
											<li><a href="${APP_PATH}/blogList?pn=${page_Num }&typeId=${typeId }">${page_Num
													}</a>
											</li>
										</c:if>
									</c:forEach> <c:if test="${pageInfom.hasNextPage }">
										<li><a
											href="${APP_PATH}/blogList?pn=${pageInfom.pageNum+1 }&typeId=${typeId }"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								<li><a href="${APP_PATH}/blogList?pn=${pageInfom.pages}&typeId=${typeId }">末页</a>
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