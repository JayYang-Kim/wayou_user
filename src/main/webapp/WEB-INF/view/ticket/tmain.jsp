<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

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
	                            <h6 data-animation="fadeInLeft" data-delay="200ms">Ticket</h6>
	                            <h2 data-animation="fadeInLeft" data-delay="500ms">티켓티켓티켓티켓</h2>
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
	                            <h6 data-animation="fadeInUp" data-delay="200ms">Event</h6>
	                            <h2 data-animation="fadeInUp" data-delay="500ms">이벤트이벤트</h2>
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
	                                <h6 data-animation="fadeInDown" data-delay="200ms">Event</h6>
	                                <h2 data-animation="fadeInDown" data-delay="500ms">할인할인</h2>
	                                <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInDown" data-delay="800ms">Discover Now</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	<!-- Welcome Area End -->
	
	<!-- About Us Area Start -->
	<section class="roberto-about-area section-padding-100-0">
	    <!-- Hotel Search Form Area -->
	<div class="hotel-search-form-area">
	    <div class="container-fluid">
	        <div class="hotel-search-form">
	            <form action="#" method="post">
	                <div class="row justify-content-between align-items-end">
	                    <div class="col-12 col-md-9">
	                        <label for="children">티켓 검색</label>
	                        <input placeholder="어디로 떠나세요?" type="text" class="form-control" id="input_search" name="input_search"/>
	                    </div>
	                    <div class="col-12 col-md-3">
	                        <button type="submit" class="form-control btn roberto-btn w-100">검색(Search)</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
	
	
	
	<%-- <div class="container mt-100">
	    <div class="row align-items-center">
	        <div class="col-12 col-lg-6">
	            <!-- Section Heading -->
	            <div class="section-heading wow fadeInUp" data-wow-delay="100ms">
	                <h6>About Us</h6>
	                <h2>Welcome to <br>Roberto Hotel Luxury</h2>
	            </div>
	            <div class="about-us-content mb-100">
	                <h5 class="wow fadeInUp" data-wow-delay="300ms">With over 340 hotels worldwide, NH Hotel Group offers a wide variety of hotels catering for a perfect stay no matter where your destination.</h5>
	                <p class="wow fadeInUp" data-wow-delay="400ms">Manager: <span>Michen Taylor</span></p>
	                <img src="./resources/images/core-img/signature.png" alt="" class="wow fadeInUp" data-wow-delay="500ms">
	            </div>
	        </div>
	
	        <div class="col-12 col-lg-6">
	            <div class="about-us-thumbnail mb-100 wow fadeInUp" data-wow-delay="700ms">
	                <div class="row no-gutters">
	                    <div class="col-6">
	                        <div class="single-thumb">
	                            <img src="<%=cp%>/resources/images/bg-img/13.jpg" alt="">
	                        </div>
	                        <div class="single-thumb">
	                            <img src="<%=cp%>/resources/images/bg-img/14.jpg" alt="">
	                        </div>
	                    </div>
	                    <div class="col-6">
	                        <div class="single-thumb">
	                            <img src="<%=cp%>/resources/images/bg-img/15.jpg" alt="">
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	<!-- About Us Area End -->
	 --%>
	<!-- Service Area Start -->
	<div class="roberto-service-area">
	    <div class="container">
	        <div class="row">
	            <div class="col-12">
	                <div class="service-content d-flex align-items-center justify-content-between">
	                    <!-- Single Service Area -->
	                <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="100ms" onclick="location.href='<%=cp%>/ticket/list?regionCode=0&cateCode=1'" style="cursor:pointer;">
	                    <img src="<%=cp%>/resources/images/core-img/icon-1.png" alt="">
	                    <h5>테마파크</h5>
	                </div>
	
	                <!-- Single Service Area -->
	                <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="300ms" onclick="location.href='<%=cp%>/ticket/list?regionCode=0&cateCode=2'" style="cursor:pointer;">
	                    <img src="<%=cp%>/resources/images/core-img/icon-2.png" alt="">
	                    <h5>워터파크</h5>
	                </div>
	
	                <!-- Single Service Area -->
	                <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="500ms" onclick="location.href='<%=cp%>/ticket/list?regionCode=0&cateCode=3'" style="cursor:pointer;">
	                    <img src="<%=cp%>/resources/images/core-img/icon-3.png" alt="">
	                    <h5>익스트림</h5>
	                </div>
	
	                <!-- Single Service Area -->
	                <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="700ms" onclick="location.href='<%=cp%>/ticket/list?regionCode=0&cateCode=4'" style="cursor:pointer;">
	                    <img src="<%=cp%>/resources/images/core-img/icon-4.png" alt="">
	                    <h5>공연/전시</h5>
	                </div>
	
	                <!-- Single Service Area -->
	                <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="900ms" onclick="location.href='<%=cp%>/ticket/list?regionCode=0&cateCode=5'" style="cursor:pointer;">
	                    <img src="<%=cp%>/resources/images/core-img/icon-1.png" alt="">
	                        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;키즈&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
	                </div>
	                
	                <!-- Single Service Area -->
	                <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="1100ms" onclick="location.href='<%=cp%>/ticket/list?regionCode=0&cateCode=6'" style="cursor:pointer;">
	                    <img src="<%=cp%>/resources/images/core-img/icon-1.png" alt="">
	                        <h5>축제/캠핑</h5>
	                </div>
	                
	                <!-- Single Service Area -->
	                <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="1300ms" onclick="location.href='<%=cp%>/ticket/list?regionCode=0&cateCode=7'" style="cursor:pointer;">
	                    <img src="<%=cp%>/resources/images/core-img/icon-1.png" alt="">
	                        <h5>투어/교통</h5>
	                </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- Service Area End -->
	
	<section class="roberto-service-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms" style="visibility: visible; animation-delay: 100ms; animation-name: fadeInUp;">
                        <h6>일정에 맞는 티켓을 추천해드려요</h6>
                        <h2>나만의 티켓 예약</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Single Service Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-service-area mb-100 wow fadeInUp" data-wow-delay="300ms" style="visibility: visible; animation-delay: 300ms; animation-name: fadeInUp;">
                        <img src="<%=cp%>/resources/images/bg-img/2.jpg" alt="">
                        <div class="service-title d-flex align-items-center justify-content-center">
                            <h5>제주도</h5>
                        </div>
                    </div>
                </div>
                <!-- Single Service Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-service-area mb-100 wow fadeInUp" data-wow-delay="500ms" style="visibility: visible; animation-delay: 500ms; animation-name: fadeInUp;">
                        <img src="<%=cp%>/resources/images/bg-img/3.jpg" alt="">
                        <div class="service-title d-flex align-items-center justify-content-center">
                            <h5>부산</h5>
                        </div>
                    </div>
                </div>
                <!-- Single Service Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-service-area mb-100 wow fadeInUp" data-wow-delay="700ms" style="visibility: visible; animation-delay: 700ms; animation-name: fadeInUp;">
                        <img src="<%=cp%>/resources/images/bg-img/4.jpg" alt="">
                        <div class="service-title d-flex align-items-center justify-content-center">
                            <h5>전주</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	
	<!-- Projects Area Start -->
	<section class="roberto-project-area">
	<div class="container">
	 <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms" style="visibility: visible; animation-delay: 100ms; animation-name: fadeInUp;">
                        <h6>Ultimate Solutions</h6>
                        <h2>인기상품</h2>
                    </div>
                    </div>
                </div>
            </div>
	
	    <!-- Projects Slide -->
	<div class="projects-slides owl-carousel">
	    <!-- Single Project Slide -->
	    <div class="single-project-slide active bg-img" style="background-image: url(<%=cp%>/resources/images/bg-img/5.jpg);height:500px;">
	        <!-- Project Text -->
	        <div class="project-content">
	            <div class="text">
	                <h6>경기도 용인</h6>
	                <h5>에버랜드</h5>
	            </div>
	        </div>
	        <!-- Hover Effects -->
	        <div class="hover-effects">
	            <div class="text">
	                <h6>경기도 용인</h6>
	                <h5>에버랜드</h5>
	                <p>I focus a lot on helping the first time or inexperienced traveler head out prepared and confident...</p>
	            </div>
	            <a href="#" class="btn project-btn">Discover Now <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	        </div>
	    </div>
	
	    <!-- Single Project Slide -->
	    <div class="single-project-slide bg-img" style="background-image: url(<%=cp%>/resources/images/bg-img/6.jpg);height:500px;">
	        <!-- Project Text -->
	        <div class="project-content">
	            <div class="text">
	                <h6>경상남도 진해</h6>
	                <h5>벚꽃축제</h5>
	            </div>
	        </div>
	        <!-- Hover Effects -->
	        <div class="hover-effects">
	            <div class="text">
	                <h6>경상남도 진해</h6>
	                <h5>벚꽃축제</h5>
	                <p>I focus a lot on helping the first time or inexperienced traveler head out prepared and confident...</p>
	            </div>
	            <a href="#" class="btn project-btn">Discover Now <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	        </div>
	    </div>
	
	    <!-- Single Project Slide -->
	    <div class="single-project-slide bg-img" style="background-image: url(<%=cp%>/resources/images/bg-img/7.jpg);height:500px;">
	        <!-- Project Text -->
	        <div class="project-content">
	            <div class="text">
	                <h6>Entertaiment</h6>
	                <h5>Racing Bike</h5>
	            </div>
	        </div>
	        <!-- Hover Effects -->
	        <div class="hover-effects">
	            <div class="text">
	                <h6>Entertaiment</h6>
	                <h5>Racing Bike</h5>
	                <p>I focus a lot on helping the first time or inexperienced traveler head out prepared and confident...</p>
	            </div>
	            <a href="#" class="btn project-btn">Discover Now <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	        </div>
	    </div>
	
	    <!-- Single Project Slide -->
	    <div class="single-project-slide bg-img" style="background-image: url(<%=cp%>/resources/images/bg-img/8.jpg);height:500px;">
	        <!-- Project Text -->
	        <div class="project-content">
	            <div class="text">
	                <h6>Entertaiment</h6>
	                <h5>Racing Bike</h5>
	            </div>
	        </div>
	        <!-- Hover Effects -->
	        <div class="hover-effects">
	            <div class="text">
	                <h6>Entertaiment</h6>
	                <h5>Racing Bike</h5>
	                <p>I focus a lot on helping the first time or inexperienced traveler head out prepared and confident...</p>
	            </div>
	            <a href="#" class="btn project-btn">Discover Now <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	        </div>
	    </div>
	
	    <!-- Single Project Slide -->
	    <div class="single-project-slide bg-img" style="background-image: url(<%=cp%>/resources/images/bg-img/9.jpg);height:500px;">
	        <!-- Project Text -->
	        <div class="project-content">
	            <div class="text">
	                <h6>Entertaiment</h6>
	                <h5>Racing Bike</h5>
	            </div>
	        </div>
	        <!-- Hover Effects -->
	            <div class="hover-effects">
	                <div class="text">
	                    <h6>Entertaiment</h6>
	                    <h5>Racing Bike</h5>
	                    <p>I focus a lot on helping the first time or inexperienced traveler head out prepared and confident...</p>
	                </div>
	                <a href="#" class="btn project-btn">Discover Now <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	            </div>
	        </div>
	    </div>
	  </div> 
	</section>
	<!-- Projects Area End -->
	
	
