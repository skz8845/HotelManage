<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="div_style">
		<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #00A4F5">
			<a class="navbar-brand" href="#nowhere"  style="color: #fff">酒店后台管理</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath }/admin_list_user"  style="color: #fff">用户管理</a>
			<a class="navbar-brand" style="color: #fff">|</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath }/admin_list_order"  style="color: #fff">订单管理</a>
			<a class="navbar-brand" style="color: #fff">|</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath }/admin_list_room"  style="color: #fff">房间管理</a>
			<a class="navbar-brand pull-right"  style="color: #fff">${session.admin.username }</a>
			<a class="navbar-brand pull-right" style="color: #fff">|</a>
			<a class="navbar-brand pull-right" signOut="true"  style="color: #fff">注销</a>
		</nav>
</div>