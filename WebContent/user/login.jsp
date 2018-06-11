<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<link href="${pageContext.request.contextPath }/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery/2.0.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style type="text/css">
	.div_style {
		width: 400px;align-self: center;margin-top:100px;
	}
</style>
<script type="text/javascript">
	$(document).ready(
		function(){
			$("#addForm").submit(
			function () {
				var username = $("#username").val();
				var password = $("#password").val();
				if (username.length == 0) {
					$("#username").focus();
					alert('用户名不能为空')
					return false;
				}
				if (password.length == 0) {
					$("#password").focus();
					alert('密码不能为空')
					return false;
				}
			});
		});
</script>
</head>
<body>
<div class="container div_style">
<%@include file="../include/user/userAdvice.jsp" %>
<div class="panel panel-primary">
	<div class="panel-heading">登录</div>
	<div class="panel-body">
			<form method="post" action="${pageContext.request.contextPath }/user_login">
				<div class="form-group">
					<label for="username">用户名</label>
					<input type="text" id="username" name="user.username" class="form-control" placeholder="请输入用户名" required>
				</div>
				<div class="form-group">
					<label for="password">密码</label>
					<input type="password" id="password" name="user.password" class="form-control" placeholder="请输入密码" required>
				</div>
				<div class="btn-group btn-group-justified">
					<div class="btn-group">
						<button type="submit" class="btn btn-default">登录</button>
					</div>
					<div class="btn-group">
						<a href="${pageContext.request.contextPath }/user/regist.jsp" class="btn btn-default">注册</a>
					</div>
				</div>
			</form>
		</div>
</div>
</div>
</body>
</html>