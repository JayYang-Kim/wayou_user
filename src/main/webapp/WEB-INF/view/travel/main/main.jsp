<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resources/css/travel.css">

<script type="text/javascript">
	$(function(){
		
	});
</script>

<section class="welcome-area">
	<div class="welcome-slides owl-carousel">
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/travel/main/bg01.png);" data-img-url="<%=cp%>/resources/images/travel/main/bg01.png">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInLeft" data-delay="200ms">WAYOU &amp; 여행정보</h6>
	                            <h2 data-animation="fadeInLeft" data-delay="500ms">국내 여행정보 확인</h2>
	                            <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInLeft" data-delay="800ms">바로가기</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/travel/main/bg02.png);" data-img-url="<%=cp%>/resources/images/travel/main/bg02.png">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInUp" data-delay="200ms">WAYOU &amp; 여행일정</h6>
	                            <h2 data-animation="fadeInUp" data-delay="500ms">나만의 여행 일정 계획</h2>
	                            <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInUp" data-delay="800ms">바로가기</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/travel/main/bg03.png);" data-img-url="<%=cp%>/resources/images/travel/main/bg03.png">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
                    <!-- Welcome Text -->
                        <div class="col-12">
                            <div class="welcome-text text-center">
                                <h6 data-animation="fadeInDown" data-delay="200ms">WAYOU &amp; 여행동료 모으기</h6>
                                <h2 data-animation="fadeInDown" data-delay="500ms">여행동료 모으기</h2>
                                <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInDown" data-delay="800ms">바로가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //welcome-slides  -->
</section>
<!-- //welcome-area  -->
	
<!-- roberto-about-area -->
<section class="roberto-about-area section-padding-100-0">
    <!-- Hotel Search Form Area -->
	<div class="hotel-search-form-area">
	    <div class="container-fluid">
	        <div class="hotel-search-form">
	            <form action="#" method="post">
	                <div class="row justify-content-between align-items-end">
	                    <div class="col-12 col-md-9">
	                        <label for="children">여행 지역 및 랜드마크 검색</label>
	                        <input type="text" class="form-control" id="input_search" name="input_search"/>
	                    </div>
	                    <div class="col-12 col-md-3">
	                        <button type="submit" class="form-control btn roberto-btn w-100">검색(Search)</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
</section>
<!-- //roberto-about-area -->

<div class="colorlib-tour">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
				<h2>추천 여행정보</h2>
				<p>WAYOU에서 추천드리는 여행정보입니다. 여행일정 작성할때 참고하고 나만의 여행을 계획해보세요.</p>
			</div>
		</div>
	</div>
	<div class="tour-wrap">
		<c:forEach var="listLocation" items="${listLocation}">
			<a href="#" class="tour-entry animate-box">
				<%-- <div class="tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/basic_location.jpg);"> --%>
				<c:if test="${not empty listLocation.saveFilename}">
					<div class="tour-img" style="background-image: url(/wadmin/uploads/location/${listLocation.saveFilename});">
				</c:if>
				<c:if test="${empty listLocation.saveFilename}">
					<div class="tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/basic_location.jpg);">
				</c:if>
				</div>
				<span class="desc">
					<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> ${listLocation.locationReplyCount} (댓글수)</p>
					<h2>${listLocation.locName}</h2>
					<span class="city">${listLocation.memo}</span>
					<span class="price">관광명소 : ${listLocation.landCount}(개)</span>
				</span>
			</a>
		</c:forEach>
	</div>
</div>

<div class="colorlib-tour colorlib-light-grey">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
				<h2>추천 관광명소</h2>
				<p>WAYOU에서 추천드리는 관광명소입니다. 여행일정 짜기가 힘들다면 참고하고 나만의 여행을 계획해보세요.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="f-tour">
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<c:forEach var="listLandMark" items="${listLandMark}">
									<div class="col-md-3 animate-box">
										<%-- <a href="tours.html" class="f-tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-1.jpg);"> --%>
										<c:if test="${not empty listLandMark.saveFilename}">
											<a href="tours.html" class="f-tour-img" style="background-image: url(/wadmin/uploads/landmark/${listLandMark.saveFilename});">
										</c:if>
										<c:if test="${empty listLandMark.saveFilename}">
											<a href="tours.html" class="f-tour-img" style="background-image: url(<%=cp%>/resources/images/travel/main/tour-1.jpg);">
										</c:if>
											<div class="desc">
												<h3>${listLandMark.landName}</h3>
												<p class="price"><small>지역 : ${listLandMark.locName}(${listLandMark.loceName})</small></p>
												<p class="price"><small>댓글수 : ${listLandMark.landReplyCount}(개)</small></p>
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
	</div>
</div>

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
								<c:if test="${not empty listWorkspace.saveFilename}">
									<a href="hotels.html" class="hotel-img" style="background-image: url(/wadmin/uploads/location/${listWorkspace.saveFilename});">
								</c:if>
								<c:if test="${empty listWorkspace.saveFilename}">
									<a href="hotels.html" class="hotel-img" style="background-image: url(<%=cp%>/resources/images/travel/main/hotel-1.jpg);">
								</c:if>
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

<!-- roberto-blog-area -->
<section class="roberto-blog-area section-padding-100-0 colorlib-light-grey clear">
    <div class="container">
        <div class="row">
            <!-- Section Heading -->
	        <div class="col-12">
	            <div class="section-heading text-center wow">
	                <h6>WAYOU 퀵 메뉴</h6>
	                <h2>WAYOU를 통해서 여행일정을 쉽게 계획하세요.</h2>
	            </div>
	        </div>
  		</div>

    	<div class="row">
        	<!-- Single Post Area -->
        	<div class="col-12 col-md-6 col-lg-4">
            	<div class="single-post-area mb-100 wow">
                	<a href="<%=cp%>/travel/location" class="post-thumbnail"><img src="<%=cp%>/resources/images/travel/main/quick01.png" alt="여행정보"></a>
                	<!-- Post Title -->
                	<h3 class="post-title bold t_center">여행정보</h3>
                	<p class="f13">국내 도시, 관광명소, 역사/종교, 숙박, 쇼핑, 음식점 정보를 확인하시고 여행정보를 확인해보세요.</p>
            	</div>
        	</div>

	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow">
	                <a href="<%=cp%>/travel/plan/list" class="post-thumbnail"><img src="<%=cp%>/resources/images/travel/main/quick02.png" alt="여행일정"></a>
	                <!-- Post Title -->
	                <h3 class="post-title bold t_center">여행일정</h3>
	                <p class="f13">국내에 등록되어 있는 여행정보를 확인하고 나만의 일정을 계획하고, 유료 일정을 생성하여 나만의 일정을 공유해보세요.</p>
	            </div>
	        </div>

        	<!-- Single Post Area -->
        	<div class="col-12 col-md-6 col-lg-4">
            	<div class="single-post-area mb-100 wow">
                	<a href="<%=cp%>/travel/party" class="post-thumbnail"><img src="<%=cp%>/resources/images/travel/main/quick03.png" alt="여행동료"></a>
                	<!-- Post Title -->
                    <h3 class="post-title bold t_center">여행동료 모으기</h3>
                    <p class="f13">혼자가는 여행은 이제 그만 여행동료 모으기를 이용하여 동료를 모아보세요.</p>
                </div>
            </div>
        </div>
        <!-- //row -->
    </div>
    <!-- //container -->
</section>
<!-- //roberto-blog-area -->