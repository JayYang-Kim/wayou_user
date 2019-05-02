<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.totMoney p {
	float: left;
	width: 100px;
}

.day_info_box {
	height: 60px;
	width: 100%;
}

.day_txt {
	float: left;
	background: #203341;
	height: 60px;
	line-height: 60px;
	color: white;
	font-weight: bold;
	font-size: 22px;
	min-width: 110px;
	width: 15%;
	text-align: center;
}

.day_info {
	float: left;
	min-width: 609px;
	background: white;
	border-top: 1px solid #e5e5e5;
	border-right: 1px solid #e5e5e5;
	height: 60px;
	width: 85%;
}

.day_info_left {
	float: left;
	width: 430px;
	padding-left: 10px;
}

.day_info_right {
	width: 172px;
	float: left;
	height: 60px;
	line-height: 60px;
	font-size: 16px;
	color: #555555;
	font-weight: bold;
	text-align: right;
	padding-right: 15px;
}

.day_info_box .date {
	font-size: 12px;
	color: #b3b3b3;
	font-weight: bold;
	padding-top: 5px;
}

.day_info_box .day_title {
	color: #363636;
	font-weight: bold;
	font-size: 18px;
	padding-top: 17px;
	padding-bottom: 15px; 
	height:100%;  
}

.day_route {
	min-height: 100px;
	border: 1px solid #e5e5e5;
}

.day_route_box {
	height: 60px;
	width: 100%;
}

.day_sch_box {
	width: 100%;
	border: 1px solid #e5e5e5;
	background: white;
	min-height: 100px;
}

.day_sch_num {
    height: 150px;
    text-align: center;
    float: left;
    width: 110px;
    line-height: 60px;
}

.sch_num {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    color: white;
    background: #223b68;
    margin: 0 auto;
    font-size: 18px;
    font-weight: bold;
    line-height: 32px;
    text-align: center;
    margin-top: 60px;
}
.sch_num2 {
	margin-top:5px;
	float:left;
	width:20px;
	height:20px;
	font-size:14px;
	line-height:23px;
	text-align: center;
	font-weight: bold;
	margin: 0 auto;
	background: #223b68;
	border-radius: 50%;
    color: white;
}


.sch_content {
    width: 300px;
    float: left;
    padding-top: 35px;
    height: 100%;
}

.spot_img {
	float: left;
	width: 70px;
	height: 70px;
}

.spot_content_box {
	width: 150px;
	float: left;
	padding-left: 10px;
}

.spot_name {
	font-size: 17px;
	color: #555555;
	font-weight: bold;
}

.spot_info {
	height: 41px;
	padding-top: 10px;
}

.btn_memo {
	font-weight: bold;
	font-size: 12px;
	color: #49b2e9;
	text-decoration: underline;
	cursor: pointer;
}

.spot_btn_box {
	width: 109px;
	float: left;
	height: 100%;
	padding-right: 15px;
	margin-top: 20px;
}

.spot_btn {
	float: right;
	margin-left: 15px;
	cursor: pointer;
}

.clear {
	clear: both;
}

.sch_add_content {
    width: 300px;
    padding-left: 0;
    padding-right: 15px;
    padding-top: 35px;
    padding-bottom: 20px;
    float: left;
}

.sch_budget {
	color: #555555;
	font-size: 13px;
	font-weight: bold;
	padding-bottom: 20px;
}

.sch_memo {
	font-size: 13px;
	color: #808080;
	line-height: 18px;
}

.sch_memo_box {
	display: none;
}

.plan_info_box.nleft {
	padding-left: 0;
}

.memo_input {
	width: 350px;
	outline: none;
	resize: none;
	line-height: 18px;
	font-size: 13px;
	color: #808080;
	border: 1px solid #e5e5e5;
	float: left;
	height: 61px;
	padding: 10px;
}

.memo_save_btn {
	width: 65px;
	height: 31px;
	float: left;
	text-align: center;
	background: #ff9320;
	border: 1px solid #f7870f;
	color: white;
	font-size: 13px;
	line-height: 31px;
	cursor: pointer;
	margin-left: 5px;
}
.landTag {
    background: #eee;
    border-radius: 3px 0 0 3px;
    color: #999;
    display: inline-block;
    height: 26px;
    line-height: 26px;
    padding: 0 20px 0 23px;
    position: relative;
    margin: 0 10px 10px 0;
    text-decoration: none;
    -webkit-transition: color 0.2s;
}
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 9999; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
}

