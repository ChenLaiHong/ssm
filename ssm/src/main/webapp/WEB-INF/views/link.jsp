<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>链接</title>
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
		<div class="data_list">
				<div class="data_list_title">
					<img src="${APP_PATH}/static/images/link_icon.png"/>
					<div style="color:#F00">友情链接</div>
				</div>
				<div class="datas">
					<ul>
						<c:forEach items="${linkList.list }" var="link">
							<li><span><a href="${link.linkUrl }" target="_blank">${link.linkName }</a></span></li>
						</c:forEach>
					</ul>
				</div>
			</div>

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

</body>
</html>