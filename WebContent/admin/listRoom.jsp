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
<script type="text/javascript">
$(document).ready(function() {
	$("#addRoom").click(function () {
		var name = $("#name").val();
		var price = $("#price").val();
		var category = $("#category").val();
		var status = $("#status").val();
		if (name.length == 0) {
			$("#name").focus();
			return false;
		}
		if (price.length == 0) {
			$("#price").focus();
			return false;
		}
		else {
			if (isNaN(price)) {
				$("#price").focus();
				return false;
			}
		}
		if (category.length == 0) {
			$("#category").focus();
			return false;
		}
		if (status.length == 0) {
			$("#status").focus();
			return false;
		}
		else {
			if (isNaN(status)) {
				$("#status").focus();
				return false;
			}
		}
	});
});
</script>
</head>
<body>
<body>
<c:if test="${empty session.admin }">
	<%@include file="../include/admin/adminIll.jsp" %>
</c:if>
<c:if test="${not empty session.admin }">
	<%@include file="../include/admin/adminNav.jsp" %>
	<div style="margin: 80px;">
		<h1 class="label label-info">房间管理</h1>
		<br>
		<br>
		<div >
			<table class="table table-hover table-striped table-bordered table-condensed">
				<thead><tr class="success"><th>ID</th><th>房间名</th><th>价格</th><th>分类</th><th>状态</th><th>编辑</th><th>删除</th></tr></thead>
				<c:forEach items="${rooms }" var="c">
					<tr>
						<td>${c.roomid }</td>
						<td>${c.name }</td>
						<td>${c.price }</td>
						<td>${c.category }</td>
						<td>${c.status }</td>
						<td><a href="${pageContext.request.contextPath }/admin_edit_room?room.roomid=${c.roomid }"><span class="glyphicon glyphicon-edit"></span></a></td>
						<td><a href="${pageContext.request.contextPath }/admin_delete_room?room.roomid=${c.roomid }" delFlag="true"><span class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<%@include file="../include/admin/adminPage.jsp" %>
		<%@include file="../include/admin/adminAdvice.jsp" %>
		<center>
		<div class="panel panel-primary" style="width: 400px;">
			<div class="panel-heading">添加房间</div>
			<div class="panel-body">
				<form action="${pageContext.request.contextPath }/admin_add_room" method="post">
					<table class="table table-striped table-condensed">
						<tr><td>房间名</td><td><input type="text" class="form-control" name="room.name" id="name" required></td></tr>
						<tr><td>价格</td><td><input type="text" class="form-control" name="room.price" id="price" required></td></tr>
						<tr><td>分类</td><td><input type="text" class="form-control" name="room.category" id="category" required></td></tr>
						<tr><td>状态</td><td><input type="text" class="form-control" name="room.status" id="status" required></td></tr>
						<tr><td>城市</td><td><input type="text" class="form-control" name="room.address" id="address" required></td></tr>
						<tr><td colspan="2"><center><button id="addRoom" class="btn btn-default">提交</button></center></td></tr>
					</table>
				</form>
			</div>
		</div>
		</center>
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