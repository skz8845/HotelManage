<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${fn:length(session.msg)>0 }">
					<div class="form-group">
						<div class="alert alert-warning">
						    <a href="#" class="close" data-dismiss="alert">
						        &times;
						    </a>
						    <strong>${session.msg }</strong>
						</div>
					</div>
					<%session.removeAttribute("msg"); %>
				</c:if>