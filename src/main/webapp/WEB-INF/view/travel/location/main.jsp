<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<%-- <link rel="stylesheet" href="<%=cp%>/resources/css/travel.css"> --%>

<section class="welcome-area">
	<div class="welcome-slides owl-carousel">
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/16.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/16.jpg">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInLeft" data-delay="200ms">Hotel &amp; Resort</h6>
	                            <h2 data-animation="fadeInLeft" data-delay="500ms">Welcome To Roberto</h2>
	                            <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInLeft" data-delay="800ms">Discover Now</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/17.jpg">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInUp" data-delay="200ms">Hotel &amp; Resort</h6>
	                            <h2 data-animation="fadeInUp" data-delay="500ms">Welcome To Roberto</h2>
	                            <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInUp" data-delay="800ms">Discover Now</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/18.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/18.jpg">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
                    <!-- Welcome Text -->
                        <div class="col-12">
                            <div class="welcome-text text-center">
                                <h6 data-animation="fadeInDown" data-delay="200ms">Hotel &amp; Resort</h6>
                                <h2 data-animation="fadeInDown" data-delay="500ms">Welcome To Roberto</h2>
                                <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInDown" data-delay="800ms">Discover Now</a>
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
                <div class="single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
                    <!-- Post Thumbnail -->
                    <div class="post-thumbnail">
                        <a href="<%=cp%>/travel/location/view"><img src="<%=cp%>/resources/images/bg-img/24.jpg" alt=""></a>
                    </div>
                    <!-- Post Content -->
                    <div class="post-content">
                        <!-- Post Title -->
                        <a href="<%=cp%>/travel/location/view" class="post-title">Cdc Issues Health Alert Notice For Travelers To Usa From Hon</a>
                        <p>A round-the-world trip remains the world’s greatest journey. For two out of every three people, this is the ultimate travel experience, according to recent research...</p>
                    </div>
                </div>
				
				<!-- Single Blog Post Area -->
                <div class="single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
                    <!-- Post Thumbnail -->
                    <div class="post-thumbnail">
                        <a href="<%=cp%>/travel/location/view"><img src="<%=cp%>/resources/images/bg-img/24.jpg" alt=""></a>
                    </div>
                    <!-- Post Content -->
                    <div class="post-content">
                        <!-- Post Title -->
                        <a href="<%=cp%>/travel/location/view" class="post-title">Cdc Issues Health Alert Notice For Travelers To Usa From Hon</a>
                        <p>A round-the-world trip remains the world’s greatest journey. For two out of every three people, this is the ultimate travel experience, according to recent research...</p>
                    </div>
                </div>
                
                <!-- Single Blog Post Area -->
                <div class="single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
                    <!-- Post Thumbnail -->
                    <div class="post-thumbnail">
                        <a href="<%=cp%>/travel/location/view"><img src="<%=cp%>/resources/images/bg-img/24.jpg" alt=""></a>
                    </div>
                    <!-- Post Content -->
                    <div class="post-content">
                        <!-- Post Title -->
                        <a href="<%=cp%>/travel/location/view" class="post-title">Cdc Issues Health Alert Notice For Travelers To Usa From Hon</a>
                        <p>A round-the-world trip remains the world’s greatest journey. For two out of every three people, this is the ultimate travel experience, according to recent research...</p>
                    </div>
                </div>
                
                <!-- Single Blog Post Area -->
                <div class="single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
                    <!-- Post Thumbnail -->
                    <div class="post-thumbnail">
                        <a href="<%=cp%>/travel/location/view"><img src="<%=cp%>/resources/images/bg-img/24.jpg" alt=""></a>
                    </div>
                    <!-- Post Content -->
                    <div class="post-content">
                        <!-- Post Title -->
                        <a href="<%=cp%>/travel/location/view" class="post-title">Cdc Issues Health Alert Notice For Travelers To Usa From Hon</a>
                        <p>A round-the-world trip remains the world’s greatest journey. For two out of every three people, this is the ultimate travel experience, according to recent research...</p>
                    </div>
                </div>
                
                <!-- Single Blog Post Area -->
                <div class="single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
                    <!-- Post Thumbnail -->
                    <div class="post-thumbnail">
                        <a href="<%=cp%>/travel/location/view"><img src="<%=cp%>/resources/images/bg-img/24.jpg" alt=""></a>
                    </div>
                    <!-- Post Content -->
                    <div class="post-content">
                        <!-- Post Title -->
                        <a href="<%=cp%>/travel/location/view" class="post-title">Cdc Issues Health Alert Notice For Travelers To Usa From Hon</a>
                        <p>A round-the-world trip remains the world’s greatest journey. For two out of every three people, this is the ultimate travel experience, according to recent research...</p>
                    </div>
                </div>
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