<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div>
	<c:forEach var="listTicketFile" items="${listTicketFile}">
		<img src="/wadmin/uploads/ticket/${listTicketFile.saveFilename}" alt="" style="padding-left: 200px; padding-top: 50px; padding-bottom: 50px;">
	</c:forEach>
</div>