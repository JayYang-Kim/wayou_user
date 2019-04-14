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
<input type="hidden" id="userIdx" value="${dto.userIdx}"/>
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
	            <c:if test="${sessionScope.member.userIdx == dto.createdUserIdx && dto.pCode == 0}">
	            	<div class="mt10">
	            		<%-- <a href="#" id="joinParty_accept" class="like">수락</a>
	             		<a href="#" id="joinParty_refuse" class="like">거절</a> --%>
	             		<button type="button" id="joinParty_accept" class="like">수락</button>
	             		<button type="button" id="joinParty_refuse" class="like">거절</button>
	            	</div>
	            </c:if>
	            <c:if test="${sessionScope.member.userIdx == dto.createdUserIdx && dto.pCode != 0}">
	            	<div class="mt10">
	            		<span>${dto.pCode == 1 ? "참가 수락되었습니다." : ""}</span>
	            		<span>${dto.pCode == 2 ? "참가 거절되었습니다." : ""}</span>
	            		<span>${dto.pCode == 3 ? "참가 취소되었습니다." : ""}</span>
	            	</div>
	            </c:if>
	            <c:if test="${sessionScope.member.userIdx == dto.userIdx && dto.pCode == 0}">
	            	<div class="mt10">
	            		<%-- <a href="joinParty_modified" class="like">수정</a>
	            		<a href="joinParty_delete" class="like">삭제</a> --%>
	            		<button type="button" id="joinParty_modified" class="like">수정</button>
	             		<button type="button" id="joinParty_delete" class="like">삭제</button>
	            	</div>
	            </c:if>
	            <c:if test="${sessionScope.member.userIdx == dto.userIdx && dto.pCode != 0}">
	            	<div class="mt10">
	            		<span>${dto.pCode == 1 ? "참가 수락되었습니다." : ""}</span>
	            		<span>${dto.pCode == 2 ? "참가 거절되었습니다." : ""}</span>
	            		<span>${dto.pCode == 3 ? "참가 취소되었습니다." : ""}</span>
	            	</div>
	            </c:if>
	        </div>
	    </div>
	</li>
</c:forEach>