<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<div id="container" style="height: 700px;">
	
	<div style="width: 25%; height:100%; float: left;">
		<div class="workspace-title" style="background-color: #404040; height: 8%; text-align: center; padding-top: 15px;">
<!-- 			<h1 style="color: white;">여행 도시를 선택하세요</h1> -->
			<input type="text" name="city" style="width: 90%; height: 31px; border:solid #c8c8ca 1px; padding-top: 5px;">
		</div>
		
		<div class="scrollbox">
			<div class="locList">
				<img src="<%=cp%>/resource/user/images/travel/seoul.jpg" class="locImage" style="float: left">
				<p style="float: left;"><span>서울<br>Seoul</span></p>
			</div>
		</div>
	</div>
	<div style="width: 75%; height: 700px; float: right;" id="map"></div>
	<script type="text/javascript">
		window.onload=function(){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(37.5670287, 126.9804529), // 지도의 중심좌표
				level : 3, // 지도의 확대 레벨
				mapTypeId : daum.maps.MapTypeId.ROADMAP
			// 지도종류
			};

			// 지도를 생성한다 
			var map = new daum.maps.Map(mapContainer, mapOption);
		};
	</script>
</div>