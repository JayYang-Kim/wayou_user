<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resources/css/travel.css">

<!-- 지역상세정보(Top) -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/travel/main/top01.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-end">
            <div class="col-12">
                <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                    <h2 class="room-title">Room View Sea</h2>
                    <h2 class="room-price">$180 <span>/ Per Night</span></h2>
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
									<img src="<%=cp%>/resources/images/bg-img/48.jpg"
										class="d-block w-100" alt="">
								</div>
								<div class="carousel-item">
									<img src="<%=cp%>/resources/images/bg-img/49.jpg"
										class="d-block w-100" alt="">
								</div>
								<div class="carousel-item">
									<img src="<%=cp%>/resources/images/bg-img/50.jpg"
										class="d-block w-100" alt="">
								</div>
								<div class="carousel-item">
									<img src="<%=cp%>/resources/images/bg-img/51.jpg"
										class="d-block w-100" alt="">
								</div>
								<div class="carousel-item">
									<img src="<%=cp%>/resources/images/bg-img/52.jpg"
										class="d-block w-100" alt="">
								</div>
							</div>

							<ol class="carousel-indicators">
								<li data-target="#room-thumbnail--slide" data-slide-to="0"
									class="active"><img
									src="<%=cp%>/resources/images/bg-img/48.jpg"
									class="d-block w-100" alt=""></li>
								<li data-target="#room-thumbnail--slide" data-slide-to="1">
									<img src="<%=cp%>/resources/images/bg-img/49.jpg"
									class="d-block w-100" alt="">
								</li>
								<li data-target="#room-thumbnail--slide" data-slide-to="2">
									<img src="<%=cp%>/resources/images/bg-img/50.jpg"
									class="d-block w-100" alt="">
								</li>
								<li data-target="#room-thumbnail--slide" data-slide-to="3">
									<img src="<%=cp%>/resources/images/bg-img/51.jpg"
									class="d-block w-100" alt="">
								</li>
								<li data-target="#room-thumbnail--slide" data-slide-to="4">
									<img src="<%=cp%>/resources/images/bg-img/52.jpg"
									class="d-block w-100" alt="">
								</li>
							</ol>
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
<div id="colorlib-hotel">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
				<h2>추천 여행일정</h2>
				<p>WAYOU에서 추천드리는 여행일정입니다. 여행일정 짜기가 힘들다면 참고하고 나만의 여행을 계획해보세요.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 animate-box">
				<div>
					<c:forEach var="listWorkspace" items="${listWorkspace}">
						<div class="item">
							<div class="hotel-entry">
								<a href="hotels.html" class="hotel-img" style="background-image: url(/wadmin/uploads/location/${listWorkspace.saveFilename});">
									<p class="price"><span>${listWorkspace.locName}</span><small>(${listWorkspace.loceName})</small></p>
								</a>
								<div class="desc">
									<!-- <p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p> -->
									<h3><a href="#">${listWorkspace.subject}</a></h3>
									<span class="place">${listWorkspace.userId}(${listWorkspace.userName})</span>
									<p>숙박일자 : ${listWorkspace.dayCount}(일) / 출발일 : ${listWorkspace.startDay}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //지역 관광명소 -->