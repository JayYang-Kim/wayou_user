<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

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

<!-- Blog Area Start -->
<div class="roberto-news-area section-padding-100-0">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">

                <!-- Single Blog Post Area -->
                <c:forEach var="listLocation" items="${listLocation}">
	                <div class="tr_locationList single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
	                    <!-- Post Thumbnail -->
	                    <div class="post-thumbnail">
	                    	<c:if test="${not empty listLocation.saveFilename}">
	                    		<a href="<%=cp%>/travel/location/view"><img src="/wadmin/uploads/location/${listLocation.saveFilename}" alt="${listLocation.locName}"></a>
	                    	</c:if>
	                    	<c:if test="${empty listLocation.saveFilename}">
	                    		<a href="<%=cp%>/travel/location/view"><img src="<%=cp%>/resources/images/travel/main/basic_location.jpg" alt=""></a>
	                    	</c:if>
	                    </div>
	                    <!-- Post Content -->
	                    <div class="post-content">
	                        <!-- Post Title -->
	                        <a href="<%=cp%>/travel/location/view" class="post-title">${listLocation.locName}(${listLocation.loceName})</a>
	                        <p>${listLocation.memo}</p>
	                    </div>
	                </div>
                </c:forEach>
            </div>

            <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                <div class="roberto-sidebar-area pl-md-4">
                    <!-- Recent Post -->
                    <div class="single-widget-area mb-100">
                        <h4 class="widget-title mb-30">추천 지역</h4>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Thumb -->
                            <div class="post-thumb">
                                <a href="single-blog.html"><img src="<%=cp%>/resources/images/bg-img/29.jpg" alt=""></a>
                            </div>
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Proven Techniques Help You Herbal Breast</a>
                            </div>
                        </div>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Thumb -->
                            <div class="post-thumb">
                                <a href="single-blog.html"><img src="<%=cp%>/resources/images/bg-img/30.jpg" alt=""></a>
                            </div>
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Cooking On A George Foreman Grill</a>
                            </div>
                        </div>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Thumb -->
                            <div class="post-thumb">
                                <a href="single-blog.html"><img src="<%=cp%>/resources/images/bg-img/31.jpg" alt=""></a>
                            </div>
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Selecting The Right Hotel</a>
                            </div>
                        </div>

                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Thumb -->
                            <div class="post-thumb">
                                <a href="single-blog.html"><img src="<%=cp%>/resources/images/bg-img/32.jpg" alt=""></a>
                            </div>
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Comment Importance Of Human Life</a>
                            </div>
                        </div>
                        
                        <!-- Single Recent Post -->
                        <div class="single-recent-post d-flex">
                            <!-- Thumb -->
                            <div class="post-thumb">
                                <a href="single-blog.html"><img src="<%=cp%>/resources/images/bg-img/32.jpg" alt=""></a>
                            </div>
                            <!-- Content -->
                            <div class="post-content">
                                <!-- Post Meta -->
                                <div class="post-meta">
                                    <a href="#" class="post-author">Jan 29, 2019</a>
                                    <a href="#" class="post-tutorial">Event</a>
                                </div>
                                <a href="single-blog.html" class="post-title">Comment Importance Of Human Life</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Blog Area End -->