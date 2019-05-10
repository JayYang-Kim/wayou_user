<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resources/css/travel.css">

<script type="text/javascript">
	var starCount = 0;

	$(function(){
		replyList(1);
		
		$(".star a").click(function() {
			var b = $(this).hasClass("on");
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			if(b) {
				$(this).removeClass("on");
			}
				
			starCount = $(".star .on").length;
		});
	});

	function replyList(page){
		var url = "<%=cp%>/travel/location/replyList";
		var query="locCode=${readLocation.locCode}&page=" + page;
		
		$.ajax({
			type:"get",
			url:url,
			data:query,
			success:function(data){
				$("#layoutReply").html(data);
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
	}
	
	$("body").on("click",".btn_addReply",function(){
		alert(starCount);
		var $content = $(this).closest(".roberto-contact-form").find("textarea");
		if(!$content.val()){
			alert("내용을 입력해주세요.");
			$content.focus();
			return false; 
		}
		
		var url = "<%=cp%>/travel/location/reply/insert";
		var query="locCode=${readLocation.locCode}&starNum=" + starCount + "&content=" + $content.val();
		
		alert(query);
		$.ajax({
			type:"post",
			url:url,
			data:query,
			success:function(data){
				if(data.msg == "false") {
					alert("글 등록 실패했습니다.");
					
					return false;
				}
				
				$content.val("");
				$(".star a").removeClass("on");
				
				replyList(1);
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

	$("body").on("click",".btn_deleteReply", function(){
		replyCode = $(this).closest(".reviwer-content").attr("data-replynum");
		userIdx = $(this).closest(".reviwer-content").attr("data-userIdx");
		
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
		
		var url = "<%=cp%>/travel/location/reply/delete";
		var query = "replyCode=" + replyCode + "&userIdx=" + userIdx;
		$.ajax({
			type:"post",
			url:url,
			data:query,
			dataType:"json",
			success:function(data){
				if(data.msg == "true"){
					alert("글 삭제 성공했습니다.");
					replyList(1);
					
					return false;
				}
				
				alert("글 삭제 실패했습니다.");
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
		})
	});
</script>

<!-- 지역상세정보(Top) -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/travel/main/top01.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-end">
            <div class="col-12">
                <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                    <h2 class="room-title">${readLocation.locName}(${readLocation.loceName})</h2>
                    <%-- <h2 class="room-price">$180 <span>/ Per Night</span></h2> --%>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //지역상세정보(Top) -->

<!-- 지역상세정보(Img) -->
<div class="roberto-rooms-area section-padding-100-0">
	<div class="container">
		<div class="row">
			<div class="col-12 col-lg-8">
				<!-- Single Room Details Area -->
				<div class="single-room-details-area mb-50">
					<!-- Room Thumbnail Slides -->
					<div class="room-thumbnail-slides mb-50">
						<div id="room-thumbnail--slide" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<c:if test="${not empty readLocation.saveFilename}">
										<img src="/wadmin/uploads/location/${readLocation.saveFilename}" class="d-block w-100" alt="">
									</c:if>
									<c:if test="${empty readLocation.saveFilename}">
										<img src="<%=cp%>/resources/images/bg-img/48.jpg" class="d-block w-100" alt="">
									</c:if>
								</div>
							</div>

							<%-- <ol class="carousel-indicators">
								<li data-target="#room-thumbnail--slide" data-slide-to="0"
									class="active"><img
									src="<%=cp%>/resources/images/bg-img/48.jpg"
									class="d-block w-100" alt=""></li>
							</ol> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //지역상세정보(Img) -->

<!-- 지역 여행테마 -->
<section class="roberto-blog-area section-padding-100-0 colorlib-light-grey clear">
	<div class="row m0">
		<!-- Section Heading -->
		<div class="col-12">
			<div class="section-heading text-center wow">
				<h6>WAYOU 여행 테마</h6>
				<h4>국내 여행테마를 선택하여 관광명소를 확인하세요.</h4>
			</div>
		</div>
	</div>

	<div class="row m0">
		<div class="col-12 col-md-6 col-lg-3">
			<div class="single-post-area mb-100 wow">
				<a href="<%=cp%>/travel/location" class="post-thumbnail"><img
					src="<%=cp%>/resources/images/travel/main/tag01.jpg" alt="여행테마 - 역사/종교"></a>
				<!-- Post Title -->
				<h3 class="post-title bold t_center">역사 / 종교</h3>
			</div>
		</div>

		<div class="col-12 col-md-6 col-lg-3">
			<div class="single-post-area mb-100 wow">
				<a href="<%=cp%>/travel/plan/list" class="post-thumbnail"><img
					src="<%=cp%>/resources/images/travel/main/tag02.jpg" alt="여행테마 - 숙박"></a>
				<!-- Post Title -->
				<h3 class="post-title bold t_center">숙박</h3>
			</div>
		</div>

		<div class="col-12 col-md-6 col-lg-3">
			<div class="single-post-area mb-100 wow">
				<a href="<%=cp%>/travel/party" class="post-thumbnail"><img
					src="<%=cp%>/resources/images/travel/main/tag03.jpg" alt="여행테마 - 쇼핑"></a>
				<!-- Post Title -->
				<h3 class="post-title bold t_center">쇼핑</h3>
			</div>
		</div>
		
		<div class="col-12 col-md-6 col-lg-3">
			<div class="single-post-area mb-100 wow">
				<a href="<%=cp%>/travel/party" class="post-thumbnail"><img
					src="<%=cp%>/resources/images/travel/main/tag04.jpg" alt="여행테마 - 음식점"></a>
				<!-- Post Title -->
				<h3 class="post-title bold t_center">음식점</h3>
			</div>
		</div>
	</div>
	<!-- //row -->
</section>
<!-- //지역 여행테마 -->

<!-- 지역 관광명소 -->
<div class="colorlib-tour clear">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center colorlib-heading animate-box">
				<h2>${readLocation.locName} 추천 관광명소</h2>
				<p>WAYOU에서 추천드리는 ${readLocation.locName} 관광명소입니다. 여행일정 짜기가 힘들다면 참고하고 나만의 여행을 계획해보세요.</p>
			</div>
		</div>
		<c:if test="${not empty recommendLandmak}">
			<div class="row">
				<div class="col-md-12" style="margin-bottom:40px;">
					<div class="f-tour">
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<c:forEach var="recommendLandmak" items="${recommendLandmak}">
										<div class="col-md-3 animate-box">
											<%-- <a href="tours.html" class="f-tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-1.jpg);"> --%>
											<c:if test="${not empty recommendLandmak.saveFilename}">
												<a href="tours.html" class="f-tour-img" style="background-image: url(/wadmin/uploads/landmark/${recommendLandmak.saveFilename});">
											</c:if>
											<c:if test="${empty recommendLandmak.saveFilename}">
												<a href="tours.html" class="f-tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-1.jpg);">
											</c:if>
												<div class="desc">
													<h3>${recommendLandmak.landName}</h3>
													<p class="price"><small>지역 : ${recommendLandmak.locName}(${recommendLandmak.loceName})</small></p>
													<p class="price"><small>댓글수 : ${recommendLandmak.landReplyCount}(개)</small></p>
												</div>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<div class="t_center">
			<c:if test="${not empty recommendLandmak}">
				<button class="btn_classic btn-white" style="width:300px;height:50px;">${readLocation.locName} 관광명소 모두보기</button>
			</c:if>
			<c:if test="${empty recommendLandmak}">
				<div>등록된 관광명소가 없습니다.</div>
			</c:if>
		</div>
	</div>
</div>
<!-- //지역 관광명소 -->

<!-- 추천 여행일정 -->
<div id="colorlib-hotel" class="colorlib-light-grey clear">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center colorlib-heading animate-box">
				<h2>${readLocation.locName} 추천 여행일정</h2>
				<p>WAYOU에서 추천드리는 ${readLocation.locName} 여행일정입니다. 여행일정 짜기가 힘들다면 참고하고 나만의 여행을 계획해보세요.</p>
			</div>
		</div>
		<c:if test="${not empty recommendWorkspace}">
			<div class="row">
				<div class="col-md-12 animate-box" style="margin-bottom:40px;">
					<div>
						<c:forEach var="recommendWorkspace" items="${recommendWorkspace}">
							<div class="item">
								<div class="hotel-entry">
									<c:if test="${not empty recommendWorkspace.saveFilename}">
										<a href="<%=cp%>/travel/plan/view?locCode=${recommendWorkspace.locCode}&workNum=${recommendWorkspace.workCode}&dayCount=${recommendWorkspace.dayCount}&userIdx=${recommendWorkspace.userIdx}" class="hotel-img" style="background-image: url(/wadmin/uploads/location/${recommendWorkspace.saveFilename});">
									</c:if>
									<c:if test="${empty listWorkspace.saveFilename}">
										<a href="<%=cp%>/travel/plan/view?locCode=${recommendWorkspace.locCode}&workNum=${recommendWorkspace.workCode}&dayCount=${recommendWorkspace.dayCount}&userIdx=${recommendWorkspace.userIdx}" class="hotel-img" style="background-image: url(<%=cp%>/resources/images/travel/main/hotel-1.jpg);">
									</c:if>
										<p class="price"><span>${recommendWorkspace.locName}</span><small>(${recommendWorkspace.loceName})</small></p>
									</a>
									<div class="desc">
										<!-- <p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p> -->
										<h3><a href="#">${recommendWorkspace.subject}</a></h3>
										<span class="place">${recommendWorkspace.userId}(${recommendWorkspace.userName}) / ${recommendWorkspace.pay == 0 ? '무료' : '유료'}</span>
										<p>숙박일자 : ${recommendWorkspace.dayCount}(일) / 출발일 : ${recommendWorkspace.startDay}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</c:if>
		<div class="t_center">
			<c:if test="${not empty recommendWorkspace}">
				<button class="btn_classic btn-white" onclick="location.href='<%=cp%>/travel/plan/list?locCode=${readLocation.locCode}'" style="width:300px;height:50px;">${readLocation.locName} 여행일정 모두보기</button>
			</c:if>
			<c:if test="${empty recommendWorkspace}">
				<div>등록된 여행일정이 없습니다.</div>
			</c:if>
		</div>
	</div>
</div>
<!-- //추천 여행일정 -->

<!-- 커뮤니티 -->
<div class="room-review-area section-padding-100-0 mb-100 clear">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h4>커뮤니티</h4>

			    <div id="layoutReply" style="padding-top:30px;border-top: 1px solid #cccccc;"></div>
			</div>
			<c:if test="${not empty sessionScope.member}">
				<div class="roberto-contact-form col-md-12 mt-20 mb-100" style="border-top: 1px solid #cccccc;padding-top: 20px;">
	                <h2>글 남기기</h2>
	
	                <div class="row">
	                    <div class="col-12">
	                    	<div class="box_star">
	                    		<div class="title">
	                    			<span>평점 : </span>
	                    		</div>
	                    		<div class="star">
	                    			<a href="#">★</a> 
									<a href="#">★</a> 
									<a href="#">★</a> 
									<a href="#">★</a> 
									<a href="#">★</a>
	                    		</div>
	                    	</div>
	                        <textarea name="content" class="form-control mb-30" placeholder="내용을 입력해주세요."></textarea>
						</div>
	                    <div class="col-12 text-right">
							<button type="button" class="btn_addReply btn roberto-btn btn-3 mt-15">등록하기</button>
	                    </div>
					</div>
	            </div>
            </c:if>
		</div>
		<!-- //row -->
	</div>
</div>
<!-- //커뮤니티 -->