<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
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