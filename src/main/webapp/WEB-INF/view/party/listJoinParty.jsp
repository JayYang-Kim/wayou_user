<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<input type="hidden" id="total_page" value="${total_page}"/>
<input type="hidden" id="page" value="${page}"/>
<input type="hidden" id="dataCount" value="${dataCount}"/>
<c:forEach var="dto" items="${list}">
	<li class="single_comment_area">
	    <div class="comment-content d-flex">
	        <div class="comment-author">
	            <img src="<%=cp%>/resources/images/common/defaultImg.jpeg" alt="프로필 사진">
	        </div>
	        <div class="comment-meta">
	            <a href="#" class="post-date">${dto.created}</a>
	            <h5>${dto.userId}</h5>
	            <p>${dto.memo}</p>
	            <c:if test="${sessionScope.member.userIdx == dto.userIdx}">
	            	<div class="mt10">
	            		<a href="#" class="like">수락</a>
	             		<a href="#" class="reply">거절</a>
	            	</div>
	            </c:if>
	        </div>
	    </div>
	</li>
</c:forEach>