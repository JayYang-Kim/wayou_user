<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

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
	<c:forEach var="dto" items="${list}">
		<div class="landList">
			<input type="hidden" name="info" data-landCode="${dto.landCode}" data-lat="${dto.lat}" data-lng="${dto.lng}" data-landName="${dto.landName}">
			<img src="<%=cp%>/resource/user/images/travel/seoul.jpg" class="locImage" draggable="false">
			<div style="float: left; padding-left: 5px; padding-top: 12px; font-size: 16px;">
				<span><b>${dto.landName}</b></span><br><span style="color: #b3b3b3; font-size: 12px;">${dto.tagCode==1?'역사/종교':(dto.tagCode==2?'숙박':(dto.tagCode=3?'쇼핑':'음식점'))}</span>
			</div>
			<div class="next3${isSaved==true?' removeLocation':''}">${isSaved==false?'&gt;':'X'}</div>
		</div>
	</c:forEach>
	