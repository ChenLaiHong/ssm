<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH}/static/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<link rel="stylesheet"
	href="${APP_PATH}/static/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript">
	function submitData() {
		var content = $("#content").val();
		if (content == null || content == '') {
			alert("请输入评论内容！");
		} else {
			$.post("${APP_PATH}/comment/save.do", {
				'content' : content,
				'blog.bid' : '${blog.bid}'
			}, function(result) {
				if (result.success) {
					window.location.reload();
					alert("评论已提交成功，审核通过后显示！");
				} else {
					alert(result.errorInfo);
				}
			}, "json");
		}
	}

	function showOtherComment() {
		$('.otherComment').show();
	}
</script>
<div class="data_list">
	<div>
		<div class="blog_title">
			<h3>
				<strong>${blog.title }</strong>
			</h3>
		</div>
		<div class="blog_info">
			发布时间：『
			<fmt:formatDate value="${blog.releaseDate }" type="date"
				pattern="yyyy-MM-dd HH:mm:ss" />
			』&nbsp;&nbsp;博客类别：${blog.blogType.typeName}&nbsp;&nbsp;阅读(${blog.clickHit})
			评论(${blog.replyHit})
		</div>
		<div class="blog_content">${blog.content }</div>
		<div class="blog_keyWord">
			<font><strong>关键字：</strong>
			</font>
			<c:choose>
				<c:when test="${keyWords==null}">
					&nbsp;&nbsp;无
				</c:when>
				<c:otherwise>
					<c:forEach var="keyWord" items="${keyWords }">
						&nbsp;&nbsp;<a href="${APP_PATH}/q.do?q=${keyWord}"
							target="_blank">${keyWord }</a>&nbsp;&nbsp;
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<div class="data_list">
	<div class="data_list_title">
		<img src="${APP_PATH}/static/images/comment_icon.png" /> 评论信息
		<c:if test="${commentList.size()>10}">
			<a href="javascript:showOtherComment()"
				style="float: right;padding-right: 40px;">显示所有评论</a>
		</c:if>
	</div>
	<div class="commentDatas">
		<c:choose>
			<c:when test="${commentList.size()==0}">
				暂无评论
			</c:when>
			<c:otherwise>
				<c:forEach var="comment" items="${commentList }" varStatus="status">
					<c:choose>
						<c:when test="${status.index<10 }">
							<div class="comment">
								<span><font>${status.index+1
										}楼&nbsp;&nbsp;&nbsp;&nbsp;</font>${comment.content
									}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<fmt:formatDate
										value="${comment.commentDate }" type="date"
										pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;]</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="otherComment">
								<div class="comment">
									<span><font>${status.index+1
											}楼&nbsp;&nbsp;&nbsp;&nbsp;</font>${comment.content
										}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[&nbsp;<fmt:formatDate
											value="${comment.commentDate }" type="date"
											pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;]</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<div class="data_list">
	<div class="data_list_title">
		<img src="${APP_PATH}/static/images/publish_comment_icon.png" /> 发表评论
	</div>
	<div class="publish_comment">
		<div>
			<textarea style="width: 100%" rows="3" id="content" name="content"
				placeholder="来说两句吧..."></textarea>
		</div>

		<div class="publishButton">
			<button class="btn btn-primary" type="button" onclick="submitData()">发表评论</button>
		</div>
		</form>
	</div>
</div>