<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div style="width: 100%;padding:15px 10px;">
		<table>
			<tr>
				<td width="30%"><img src="<%=cp%>/resource/user/images/travel/seoul.jpg" class="locImage"></td>
				<td><h4>${dto.locName}<br>${dto.locEName}</h4></td>
			</tr>
			<tr>
				<td colspan="2">
					<p>소개 : ${dto.memo}
						
							Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam non mod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et eabum. Stet clita kasd gubergren, no sea takimata sanctus
							est Lorem ipsum dolor sit amet
						
					</p>
				</td>
			</tr>
		</table>
</div>