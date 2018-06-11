<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="div_style">
		<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #00A4F5">
			<a class="navbar-brand" href="#nowhere"  style="color: #fff">酒店管理系统</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp"  style="color: #fff">首页</a>
			<a class="navbar-brand" style="color: #fff">|</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath }/user_list_message?user.userid=${user.userid }"  style="color: #fff">用户信息</a>
			<a class="navbar-brand" style="color: #fff">|</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath }/user_list_order?user.userid=${user.userid }"  style="color: #fff">订单查询</a>
			<!-- <a class="navbar-brand" href="${pageContext.request.contextPath }/user_list_room?room.status=0">房间预订</a> -->
			<a class="navbar-brand" style="color: #fff">|</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath }/user_list_booked_room?room.status=1"  style="color: #fff">房间退订</a>
			<a class="navbar-brand pull-right"  style="color: #fff">${session.user.username }</a>
			<a class="navbar-brand pull-right" style="color: #fff">|</a>
			<a class="navbar-brand pull-right" signOut="true"  style="color: #fff">注销</a>
		</nav>
	</div>