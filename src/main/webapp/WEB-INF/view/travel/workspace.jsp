<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d54199dccf04c47c7869a5d1e688d52d"></script>
<script>
	$(function(){
		listLocation('All');
		drawMap(37.5643368, 126.9756091);
	});
	$(function(){
		$("#locSearch").keyup(function(){
			var value = $(this).val();
			if(!value) value='All';
			listLocation(value);
		});
		
		$("body").on("click",".LocList", function(){
			var $info = $(this).children("input[type=hidden]");
			/* $info.attr("data-locCode")+","+$info.attr("data-lat")+","+$info.attr("data-lng")); */
			drawMap($info.attr("data-lat"),$info.attr("data-lng"));
			
			var url = "<%=cp%>/travel/locInfo";
			$.ajax({
				
			});
		});
	});
	
	function listLocation(data){
		var url = "<%=cp%>/travel/locList";
		var query = "name="+encodeURIComponent(data);	
		$.ajax({
			type:"get",
			url:url,
			data:query,
			success:function(data){
				$("#locScrollBox").html(data);
			},
			beforesend:function(e){
				e.setRequestHeader("AJAX",true);
			},
			error:function(e){
				console.log(e.responseText);
			}
			
		});
	}
	function drawMap(lat,lng){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
			level : 3, // 지도의 확대 레벨
			mapTypeId : daum.maps.MapTypeId.ROADMAP
		// 지도종류
		};
		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption);
		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(lat, lng), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
		
	}
</script>

<div id="container">
	<div class="row" style="height: 680px;">
		<div class="col-sm-3" id="navBar">
			<div class="workspace-title" align="center">
				<h6 style="color: white;">여행할 도시를 선택해 주세요</h6>
				<input type="text" style="height:31px; width: 90%; margin-top: 5px;" id="locSearch">
			</div>
			<div id="locScrollBox" class="scrollbox"></div>
			</div>

		<div class="col-sm-3" style="height: 100%; border: 1px solid #e4e4e4; border-left: none;margin: 0;
  padding : 0;">
			<div class="landmark-title" align="center">
				<h5 style="color: white; padding-top: 20px;">도시 정보</h5>
			</div>
			<div id="landInfo" style="height: 564px;">
				
			</div>
			<div>
				<button class="button" style="background: teal; width: 100%; color: white; font-size: 16px; height: 50px;">일정만들기</button>
			</div>
		</div>

		<div class="col-sm-6" style="height: 100%; overflow: hidden;"id="map"></div>
		
	</div>
</div>