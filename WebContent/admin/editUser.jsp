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
</style>
<script type="text/javascript">
	$(document).ready(
		function(){
			$("#editForm").submit(
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
<c:if test="${empty session.admin }">
	<%@include file="../include/admin/adminIll.jsp" %>
</c:if>
<c:if test="${not empty session.admin }">
	<%@include file="../include/admin/adminNav.jsp" %>
	<center>
		<div style="width: 400px;margin-top:80px; text-align: center;">
			<form method="post" action="${pageContext.request.contextPath }/admin_update_user" id="editForm">
				<table class="table table-hover table-striped table-condensed table-bordered">
					<tr><td>用户名</td><td><input type="text" name="user.username" id="username" value="${user.username }" required></td></tr>
					<tr><td>密码</td><td><input type="password" name="user.password" id="password" value="${user.password }" required></td></tr>
					<tr><td>手机号</td><td><input type="text" name="user.mobile" id="mobile" value="${user.mobile }"></td></tr>
					<tr><td>邮箱</td><td><input type="text" name="user.email" id="email" value="${user.email }"></td></tr>
					<tr><td colspan="2"><center><input type="hidden" name="user.userid" value="${user.userid }"> <button class="btn btn-warning">提交</button></center></td></tr>
				</table>
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