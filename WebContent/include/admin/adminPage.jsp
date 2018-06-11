<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div style="text-align: center;">
			<c:if test="${not empty pageInfo }">
			<nav>
				<ul class="pagination" style="align-content: center;">
					<li <c:if test="${!pageInfo.hasPrevious }">class="disabled"</c:if>>
						<a href="?pageInfo.start=0${pageInfo.param}"><span>&lt;&lt;</span></a>
					</li>
					<li <c:if test="${!pageInfo.hasPrevious }">class="disabled"</c:if>>
						<a href="?pageInfo.start=${pageInfo.start - pageInfo.count }${pageInfo.param}"><span>&lt;</span></a>
					</li>
					<c:forEach begin="0" end= "${pageInfo.totalPage - 1 }" varStatus="status">
						<c:if test="${status.count * pageInfo.count - pageInfo.start <= 20 && status.count * pageInfo.count - pageInfo.start >= -10 }">
							<li <c:if test="${status.index * pageInfo.count == pageInfo.start }">class="disabled"</c:if>>
								<a href="?pageInfo.start=${status.index * pageInfo.count }${pageInfo.param}" <c:if test="${status.index * pageInfo.count == pageInfo.start }">class="current"</c:if>>${status.count }</a>
							</li>
						</c:if>
					</c:forEach>
					<li <c:if test="${!pageInfo.hasNext }">class="disabled"</c:if>>
						<a href="?pageInfo.start=${pageInfo.start + pageInfo.count }${pageInfo.param}"><span>&gt;</span></a>
					</li>
					<li <c:if test="${!pageInfo.hasNext }">class="disabled"</c:if>>
						<a href="?pageInfo.start=${pageInfo.last }${pageInfo.param}"><span>&gt;&gt;</span></a>
					</li>
				</ul>
			</nav>
			</c:if>
