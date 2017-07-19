<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>

<head>
  <title>个人博客中心</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  
  <%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/style2.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="${APP_PATH}/static/js/modernizr-1.5.min.js"></script>
</head>

<body>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.html">个人<span class="logo_colour">_博客_中心</span></a></h1>
          <h2>${currentUser.sign}</h2>
        </div>
      </div>
      <div><c:if test="${currentUser.imageName ==null}"> 
				<img src="${APP_PATH}/static/images/moren.png"  class="img-circle" width="60" height="60" style="display: inline-block;" > 
			</c:if>
			<c:if test="${currentUser.imageName !=null}"> 
				<img src="${APP_PATH}/static/userImages/${currentUser.imageName }"  class="img-circle" width="60" height="60" style="display: inline-block;" > 
			</c:if></div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li class="selected"><a href="index.html">博客列表</a></li>
          <li><a href="toLogin">写博客</a></li>
          <li><a href="portfolio.html">评论管理</a></li>
          <li><a href="blog.html">Blog</a></li>
           <li><a href="contact.php">源码下载</a></li>
          <li><a href="#">设置</a>
            <ul>
              <li><a href="toUpdateUser">修改个人信息</a></li>
              <li><a href="#">修改密码</a> </li>
              <li><a href="#">安全退出</a> </li>
             
            </ul>
          </li>
         
        </ul>
      </nav>
    </header>
	<div class="inner_copyright">Collect from <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a></div>
    <div id="site_content">
      <div id="sidebar_container">
        <div class="gallery">
          <ul class="images">
            <li class="show"><img width="450" height="450" src="${APP_PATH}/static/images/1.jpg" alt="photo_one" /></li>
            <li><img width="450" height="450" src="${APP_PATH}/static/images/2.jpg" alt="photo_two" /></li>
            <li><img width="450" height="450" src="${APP_PATH}/static/images/3.jpg" alt="photo_three" /></li>
            <li><img width="450" height="450" src="${APP_PATH}/static/images/4.jpg" alt="photo_four" /></li>
            <li><img width="450" height="450" src="${APP_PATH}/static/images/5.jpg" alt="photo_five" /></li>
          </ul>
        </div>
      </div>
      <div id="content">
        <h1>Welcome to photo_style_two</h1>
        <p>This standards compliant, fixed width website template is released as an 'open source' design (under a Creative Commons Attribution 3.0 Licence), which means that you are free to use it for anything you want (including modifying and amending it). All I ask is that you leave the '网页模板' link in the footer of the template. All of the photos were taken by me - use as you wish.</p>
        <h3>Browser Compatibility</h3>
        <p>This template has been tested in the following browsers:</p>
        <ul>
          <li>Internet Explorer 8</li>
          <li>Internet Explorer 7</li>
          <li>FireFox 10</li>
          <li>Google Chrome 17</li>
        </ul>
      </div>
    </div>
    <footer>
      <p>Copyright &copy; photo_style_two | <a href="http://www.cssmoban.com">网页模板</a></p>
    </footer>
  </div>
  <p>&nbsp;</p>
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.sooperfish.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/image_fade.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('ul.sf-menu').sooperfish();
    });
  </script>
</body>
</html>
