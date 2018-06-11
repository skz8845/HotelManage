<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link href="${pageContext.request.contextPath }/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery/2.0.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style type="text/css">
	.div_style {
		width: 400px;align-self: center;
	}
</style>
<script type="text/javascript">
	$(document).ready(
		function(){
			$("#registForm").submit(
			function () {
				var username = $("#username").val();
				var password = $("#password").val();
				var passwd = $("#passwd").val();
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
				if (passwd.length == 0) {
					$("#passwd").focus();
					alert('密码不能为空')
					return false;
				}
				else if(password != passwd) {
					$("#passwd").focus();
					alert('密码不一致')
					return false;
				}
				var mobile = $("#mobile").val()
				if (mobile.length > 0) {
					var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;  
			        if (!myreg.test(mobile)) {
			        	alert('请输入有效手机号')
			        	$("#mobile").focus()
			            return false;  
			        } else {  
			            return true;  
			        }  
				}
				var email = $("#email").val()
				if (email.length > 0) {
					var reg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
					if (!reg.test(email)) {
						alert('请输入有效邮箱')
						$("#email").focus()
						return false
					}
					else return true
				}
			});
		});
</script>
</head>
<body>
<div class="container div_style">
<%@include file="../include/user/userAdvice.jsp" %>
<div class="panel panel-primary">
	<div class="panel-heading">注册</div>
	<div class="panel-body">
			<form method="post" action="${pageContext.request.contextPath }/user_regist" id="registForm">
				<div class="form-group">
					<label for="username">用户名</label>
					<input type="text" id="username" name="user.username" class="form-control" placeholder="请输入用户名" required>
				</div>
				<div class="form-group">
					<label for="password">密码</label>
					<input type="password" id="password" name="user.password" class="form-control" placeholder="请输入密码" required>
				</div>
				<div class="form-group">
					<label for="passwd">确认密码</label>
					<input type="password" id="passwd" name="passwd" class="form-control" placeholder="再次输入密码" required>
				</div>
				<div class="form-group">
					<label for="mobile">手机号</label>
					<input type="text" id="mobile" name="user.mobile" class="form-control" placeholder="请输入手机号">
				</div>
				<div class="form-group">
					<label for="email">手机号</label>
					<input type="email" id="email" name="user.email" class="form-control" placeholder="请输入邮箱">
				</div>
				<div class="btn-group btn-group-justified">
					<div class="btn-group">
						<button type="submit" class="btn btn-default">注册</button>
					</div>
					<div class="btn-group">
						<a href="${pageContext.request.contextPath }/user/login.jsp" class="btn btn-default">取消</a>
					</div>
				</div>
			</form>
		</div>
</div>
</div>
</body>
</html>