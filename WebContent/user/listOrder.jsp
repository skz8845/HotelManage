<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
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
<script type="text/javascript">
$(document).ready(function () {
	$(".addOrder").click(function () {
		var userid = $("#userid").val();
		var roomid = $("#roomid").val();
		if (userid.length == 0) {
			$("#userid").focus();
			return false;
		}
		if (roomid.length == 0) {
			$("#roomid").focus();
			return false;
		}
	});
});
</script>
</head>
<body>
<body>
<c:if test="${empty session.user }">
	<%@include file="../include/user/userIll.jsp" %>
</c:if>
<c:if test="${not empty session.user }">
	<%@include file="../include/user/userNav.jsp" %>
	<div style="margin: 80px;">
		<h1 class="label label-info">订单查询</h1>
		<br>
		<br>
		<div >
			<table class="table table-hover table-striped table-bordered table-condensed">
				<thead><tr class="success"><th>ID</th><th>房间ID</th><th>日期</th></tr></thead>
				<c:forEach items="${orders }" var="c">
					<tr>
						<td>${c.orderid }</td>
						<td>${c.room.roomid }</td>
						<td>${c.createDate }</td>
					</tr>
				</c:forEach>
			</table>
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