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
	            <%-- <a href="#" class="post-date">${dto.created}</a> --%>
	            <input type="hidden" id="userIdx" value="${dto.userIdx}"/>
	            <span class="post-date">${dto.created}</span>
	            <h5>${dto.userId}</h5>
	            <p>${dto.memo}</p>
	            <c:if test="${sessionScope.member.userIdx == dto.createdUserIdx && dto.pCode == 0}">
	            	<div class="mt10">
	             		<button type="button" id="joinParty_accept" class="like">수락</button>
	             		<button type="button" id="joinParty_refuse" class="like">거절</button>
	            	</div>
	            </c:if>
	            <%-- <c:if test="${sessionScope.member.userIdx == dto.createdUserIdx && dto.pCode != 0}">
	            	<div class="mt10">
	            		<c:if test="${dto.pCode == 1}">
	            			<span class="t_blue f14 exbold">참가 수락되었습니다.</span>
	            		</c:if>
	            		<c:if test="${dto.pCode == 2}">
	            			<span class="t_red f14 exbold">참가 거절되었습니다.</span>
	            		</c:if>
	            		<c:if test="${dto.pCode == 3}">
	            			<span class="f14 exbold">참가 취소되었습니다.</span>
	            		</c:if>
	            	</div>
	            </c:if> --%>
	            <c:if test="${sessionScope.member.userIdx == dto.userIdx && dto.pCode == 0}">
	            	<div class="mt10">
	            		<%--<button type="button" id="joinParty_modified" class="like">수정</button>--%>
	             		<button type="button" id="joinParty_delete" class="like">삭제</button>
	            	</div>
	            </c:if>
	            <c:if test="${dto.pCode != 0}">
	            <%-- <c:if test="${sessionScope.member.userIdx == dto.userIdx && dto.pCode != 0}"> --%>
	            	<div class="mt10">
	            		<c:if test="${dto.pCode == 1}">
	            			<span class="t_blue f14 exbold">참가 수락되었습니다.</span>
	            		</c:if>
	            		<c:if test="${dto.pCode == 2}">
	            			<span class="t_red f14 exbold">참가 거절되었습니다.</span>
	            		</c:if>
	            		<c:if test="${dto.pCode == 3}">
	            			<span class="f14 exbold">참가 취소되었습니다.</span>
	            		</c:if>
	            	</div>
	            </c:if>
	        </div>
	    </div>
	</li>
</c:forEach>