<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=591cb76973b1a523d68f564d17c08ff0"></script>
<script>
	var dragObject;
	var current_day;
	
	$(function(){
		listLandmark('${locCode}','All');
		drawMap('${lat}','${lng}');
		current_day = 1;
		loadSavedRouteByDay(1);
		$("#btn_addRouteByDay").text(current_day+"일차 작성완료");
	});
	
	$(function(){
		$("#landSearch").keyup(function(){
			var value = $(this).val();
			if(!value) value='All';
			listLandmark('${locCode}',value);
		});
		
		$("body").on("click",".landList", function(){
			var $info = $(this).children("input[type=hidden]");
			 $("map").empty();
			drawMap($info.attr("data-lat"),$info.attr("data-lng"));
		});
		
		$("body").on("click",".removeLocation", function(){
			if(!confirm("일정에서 삭제하시겠습니까?")){
				return false;
			}
			$(this).parent().remove();
			if($(this).closest("#landInfo").find("div").size==0){
				$("#tip").show();
			}
			$("#btn_addRouteByDay").css("background","#1cc3b2");
			$("#btn_addRouteByDay").prop("disabled",false);
		});
		
		
	});
	function listLandmark(locCode,data){
		var url = "<%=cp%>/travel/myplan/landList";
		var query = "locCode="+locCode;
		if(data!=null){
				query += "&landName="+encodeURIComponent(data);
		}
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
	
	function drawRouteToMap(objs){
		
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    mapOption = {
	        center : new daum.maps.LatLng('${lat}', '${lng}'), // 지도의 중심좌표
	        level : 7
	    // 지도의 확대 레벨
	    };
	 
	    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	    var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
	    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
	 
	    // 마커를 표시할 위치와 title 객체 배열입니다
	    var positions= [];
	   	for(var i=0; i<objs.length; i++){
	   		var $hiddenInfo = $(objs[i]).find("input[type=hidden]");
	   		var position = {
	   			title : $hiddenInfo.attr("data-landName"),
	   			latlng : new daum.maps.LatLng($hiddenInfo.attr("data-lat"), $hiddenInfo.attr("data-lng"))
	   		};
	   		positions[i] = position;
	   	}
	    // 마커 이미지의 이미지 주소입니다
	    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	 
	    for (var i = 0; i < positions.length; i++) {
	 
	        // 마커 이미지의 이미지 크기 입니다
	        var imageSize = new daum.maps.Size(24, 35);
	 
	        // 마커 이미지를 생성합니다    
	        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
	 
	        // 마커를 생성합니다
	        var marker = new daum.maps.Marker({
	            map : map, // 마커를 표시할 지도
	            position : positions[i].latlng, // 마커를 표시할 위치
	            title : positions[i].title,
	            image : markerImage
	        // 마커 이미지 
	        });
	    }
	 
	    var linePath;
	    var lineLine = new daum.maps.Polyline();
	    var distance;
	 
	    for (var i = 0; i < positions.length; i++) {
	        if (i != 0) {
	            linePath = [ positions[i - 1].latlng, positions[i].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
	        }
	        ;
	        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
	 
	        var drawLine = new daum.maps.Polyline({
	            map : map, // 선을 표시할 지도입니다 
	            path : linePath,
	            strokeWeight : 3, // 선의 두께입니다 
	            strokeColor : '#db4040', // 선의 색깔입니다
	            strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle : 'solid' // 선의 스타일입니다
	        });
	 
	        distance = Math.round(lineLine.getLength());
	        displayCircleDot(positions[i].latlng, distance);
	         
	    }
	 
	    function displayCircleDot(position, distance) {
	        if (distance > 0) {
	            // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
	            var distanceOverlay = new daum.maps.CustomOverlay(
	                    {
	                        content : '<div class="dotOverlay">거리 <span class="number">'
	                                + distance + '</span>m</div>',
	                        position : position,
	                        yAnchor : 1,
	                        zIndex : 2
	                    });
	 
	            // 지도에 표시합니다
	            distanceOverlay.setMap(map);
	        }
	    }
	}
	$(function(){
		$("#btn_addRouteByDay").click(function(){
			if(!confirm("저장하시겠습니까?")){
				return false;
			}
			
			var $landList = $("#landInfo").find("input[type=hidden]");
			var landCodes = [];
			for(var i=0; i<$landList.length; i++){
				landCodes[i] = $landList.eq(i).attr("data-landcode");
			}
			
			var url = "<%=cp%>/travel/myplan/addRouteByDay";
			var query = "day="+current_day+"&workNum=${workNum}&landCodes="+landCodes;
			
			$.ajax({
				type:"post",
				url : url,
				data : query,
				dataType : "json",
				success : function(data){
					if(data.isSuccess){
						alert("성공적으로 저장되었습니다.");
						return false;
					}else{
						alert("저장에 실패하였습니다. 잠시후 다시 시도해주세요");
					}
				},
				beforesend:function(e){
					e.setRequestHeader("AJAX",true);
				},
				error:function(e){
					console.log(e.responseText);
				}
			});
			
		});
	});
	
	function listByTag(tagNum){
		var url = "<%=cp%>/travel/myplan/listByTag";
		var query = "locCode=${locCode}&tagNum="+tagNum;
		
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
	
	$(function(){
		$(".dayBar").eq(1).addClass("ldbliActive");
		$(".dayBar").click(function(){
			var $selected = $(this);
			var $lis = $(this).parent().children(".dayBar");
			
			$(".btn_addRouteByDay").prop("disabled","disabled");
			
			$($lis).each(function(){
				if($(this).hasClass("ldbliActive")){
					$(this).removeClass("ldbliActive");
					return false;
				}
			});
			$(this).addClass("ldbliActive");
			if($(this).hasClass("dayBar-first")){
				$("#btn_addRouteByDay").text("전체 일정 리스트");
				return false;
			}
			current_day = $(this).attr("data-day");
			listLandmark('${locCode}','All');
			drawMap('${lat}','${lng}');
			loadSavedRouteByDay(current_day);
			$("#btn_addRouteByDay").text(current_day+"일차 작성완료");
		});
		
		$(".dayBar-first").click(function(){
			loadSavedRouteByDay(0);
			return false;
		});
		
		$("#totalComplete").click(function(){
			if(!confirm("일정 작성을 완료하시겠습니까?\n(저장되지 않은 내용은 삭제되며, 이후 수정 가능합니다.)")){
				return false;
			}
			location.href="<%=cp%>/travel/myplan/myList";
			return false;
		});
	});
	
	function loadSavedRouteByDay(day){
		var url = "<%=cp%>/travel/myplan/loadSavedRouteByDay";
		var query = "day="+day+"&workNum=${workNum}";
		
		$.ajax({
			type:"get",
			url:url,
			data:query,
			success:function(data){
				$("#landInfo").html(data);
				if($("#landInfo").children("div").length!=0){
					drawRouteToMap($("#landInfo").children("div"));
				}
				return false;
			},
			beforesend:function(e){
				e.setRequestHeader("AJAX",true);
			},
			error:function(e){
				console.log(e.responseText);
			}
		});
	}
</script>



<div id="container">
	<div class="row" style="margin-left: 0; margin-right: 0">
		<div class="leftDayBar" class="col12 col-lg-1" style="background: teal; padding: 0;height: 750px; width: 158px; z-index: 0;">
				  <ul style="width: 100%;" class="dayBox">
				  	<li style="width: 100%;" class="dayBar dayBar-first">
				    	<div style="padding-left: 10px; min-height: 30px; color: white; height: 70px; width: 100%; font-size: 16px; padding-top:25px;">전체 일정 보기</div>
				    </li>
				  	<c:forEach var="i" begin="1" end="${dayCount}" step="1" >
					    <li class="dayBar" style="width: 100%;" data-day="${i}">
					      <div style="padding-left: 10px;min-height: 30px; color: white; height: 60px; width: 100%; font-size: 16px; padding-top:20px;">${i}일차</div>
					    </li>
				    </c:forEach>
				    <li style="width: 100%;" class="dayBar dayBar-last">
				    	<div id="totalComplete" style="padding-left: 10px; min-height: 30px; color: white; height: 70px; width: 100%; font-size: 16px; padding-top:25px;">전체 일정 작성완료</div>
				    </li>
				  </ul>
		</div>
		<div class="col12 col-lg-2" id="navBar">
			<div class="workspace-title" align="center">
				<input type="text" style="height:31px; width: 90%; margin-top: 5px;" id="landSearch">
				<ul class="tags" style="margin-top:10px;">
				  <li><a class="tag" onclick="listByTag(1);">역사/종교</a></li>
				  <li><a class="tag" onclick="listByTag(2);">숙박</a></li>
				  <li><a onclick="listByTag(3);" class="tag">쇼핑</a></li>
				  <li><a onclick="listByTag(4);" class="tag">음식점</a></li>
				</ul>
			</div>
			<div id="locScrollBox" class="scrollbox"></div>
			</div>

		<div class="col12 col-lg-2 routeBar" style="">
			<div class="landmark-title" align="center">
				<h5 style="color: white; padding-top: 20px;">경로 일정</h5>
			</div>
			<div id="landInfo" style="height: 635px;" align="center">
				<img src="<%=cp%>/resource/user/images/travel/tip_ko.png" alt="이미지 없음" style="width: 90%; margin-top: 20px;" id="tip">
			</div>
			<div>
				<button id="btn_addRouteByDay" class="button" style="background: gray; width: 100%; color: white; font-size: 16px; height: 50px;" disabled="disabled"></button>
			</div>
		</div>
		<div class="col12 col-lg-7" style="height: 750px; overflow: hidden;"id="map"></div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("#landInfo").droppable({
	    drop: function(event, ui) {
	    	var clone = dragObject.clone();
	    	clone.css("left","0px").css("top","0px");
	    	clone.find("div[class=next3 ]").text("X");
	    	clone.find("div[class=next3 ]").addClass("removeLocation");
	    	$("#tip").hide();
	        $("#landInfo").append(clone);
	        $("map").empty();
	        drawRouteToMap($(this).children("div"));
	        $("#btn_addRouteByDay").css("background","#1cc3b2");
			$("#btn_addRouteByDay").prop("disabled",false);
	    }
	});
});
</script>
