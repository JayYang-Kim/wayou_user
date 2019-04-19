<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<c:if test="${isSaved==false}">
<script type="text/javascript">

	$(function(){
		$(".landList").draggable({
			opacity:"0.3",
			revert: true,
			helper:"clone",
			drag:function(){
				dragObject = $(this);
			},
			stop:function(){
				dragObject = null;
			}
		});
	});
</script>
</c:if>
	<c:forEach var="dto" items="${list}">
		<div class="landList">
			<input type="hidden" name="info" data-landCode="${dto.landCode}" data-lat="${dto.lat}" data-lng="${dto.lng}" data-landName="${dto.landName}">
			<img src="<%=cp%>/resource/user/images/travel/seoul.jpg" class="locImage" draggable="false">
			<div style="float: left; padding-left: 5px; padding-top: 12px; font-size: 16px;">
				<span style="padding-left:0px;"><b>${dto.landName}</b></span><br><span style="color: #b3b3b3; font-size: 12px;">${dto.tagCode==1?'역사/종교':(dto.tagCode==2?'숙박':(dto.tagCode=3?'쇼핑':'음식점'))}</span><br>
			</div>
			<c:if test="${day=='all'}">
				<div style="color: #b3b3b3; font-size: 12px; width: 30px;">${dto.day}일차</div>
			</c:if>
			<c:if test="${day!='all'}">
				<div class="next3${isSaved==true?' removeLocation':''}">${isSaved==true?'X':'&gt;'}</div>	
			</c:if>
			
		</div>
	</c:forEach>
	