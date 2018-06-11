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
			<form method="post" action="${pageContext.request.contextPath }/admin_update_order">
				<table class="table table-hover table-striped table-condensed table-bordered">
					<tr><td>用户id</td><td><input type="text" name="order.user.userid" id="userid" value="${order.user.userid }" required></td></tr>
					<tr><td>房间id</td><td><input type="text" name="order.room.roomid" id="roomid" value="${order.room.roomid }" required></td></tr>
					<tr><td colspan="2"><center><input type="hidden" name="order.createDate" id="createDate" value="${order.createDate }"><input type="hidden" name="order.orderid" value="${order.orderid }"> <button class="btn btn-warning">提交</button></center></td></tr>
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