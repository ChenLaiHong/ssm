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
    
    <jsp:include page="/common/menu.jsp"/>   
       
    <div id="site_content">
      
      <jsp:include page="/common/photo.jsp"/>   
      
       <div id="content">
        <h1>Blog</h1>
        <div id="blog_container">
          <div class="blog"><h2>Nov</h2><h3>22nd</h3></div>
          <h4 class="select"><a href="#">Magazine Photo-Shoot on the Isle-Of-Islay</a></h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <a href="#">read more.....</a></p>
          <div class="blog"><h2>Oct</h2><h3>25th</h3></div>
          <h4><a href="#">Wedding Shoot in Edinburgh</a></h4>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <a href="#">read more.....</a></p>
        </div>
        <p></p>
      </div>
    </div>
    
    <jsp:include page="/common/foot.jsp"/>   
    
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