<%-- 	<!-- Our Room Area Start -->
	<section class="roberto-rooms-area">
	    <div class="rooms-slides owl-carousel">
	        <!-- Single Room Slide -->
	    <div class="single-room-slide d-flex align-items-center">
	        <!-- Thumbnail -->
	        <div class="room-thumbnail h-100 bg-img" style="background-image: url(<%=cp%>/resources/images/bg-img/16.jpg);"></div>
	
	        <!-- Content -->
	        <div class="room-content">
	            <h2 data-animation="fadeInUp" data-delay="100ms">Premium King Room</h2>
	            <h3 data-animation="fadeInUp" data-delay="300ms">400$ <span>/ Day</span></h3>
	            <ul class="room-feature" data-animation="fadeInUp" data-delay="500ms">
	                <li><span><i class="fa fa-check"></i> Size</span> <span>: 30 ft</span></li>
	                <li><span><i class="fa fa-check"></i> Capacity</span> <span>: Max persion 5</span></li>
	                <li><span><i class="fa fa-check"></i> Bed</span> <span>: King Beds</span></li>
	                <li><span><i class="fa fa-check"></i> Services</span> <span>: Wifi, Television, Bathroom</span></li>
	            </ul>
	            <a href="#" class="btn roberto-btn mt-30" data-animation="fadeInUp" data-delay="700ms">View Details</a>
	        </div>
	    </div>
	
	    <!-- Single Room Slide -->
	    <div class="single-room-slide d-flex align-items-center">
	        <!-- Thumbnail -->
	        <div class="room-thumbnail h-100 bg-img" style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);"></div>
	
	        <!-- Content -->
	            <div class="room-content">
	                <h2 data-animation="fadeInUp" data-delay="100ms">Best King Room</h2>
	                <h3 data-animation="fadeInUp" data-delay="300ms">125$ <span>/ Day</span></h3>
	                <ul class="room-feature" data-animation="fadeInUp" data-delay="500ms">
	                    <li><span><i class="fa fa-check"></i> Size</span> <span>: 30 ft</span></li>
	                    <li><span><i class="fa fa-check"></i> Capacity</span> <span>: Max persion 5</span></li>
	                    <li><span><i class="fa fa-check"></i> Bed</span> <span>: King Beds</span></li>
	                    <li><span><i class="fa fa-check"></i> Services</span> <span>: Wifi, Television, Bathroom</span></li>
	                </ul>
	                <a href="#" class="btn roberto-btn mt-30" data-animation="fadeInUp" data-delay="700ms">View Details</a>
	            </div>
	        </div>
	    </div>
	</section>
	<!-- Our Room Area End --> --%>
	
	<!-- Testimonials Area Start -->
	<section class="roberto-testimonials-area section-padding-100-0">
	    <div class="container">
	        <div class="row align-items-center">
	            <div class="col-12 col-md-6">
	                <div class="testimonial-thumbnail owl-carousel mb-100">
	                    <img src="<%=cp%>/resources/images/bg-img/10.jpg" alt="">
	                <img src="<%=cp%>/resources/images/bg-img/11.jpg" alt="">
	            </div>
	        </div>
	
	        <div class="col-12 col-md-6">
	            <!-- Section Heading -->
	            <div class="section-heading">
	                <h6>Testimonials</h6>
	                <h2>Our Guests Love Us</h2>
	            </div>
	            <!-- Testimonial Slide -->
	            <div class="testimonial-slides owl-carousel mb-100">
	
	                <!-- Single Testimonial Slide -->
	                <div class="single-testimonial-slide">
	                    <h5>“This can be achieved by applying search engine optimization or popularly known as SEO. This is a marketing strategy which increases the quality and quantity of traffic flow to a particular website via search engines.”</h5>
	                    <div class="rating-title">
	                        <div class="rating">
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                        </div>
	                        <h6>Robert Downey <span>- CEO Deercreative</span></h6>
	                    </div>
	                </div>
	
	                <!-- Single Testimonial Slide -->
	                <div class="single-testimonial-slide">
	                    <h5>“Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus delectus facilis molestias, error vitae praesentium quos eaque qui ea, tempore blanditiis sint reprehenderit, quaerat. Commodi ab architecto sit suscipit exercitationem!”</h5>
	                    <div class="rating-title">
	                        <div class="rating">
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                        </div>
	                        <h6>Akash Downey <span>- CEO Deercreative</span></h6>
	                    </div>
	                </div>
	
	                <!-- Single Testimonial Slide -->
	                <div class="single-testimonial-slide">
	                    <h5>“Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor, ex quos. Alias a rem maiores, possimus dicta sit distinctio quis iusto!”</h5>
	                    <div class="rating-title">
	                        <div class="rating">
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                            <i class="icon_star"></i>
	                        </div>
	                        <h6>Downey Sarah <span>- CEO Deercreative</span></h6>
	                    </div>
	                </div>
	
	                <!-- Single Testimonial Slide -->
	                    <div class="single-testimonial-slide">
	                        <h5>“Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore sequi laboriosam fugit suscipit aspernatur, minima minus voluptatum, id ab atque similique ex earum. Magni.”</h5>
	                        <div class="rating-title">
	                            <div class="rating">
	                                <i class="icon_star"></i>
	                                <i class="icon_star"></i>
	                                <i class="icon_star"></i>
	                                <i class="icon_star"></i>
	                                <i class="icon_star"></i>
	                            </div>
	                            <h6>Robert Brown <span>- CEO Deercreative</span></h6>
	                        </div>
	                    </div>
	
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	<!-- Testimonials Area End -->
	
	
	
	<!-- Blog Area Start -->
	<section class="roberto-blog-area section-padding-100-0">
	    <div class="container">
	        <div class="row">
	            <!-- Section Heading -->
	        <div class="col-12">
	            <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
	                <h6>Our Blog</h6>
	                <h2>와유 소식</h2>
	            </div>
	        </div>
	    </div>
	
	    <div class="row">
	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="300ms">
                	<c:forEach var="listNotice" items="${listNotice}">
	                <a href="<%=cp%>/ticket/notice/list" class="post-thumbnail"><img src="<%=cp%>/resources/images/bg-img/2.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">${listNotice.created}</a>
	                    <a href="<%=cp%>/ticket/notice/list" class="post-catagory">공지사항</a>
	                </div>
	                <!-- Post Title -->
	                <a href="<%=cp%>/ticket/notice/article?noticeNum=${listNotice.noticeNum}" class="post-title">${listNotice.subject}</a>
	                <p>${listNotice.content}</p>
	                <a href="<%=cp%>/ticket/notice/list" class="btn continue-btn">더보기 &nbsp;<i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	            </c:forEach>
	            </div>
	        </div>
	
	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="500ms">
	                <c:forEach var="listQnA" items="${listQnA}">
	                <a href="<%=cp%>/ticket/qna/list" class="post-thumbnail"><img src="<%=cp%>/resources/images/bg-img/3.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">${listQnA.created}</a>
	                    <a href="#" class="post-catagory">문의사항</a>
	                </div>
	                <!-- Post Title -->
	                <a href="<%=cp%>/ticket/qna/list" class="post-title">${listQnA.subject}</a>
	                <p>${listQnA.content}</p>
	                <a href="<%=cp%>/ticket/qna/list" class="btn continue-btn">더보기 &nbsp;<i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	            </c:forEach>
	            </div>
	        </div>
	
	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="700ms">
	                <c:forEach var="listEvent" items="${listEvent}">
	                <a href="<%=cp%>/ticket/event/list" class="post-thumbnail"><img src="<%=cp%>/resources/images/bg-img/4.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">${listEvent.created}</a>
	                    <a href="#" class="post-catagory">이벤트</a>
	                </div>
	                <!-- Post Title -->
	                    <a href="<%=cp%>/ticket/event/article?eventNum=${listEvent.eventNum}" class="post-title">${listEvent.subject}</a>
	                    <p>${listEvent.content}</p>
	                    <a href="<%=cp%>/ticket/event/list" class="btn continue-btn">더보기 &nbsp;<i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	                </c:forEach>
	                </div>
	            </div>
	
	        </div>
	    </div>
	</section>
	<!-- Blog Area End -->
	