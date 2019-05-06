<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<h4 class="widget-title mb-30">최신 파티 (Top5)</h4>

<c:forEach var="dto" items="${list}">
	<div class="single-recent-post d-flex">
	    <!-- Content -->
	    <div class="post-content">
	        <!-- Post Meta -->
	        <div class="post-meta">
	            <span class="">파티장 : ${dto.userId}</span>
                <span class="pl10 pr10">/</span>
                <span class="">작성일 : ${dto.created}</span>
	        </div>
	        <a href="${articleUrl}&partyCode=${dto.partyCode}" class="post-title">${dto.subject}</a>
	        <div>
	        	<span>시작일 : ${dto.startDate}</span>
			</div>
			<div>
	        	<span>종료일 : ${dto.endDate}</span>
			</div>
	    </div>
	</div>
</c:forEach>