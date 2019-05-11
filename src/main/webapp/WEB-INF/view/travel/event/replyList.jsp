<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<div id="reply" style="border-top: 1px solid #e5e5e5;" data-dataCount="${dataCount}">
	<c:forEach var="dto" items="${list}">
		<div class="replyBox" style="border-bottom: 1px solid #e5e5e5; padding: 15px 20px;" data-replyCode="${dto.replyCode}" data-userIdx="${dto.userIdx}">
			<div style="width: 75%; float: left;">
				<p>${dto.userName}</p>
				<p><input type="text" value='${dto.content}' style="border: none; width: 97%; height: 100px;" readonly="readonly"></p>
				<p>${dto.created}</p>
			</div>
			<c:if test="${dto.userIdx==sessionScope.member.userIdx}">
				<div style="width: 24%; float: left; height: 130px;">
					<button class="btn btn-gray deleteReplyBtn" style="position: relative; top:50%;">삭제</button>
				</div>
			</c:if>
			<div style="clear: both;"></div>
		</div>
		
	</c:forEach>
	</div>
	<div> 
		<p>${paging}</p>
	</div>
