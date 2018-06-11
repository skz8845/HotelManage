<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
		<div class="panel panel-danger">
			<div class="panel-heading">警告</div>
			<div class="panel-body">
				<div class="alert alert-warning">
					<a href="#" class="close" data-dismiss="alert">
						&times;
					</a>
					<strong>你无权操作！</strong>
				</div>
			</div>
		</div>
		<div><a href="${pageContext.request.contextPath }/user/login.jsp" class="btn btn-info">前往登录</a></div>
	</div>