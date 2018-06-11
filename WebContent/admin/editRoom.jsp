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
</style>
</head>
<body>
<c:if test="${empty session.admin }">
	<%@include file="../include/admin/adminIll.jsp" %>
</c:if>
<c:if test="${not empty session.admin }">
	<%@include file="../include/admin/adminNav.jsp" %>
	<center>
		<div style="width: 400px;margin-top:80px; text-align: center;">
			<form method="post" action="${pageContext.request.contextPath }/admin_update_room">
				<table class="table table-hover table-striped table-condensed table-bordered">
					<tr><td>房间名</td><td><input type="text" name="room.name" id="name" value="${room.name }" required></td></tr>
					<tr><td>价格</td><td><input type="text" name="room.price" id="price" value="${room.price }" required></td></tr>
					<tr><td>分类</td><td><input type="text" name="room.category" id="category" value="${room.category }" required></td></tr>
					<tr><td>状态</td><td><input type="text" name="room.status" id="status" value="${room.status }" required></td></tr>
					<tr><td>城市</td><td><input type="text" name="room.address" id="address" value="${room.address }" required></td></tr>
					<tr><td colspan="2"><center><input type="hidden" name="room.roomid" value="${room.roomid }"> <button class="btn btn-warning">提交</button></center></td></tr>
				</table>
				<%@include file="../include/admin/adminAdvice.jsp" %>
			</form>
		</div>
	</center>
</c:if>
<script type="text/javascript">
$(document).ready(function () {
	$("a").click(function () {
		var delFlag = $(this).attr('delFlag')
		var signOut = $(this).attr('signOut')
		if ('true' == delFlag) {
			if (confirm('确定删除吗？')) {
				return true;
			}
			return false;
		}
		else if(signOut == 'true') {
			if (confirm('确定注销吗？')) {
				$.ajax({
					url:"admin_clear_session",
					async:true,
					success:function(msg){
						//alert(msg)
						if (msg == 'success') {
							window.location.href = '${pageContext.request.contextPath}/admin/admin_login.jsp'
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