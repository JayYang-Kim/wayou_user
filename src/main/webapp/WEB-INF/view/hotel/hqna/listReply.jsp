<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<c:forEach var="dto" items="${listReply }">
        <div>
            <table style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
	    <tr height='35' style='background: #eeeeee;'>
	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
	           <span><b>관리자</b></span>
	        </td>
	       <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'>
	           <span>${dto.answerCreated }</span> |
	       </td>
	    </tr>
	    <tr>
	        <td colspan='2' valign='top' style='padding:5px 5px;'>
	             ${dto.answerContent }
	        </td>
	    </tr>
            </table>
		</div>
</c:forEach>