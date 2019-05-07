<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
%>

<%-- <table style='width: 100%; margin: 10px auto 30px; border-spacing: 0px;'>
	<tbody id='listReply'>
<c:forEach var="dto" items="${listReply }">
	    <tr height='35' style='background: #eeeeee;'>
	       <td width='100%' style='padding:5px 5px; border:1px solid #cccccc;'>
	          ${dto.answerContent }      
	        </td>
	    </tr>
	    <tr height='35'>
	     	<td width='100%' style='padding:5px 5px;' align="right">
	    		  <span>${dto.answerCreated }</span>   
	        </td>  
	    </tr>
</c:forEach>
	</tbody>
</table>
 --%>