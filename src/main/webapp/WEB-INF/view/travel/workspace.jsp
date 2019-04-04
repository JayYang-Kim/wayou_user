<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<nav id="navBar">
	<div class="workspace-title">
	  hi
	</div>
	<div class="scrollbox">
		<div class="locList">
			<img src="<%=cp%>/resource/user/images/travel/seoul.jpg" class="locImage">
			<p>
			<span style="color: white;">서울<br>Seoul</span>
			</p>
		</div> 
	</div>
</nav>
	<div class="searchSpace">
		
	</div>
<div style="width: 50%; height: 750px; float:right;" id="map"></div>
<script type="text/javascript">
$(function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new daum.maps.LatLng(37.5670287, 126.9804529), // 지도의 중심좌표
	    level: 3, // 지도의 확대 레벨
	    mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
	}; 

	// 지도를 생성한다 
	var map = new daum.maps.Map(mapContainer, mapOption);	
});
</script>