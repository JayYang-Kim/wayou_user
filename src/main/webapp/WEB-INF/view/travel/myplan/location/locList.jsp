<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<c:forEach var="dto" items="${list}">
		<div class="locList">
			<input type="hidden" name="info" data-locCode="${dto.locCode}" data-lat="${dto.lat}" data-lng="${dto.lng}">
			<img src="<%=cp%>/uploads/location/${dto.saveFilename}" class="locImage">
			<div
				style="float: left; padding-left: 5px; padding-top: 12px; font-size: 16px;">
				<span><b>${dto.locName}</b></span><br> <span style="color: #b3b3b3; font-size: 12px;">${dto.locEName}</span>
			</div>
		</div>
	</c:forEach>