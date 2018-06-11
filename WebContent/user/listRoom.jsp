<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房间管理</title>
<link href="${pageContext.request.contextPath }/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery/2.0.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style type="text/css">
	.div_style {
		width: 100%;
	}
	ul.pagination a.current{
		font-weight:bold;
		color:black;
	}
</style>
</head>
<body>
<body>
<c:if test="${empty session.user }">
	<%@include file="../include/user/userIll.jsp" %>
</c:if>
<c:if test="${not empty session.user }">
	<%@include file="../include/user/userNav.jsp" %>
	<div style="margin: 80px;">
		<h1 class="label label-info">房间预订</h1>
		<br>
		<br>
		<div >
			<table class="table table-hover table-striped table-bordered table-condensed">
				<thead><tr class="success"><th>ID</th><th>房间名</th><th>价格</th><th>分类</th><th>预订</th></tr></thead>
				<c:forEach items="${rooms }" var="c">
					<tr>
						<td>${c.roomid }</td>
						<td>${c.name }</td>
						<td>${c.price }</td>
						<td>${c.category }</td>
						<td><a href="${pageContext.request.contextPath }/user_add_order?order.room.roomid=${c.roomid}&order.user.userid=${session.user.userid}&order.createDate=<%=new Date().getTime()%>"><span class="glyphicon glyphicon-plus"></span></a></td>
					</tr>
				</c:forEach>
			</table>
			<%@include file="../include/user/userAdvice.jsp" %>
		</div>
		<%@include file="../include/user/userPage.jsp" %>
	</div>
</c:if>
<script type="text/javascript">
$(document).ready(function () {
	$("a").click(function () {
		var delFlag = $(this).attr('delFlag')
		var signOut = $(this).attr('signOut')
		console.log(delFlag)
		console.log(signOut)
		if ('true' == delFlag) {
			if (confirm('确定删除吗？')) {
				return true;
			}
			return false;
		}
		else if(signOut == 'true') {
			if (confirm('确定注销吗？')) {
				$.ajax({
					url:"user_clear_session",
					async:true,
					success:function(msg){
						//alert(msg)
						if (msg == 'success') {
							window.location.href = '${pageContext.request.contextPath}/user/login.jsp'
						}
					} 
				});
			}
		}
	});
});
</script>
</body>
</html>