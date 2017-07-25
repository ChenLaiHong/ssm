<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Blog &mdash;</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by freehtml5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="freehtml5.co" />


<%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="${APP_PATH}/static/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${APP_PATH}/static/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${APP_PATH}/static/css/bootstrap.css">

<!-- Theme style  -->
<link rel="stylesheet" href="${APP_PATH}/static/css/style.css">

<!-- Modernizr JS -->
<script type="text/javascript"
	src="${APP_PATH}/static/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script type="text/javascript" src="${APP_PATH}/static/js/respond.min.js"></script>
	<![endif]-->
<!-- jQuery -->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="${APP_PATH}/static/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery.waypoints.min.js"></script>
<!-- Stellar Parallax -->
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery.stellar.min.js"></script>
<!-- Main -->
<script type="text/javascript" src="${APP_PATH}/static/js/main.js"></script>
</head>
<body>

	<div class="fh5co-loader"></div>

	<div id="page">
		<div id="fh5co-aside"
			style="background-image: url(static/images/image_1.jpg)">

			<div class="overlay"></div>
			<nav role="navigation">
				<ul>
					<c:if test="${currentUser.uname !=null}">
						<li><a href="toMain"><i class="icon-home"></i>
						</a>
						</li>
					</c:if>
				</ul>
			</nav>
			<div class="featured">

				<span>Bio</span>
				<h2>I'm John Doe</h2>
			</div>
		</div>

		<div id="fh5co-main-content">
			<div class="fh5co-post">

				<table class="">
					<c:forEach items="${pageInfo.list }" var="type">
						<div class="fh5co-entry padding">
							<img src="${APP_PATH}/static/userImages/${type.imageName}"
								alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
							<div>

								<h2>
									<a href="${APP_PATH}/blogList.do?typeId=${type.typeId }">${type.typeName
										}</a>
								</h2>
								<p>${type.describes }</p>
							</div>
						</div>
					</c:forEach>
				</table>
				<div class="row">
					<div class="col-md-6">当前第${pageInfo.pageNum
						}页，总${pageInfo.pages }页，总${pageInfo.total }条记录</div>
					<div class="col-md-6">
						<nav aria-label="Page navigation">
							<ul class="pagination pagination-sm">
								<li><a href="${APP_PATH}/types?pn=1">首页</a> <c:if
										test="${pageInfo.hasPreviousPage }">
										<li><a href="${APP_PATH}/types?pn=${pageInfo.pageNum-1 }"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if> <c:forEach items="${pageInfo.navigatepageNums }"
										var="page_Num">
										<c:if test="${page_Num == pageInfo.pageNum }">
											<li class="active"><a href="#">${page_Num }</a>
											</li>
										</c:if>
										<c:if test="${page_Num != pageInfo.pageNum }">
											<li><a href="${APP_PATH}/types?pn=${page_Num }">${page_Num
													}</a>
											</li>
										</c:if>
									</c:forEach> <c:if test="${pageInfo.hasNextPage }">
										<li><a href="${APP_PATH}/types?pn=${pageInfo.pageNum+1 }"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								<li><a href="${APP_PATH}/types?pn=${pageInfo.pages}">末页</a>
							</ul>
						</nav>
					</div>
				</div>
				<footer>
					<div>
						<c:if test="${currentUser.uname ==null}">
							<a href="toLogin">登录</a>
							<a href="toRegister">注册</a>
						</c:if>
						<c:if test="${currentUser.uname !=null}">  
        					 当前用户:${currentUser.uname}   
        					<a href="loginout">退出</a>
						</c:if>
					</div>
				</footer>
			</div>
		</div>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i>
		</a>
	</div>

</body>
</html>

