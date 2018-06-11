<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
<c:if test="${session.userAccess == 'true' }"><%response.sendRedirect(request.getContextPath() + "/user/login.jsp"); %></c:if> <c:if test="${session.adminAccess == 'true'}"><%response.sendRedirect(request.getContextPath() + "/admin/admin_login.jsp"); %></c:if>
</body>
</html>