.modal-content {
    position: relative;
    top: 45%;
    background-color: #2a303b;
    color:white;
    margin: auto;
    padding: 20px;
    border: 1px solid #2a303b;
    width: 500px;
    height: 150px;
}
.modalBtn{
	border: 1px solid white; 
	width: 100px;
	padding-left:10px;
}
.modalBtn:hover{
	border: 1px solid white; 
	width: 120px;
	font-weight: bold;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax"
	style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcrumb-content text-left"
					style="color: white; padding-top: 90px;">
					<h5 style="padding-bottom: 20px;">${workspace.userName}의일정</h5>
					<h2 style="padding-bottom: 5px;">${workspace.subject}</h2>
					<h6 style="padding-bottom: 15px;">${workspace.startDay}~${workspace.endDay}(${workspace.dayCount}일)</h6>
					<div                   
						style="border: 1px solid white; padding: 10px 5px; width: 300px; height: 40px; float: left;"
						class="totMoney">
						<p style="width: 100px; text-align: center;">필요 경비 :</p>
						<p class="totBudget" style="text-align: right; width: 130px;"></p>
						<p style="width: 50px; text-align: center;">원</p>
					</div>
					<c:if test="${workspace.userIdx==sessionScope.member.userIdx}">
						<button style="float: right" class="btn roberto-btn" 
							onclick="javascript:location.href='<%=cp%>/travel/myplan/workspace?locCode=${workspace.locCode}&workNum=${workspace.workCode}&dayCount=${workspace.dayCount}';">수정하기</button>
					</c:if>
				</div>
				
			</div>
		</div>
	</div>
</div>


<!-- Breadcrumb Area End -->

<!-- Blog Area Start -->
<div class="roberto-news-area section-padding-100-0">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-9" id="dailyRoute">

			<c:if test="${list.size()!=0}">			
				<div class="day_info_box">
					<div class="day_txt">Day ${day}</div>
					<div class="day_info">
						<div class="day_info_left"><div class="day_title">${day}일차 여행 경비 : KRW </div></div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</c:if>
				<c:forEach var="dto" items="${list}" varStatus="status">
					<div class="day_sch_box" data-lat="${dto.lat}" data-lng="${dto.lng}" data-landName="${dto.landName}" data-orderNum="${dto.orderNum}" data-worklandCode="${dto.workLandCode}">
							<div class="day_sch_num">
								<div class="sch_num">${dto.orderNum}</div>
							</div>
							<div class="sch_content" data-landCode="${dto.landCode}">
								<%-- <img src="${dto.saveFileName}" alt="no image" class="spot_img"> --%>
								<img src="<%=cp%>/resources/images/bg-img/46.jpg" alt="no image" class="spot_img">
								<div class="spot_content_box">
									<div class="spot_name" onclick="window.open('http://localhost:9090/wayou/travel');" style="cursor: pointer;">${dto.landName}</div>
									<div class="spot_info">
										<div class="landTag">${dto.tagName}</div>
					 					<div class="clear"></div>
									</div>
									<c:if test="${workspace.userIdx==sessionScope.member.userIdx}">
										<div class="btn_memo">메모&amp;예산수정</div>
									</c:if>
								</div>
							</div>
							<div class="sch_add_content">
								<div class="sch_memo_confirm">
									<div class="sch_budget" data-budget="${dto.budget}">KRW - <fmt:formatNumber>${dto.budget}</fmt:formatNumber> 원</div>
										<div class="sch_memo">${dto.memo}</div>
								</div>
								<div class="sch_memo_box" style="width: 400px; height: 180px;">
									<div class="plan_info_box nleft white" style="width: 100%; height:50px; margin-bottom: 5px; ">
									<p>예산</p>
										<input type="text" name="budget" placeholder="예산을 입력하세요(원)" style="height: 30px;width: 350px;" value="${dto.budget}">
									</div>
									<p>메모</p> 
									<textarea name="" id="" cols="30" rows="10" class="memo_input">${dto.memo}</textarea>
									<div class="memo_save_btn" style="margin-top: 5px;">저장</div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
						<c:if test="${status.count!=list.size()}">
							<div id="distance${status.count}"style="text-align:center; height: 30px; border-left:1px solid #e5e5e5; border-right:1px solid #e5e5e5; padding-top:5px; color: #555555; font-size: 13px; font-weight: bold">↓&nbsp;이동거리 : </div>
						</c:if>
				</c:forEach>

				<c:if test="${list.size()!=0}">
					<!-- Pagination -->
					<nav class="roberto-pagination mb-100" style="text-align: center; margin-top: 20px;">${paging}</nav>
				</c:if>
				<c:if test="${list.size()==0}">
					<div class="t_center mt40 mb40">
                		<span class="f14 exbold">작성자가 경로 일정을 작성 중입니다.</span>
                	</div>
				</c:if>

				
			</div>
			<div class="col-12 col-lg-3">
				<div id="map" style="width: 300px; height:400px;"></div>
				<c:if test="${list.size()!=0}">
					<div id="explain" style="width: 300px; min-height: 150px;padding:15px 10px; border: 1px solid #e5e5e5"></div>
				</c:if>
			</div>
		</div>
	</div>
</div>
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content" style="text-align: center;">
    <p style="font-size: 16px;">결제하지 않은 경로  입니다.<br> 지금 결제하시면 더 편리한 여행이 가능합니다.</p>
    <p style="margin-top:30px; color:white;">
	    <button class="btn btn-white modalBtn paymentBtn" type="button">결제하기</button>&nbsp;
	    <button class="btn btn-white modalBtn" type="button" onclick="javascript:location.href='<%=cp%>/travel/plan/list';">돌아가기</button>
    </p>
  </div>

</div>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=591cb76973b1a523d68f564d17c08ff0"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	
	$(function(){
		$(".paymentBtn").click(function(){
			var url = "<%=cp%>/member/info";
			$.ajax({
				type:"get",
				url:url,
				dataType:"json",
				success:function(data){
					var IMP = window.IMP; // 생략가능
					var sum = 1000;
					IMP.init(data.storeCode);
					IMP.request_pay({
					    pg : 'inicis', // version 1.1.0부터 지원.
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '주문명:결제테스트',
					    amount : sum,
					    buyer_email : data.user.email,
					    buyer_name : data.user.name,
					    buyer_tel : data.user.tel,
					    buyer_addr : data.user.addr,
					    buyer_postcode : data.user.postCode,
					    m_redirect_url : '<%=cp%>/travel/plan/view?${workspace.locCode}=2&workNum=${workspace.locCode}&dayCount=3&userIdx=${workspace.userIdx}'
					}, function(rsp) {
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.';
					        //msg += '고유ID : ' + rsp.imp_uid;
					        //msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        //msg += '카드 승인번호 : ' + rsp.apply_num;
					        url = "<%=cp%>/travel/plan/confirm?workCode=${workspace.workCode}";
					        $.ajax({
					        	type:"get",
								url:url,
								dataType:"json",
								success:function(){
									alert("구매해주셔서 감사합니다.");
								},
								beforesend:function(e){
									e.setRequestHeader("AJAX",true);
								},
								error:function(e){
							    	if(e.status==403) {
							    		location.href="<%=cp%>/member/login";
							    		return;
							    	}
								}
					        });
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					    }
					    alert(msg);
					});		
				},
				beforesend:function(e){
					e.setRequestHeader("AJAX",true);
				},
				error:function(e){
			    	if(e.status==403) {
			    		location.href="<%=cp%>/member/login";
			    		return;
			    	}
				}
			});
	
		});
	});
	
	
	$(function(){
		
 		if(!${isPaid}){ 
			var modal = document.getElementById('myModal');
			modal.style.display = "block";
			window.onclick = function(event) {
			  if (event.target == modal) {
			    modal.style.display = "block";
			  }
			}
		}
		
		$(".nice-select").hide();
		$("select[name='currency']").css("display","");
		calDayTotBudget();
		drawRouteToMap($("#dailyRoute").find(".day_sch_box"));	
		loadExplain();
	});
	
	$(function(){
		$("body").on("click",".btn_memo",function(){
			$(this).closest(".day_sch_box").find(".sch_memo_box").toggle();
			$(this).closest(".day_sch_box").find(".sch_memo_confirm").toggle();
		});
		$("body").on("click",".memo_save_btn",function(){
			var budget = $(this).parent().find("input[type=text]").val();
			var memo = $(this).parent().find("textarea").val();
			var worklandCode= $(this).closest(".day_sch_box").attr("data-worklandCode");
			
			var query = "budget="+budget+"&memo="+encodeURIComponent(memo)+"&workLandCode="+worklandCode;
			
			var $daySchBox = $(this).closest(".day_sch_box");
			
			$.ajax({
				type:"post",
				url:"<%=cp%>/travel/plan/updateWorkLandDetail",
				data:query,
				dataType:"json",
				success:function(data){
					$($daySchBox).find(".sch_budget").attr("data-budget",data.budget);
					$($daySchBox).find(".sch_budget").html("KRW - "+data.budget);
					$($daySchBox).find(".sch_memo").html(data.memo);
					$($daySchBox).find(".sch_memo_box").toggle();
					$($daySchBox).find(".sch_memo_confirm").toggle();
					calDayTotBudget();
				},
				error:function(e){
					if(e.status==403) {
			    		location.href="<%=cp%>/member/login";
			    		return;
			    	}
				}
			});
		});
	});
	
	
	
	function calDayTotBudget(){
		var sum = 0;
		var budgets = $("div[class^=sch_budget]");
		for(var i=0; i<budgets.length; i++){
			sum += parseInt($(budgets[i]).attr("data-budget"));
		}
		$(".day_title").html("KRW "+((""+sum).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'))+" 원");
		
			var query ="day=${day}&workCode=${workspace.workCode}&budget="+sum;
			
			$.ajax({
				type:"post",
				url:"<%=cp%>/travel/plan/updateBudgetByDay",
				data:query,
				dataType:"json",
				success:function(data){
					$(".totBudget").html((""+data.sum).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));	
				},
				error:function(e){
					if(e.status==403) {
			    		location.href="<%=cp%>/member/login";
			    		return;
			    	}
				}
			});	
	}
	
	function loadExplain(){
		var objs = $("#dailyRoute").find(".day_sch_box");
		for(var i=0; i<objs.length; i++){
			var landName = $(objs[i]).attr("data-landName");
			var orderNum = $(objs[i]).attr("data-orderNum");
			var $newDiv = '<div style="height:45px;width:130px;float:left;"><div class="sch_num2">'+orderNum+'</div><p style="width:100px;float:left;padding-top:3px;padding-left:5px;">'+landName+'</p></div>';
			$("#explain").append($newDiv);
		}
	}
	
	function drawRouteToMap(objs){
		
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    mapOption = {
	    	center: new daum.maps.LatLng(37.56682, 126.97865),
	        level : 7
	    // 지도의 확대 레벨
	    };
	 
	    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	    var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
	    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
	 
	    // 마커를 표시할 위치와 title 객체 배열입니다
	    var positions= [];
	   	for(var i=0; i<objs.length; i++){
	   		var position = {
	   			title : $(objs[i]).attr("data-landName"),
	   			latlng : new daum.maps.LatLng($(objs[i]).attr("data-lat"), $(objs[i]).attr("data-lng")),
	   			order : $(objs[i]).attr("data-orderNum")
	   		};
	   		positions[i] = position;
	   	}
	    // 마커 이미지의 이미지 주소입니다
	    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	
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
	        displayCircleDot(positions[i].latlng, distance,positions[i].order);
	        
	        if(i!=0 && i!=positions.length){
	        	$("#distance"+(i)).append((""+distance).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"m");
	        }
	         
	    }
	 
	    function displayCircleDot(position, distance,order) {
	        if (distance > 0) {
	            // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
	            var distanceOverlay = new daum.maps.CustomOverlay(
	                    {
	                        content : '<div><b>'+distance+'m</b><div class="sch_num" style="margin-top:3px;">'+order+'</div></div>',
	                        position : position,
	                        yAnchor : 1,
	                        zIndex : 2
	                    });
	 
	            // 지도에 표시합니다
	            distanceOverlay.setMap(map);
	        }else{
	        	var distanceOverlay = new daum.maps.CustomOverlay(
	                    {
	                        content : '<div class="sch_num">'+order+'</div>',
	                        position : position,
	                        yAnchor : 1,
	                        zIndex : 2
	                    });
	 
	            // 지도에 표시합니다
	            distanceOverlay.setMap(map);
	        }
	    }
	}
</script>
<!-- Blog Area End -->