<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>酒店管理系统</title>
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
<script type="text/javascript">
	$(function () {
		if ('geolocation' in navigator) {
			navigator.geolocation.getCurrentPosition(function(position) {
				console.log(position.coords.latitude, position.coords.longitude);
				$.ajax({
					url:'http://restapi.amap.com/v3/geocode/regeo?key=14588ff247c6bee6e5aa45427711b95e&location=' + position.coords.longitude + ',' + position.coords.latitude,
					type:'GET',
					dataType:'json',
					success: function(msg) {
						console.log(msg.regeocode.addressComponent.city)
						$('#position').text(msg.regeocode.addressComponent.city)
					},
					error: function(error) {
						console.log(error.code)
					}
				});
			});
		}
	});
	$(document).ready(function() {
		$('#searchForm').submit(function() {
			var datein = $('#datein').val()
			var dateout = $('#dateout').val()
			if (dateout <= datein) {
				alert('退订日期要晚于入住日期')
				$('#dateout').focus()
				return false;
			}
		});
	});
</script>
</head>
<body>
<%@include file="include/nav.jsp" %>
<div class="container" style="margin: 80px auto;">
	<div class="panel panel-info">
		<div class="panel-heading">酒店搜索</div>
		<div class="panel-body">
			<form action="tourist_search_room" id="searchForm" method="post">
				<table class="table-condensed">
					<tr><td>目的地</td><td><input type="text" name="destination" id="destination" class="form-control" value="${destination }" required></td></tr>
					<tr><td>入住</td><td><input type="date" name="datein" id="datein" class="form-control" required></td><td>退房</td><td><input type="date" name="dateout" id="dateout" class="form-control" required></td></tr>
					<tr><td>房间类型</td><td><select name="keywords" id="keywords" class="form-control"><option value="单人间" <c:if test="${keywords == '单人间' }">selected="selected"</c:if>>单人间</option><option value="双人间" <c:if test="${keywords == '双人间' }">selected="selected"</c:if>>双人间</option><option value="三人间" <c:if test="${keywords == '三人间' }">selected="selected"</c:if>>三人间</option><option value="豪华套间" <c:if test="${keywords == '豪华套间' }">selected="selected"</c:if>>豪华套间</option></select></td></tr>
					<tr><td colspan="2" align="center"><button class="btn btn-default" type="submit" id="search">搜索</button></td></tr>
				</table>
			</form>
		</div>
	</div>
	<h1 class="label label-info">预订房间</h1>
	<a href="tourist_search_room?orderRoomByCol=price&orderRules=asc&destination=${destination }&keywords=${keywords}" class="pull-right"><span class="glyphicon glyphicon-chevron-up"></span></a><span class="label pull-right">|</span>
	<a href="tourist_search_room?orderRoomByCol=price&orderRules=desc&destination=${destination }&keywords=${keywords}" class="pull-right"><span class="glyphicon glyphicon-chevron-down"></span></a>
		<br>
		<br>
		<div >
			<table class="table table-hover table-striped table-bordered table-condensed">
				<thead><tr class="success"><th>ID</th><th>房间名</th><th>价格</th><th>分类</th><th>地址</th><th>预订</th></tr></thead>
				<c:forEach items="${rooms }" var="c">
					<tr>
						<td>${c.roomid }</td>
						<td>${c.name }</td>
						<td>${c.price }</td>
						<td>${c.category }</td>
						<td>${c.address }</td>
						<td><a href="${pageContext.request.contextPath }/user_add_order?order.room.roomid=${c.roomid}&order.user.userid=${session.user.userid}&order.createDate=<%=new Date().getTime()%>"><span class="glyphicon glyphicon-plus"></span></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
</div>
</body>
</html>