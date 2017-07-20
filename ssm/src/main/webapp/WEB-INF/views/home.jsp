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
