<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Blog &mdash; </title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="freehtml5.co" />


<%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${APP_PATH}/static/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${APP_PATH}/static/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${APP_PATH}/static/css/bootstrap.css">
	
	<!-- Theme style  -->
	<link rel="stylesheet" href="${APP_PATH}/static/css/style.css">

	<!-- Modernizr JS -->
	<script type="text/javascript" src="${APP_PATH}/static/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${APP_PATH}/static/js/respond.min.js"></script>
	<![endif]-->
<!-- jQuery -->
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${APP_PATH}/static/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script type="text/javascript" src="${APP_PATH}/static/js/main.js"></script>
	</head>
	<body>
		
	<div class="fh5co-loader"></div>
	
	<div id="page">
		<div id="fh5co-aside" style="background-image: url(static/images/image_1.jpg)">
		   
			<div class="overlay"></div>
			<nav role="navigation">
				<ul>
				<c:if test="${currentUser.uname !=null}"> 
					<li><a href="toMain"><i class="icon-home"></i></a></li>
				</c:if> 
				</ul>
			</nav>
			<div class="featured">
			
				<span>Bio</span>
				<h2>I'm John Doe </a></h2>
			</div>
		</div>
		<div id="fh5co-main-content">
			<div class="fh5co-post"> 
				<div class="fh5co-entry padding">
					<img src="static/images/project-1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-2.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-3.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-4.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-5.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-6.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-7.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-8.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>
                <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-2.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-3.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-4.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-5.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-6.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-7.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
					</div>
				</div>

				<div class="fh5co-entry padding">
					<img src="static/images/project-8.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div>
						<span class="fh5co-post-date">October 12, 2016</span>
						<h2><a href="single.html">How to be an effective web developer</a></h2>
						<p>How two simple exercises changed my life</p>
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
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	

	</body>
</html>

