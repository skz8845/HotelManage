<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link href="${pageContext.request.contextPath }/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery/2.0.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<c:if test="${empty session.admin }">
	<%@include file="../include/admin/adminIll.jsp" %>
</c:if>
<c:if test="${not empty session.admin }">
	<%@include file="../include/admin/adminNav.jsp" %>
	<div style="margin: 80px;">
		<h1 class="label label-info">用户管理</h1>
		<br>
		<br>
		<div >
			<table class="table table-hover table-striped table-bordered table-condensed">
				<thead><tr class="success"><th>ID</th><th>用户名</th><th>手机号</th><th>邮箱</th><th>编辑</th><th>删除</th></tr></thead>
				<c:forEach items="${users }" var="c">
					<tr>
						<td>${c.userid }</td>
						<td>${c.username }</td>
						<td>${c.mobile }</td>
						<td>${c.email }</td>
						<td><a href="${pageContext.request.contextPath }/admin_edit_user?user.userid=${c.userid }"><span class="glyphicon glyphicon-edit"></span></a></td>
						<td><a delFlag="true" href="${pageContext.request.contextPath }/admin_delete_user?user.userid=${c.userid }"><span class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<%@include file="../include/admin/adminPage.jsp" %>
	</div>
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