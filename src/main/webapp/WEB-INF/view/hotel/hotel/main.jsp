<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<section class="welcome-area">
	<div class="welcome-slides owl-carousel noImg">
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/16.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/16.jpg">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInLeft" data-delay="200ms">호텔</h6>
	                            <h2 data-animation="fadeInLeft" data-delay="500ms">Hotel</h2>
	                          
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	  </div>
	</section>
<section class="roberto-about-area section-padding-100-0">
	<div class="hotel-search-form-area">
            <div class="container-fluid">
                <div class="hotel-search-form">
                    <form action="#" method="post">
                        <div class="row justify-content-between align-items-end">
                            <div class="col-6 col-md-2 col-lg-3">
                                <label for="checkIn">Check In</label>
                                <input type="date" class="form-control" id="checkIn" name="checkin-date">
                            </div>
                            <div class="col-6 col-md-2 col-lg-3">
                                <label for="checkOut">Check Out</label>
                                <input type="date" class="form-control" id="checkOut" name="checkout-date">
                            </div>
                            <div class="col-6 col-md-2 col-lg-3">
	                        <label for="children">여행 지역 및 랜드마크 검색</label>
	                        <input type="text" class="form-control" id="input_search" name="input_search"/>
	                    </div>
                            <div class="col-12 col-md-3">
                                <button type="submit" class="form-control btn roberto-btn w-100">Check Availability</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>    
	<!-- Welcome Area End -->
	
<section class="roberto-blog-area section-padding-100-0">
	    <div class="container">
	        <div class="row">
	            <!-- Section Heading -->
	        <div class="col-12">
	            <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms" style="visibility: visible; animation-delay: 100ms; animation-name: fadeInUp; font-size: 50px; color:#1cc3b2; ">
	                <h2>나만의 호텔 예약</h2>
	            </div>
	        </div>
	    </div>
	
	    <div class="row">
	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="300ms" style="visibility: visible; animation-delay: 300ms; animation-name: fadeInUp;">
	                <a href="#" class="post-thumbnail"><img src="/wayou/resources/images/bg-img/2.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">Jan 02, 2019</a>
	                    <a href="#" class="post-catagory">Event</a>
	                </div>
	                <!-- Post Title -->
	                <a href="#" class="post-title">Learn How To Motivate Yourself</a>
	                <p>How many free autoresponders have you tried? And how many emails did you get through using them?</p>
	                <a href="index.html" class="btn continue-btn"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	            </div>
	        </div>
	
	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="500ms" style="visibility: visible; animation-delay: 500ms; animation-name: fadeInUp;">
	                <a href="#" class="post-thumbnail"><img src="/wayou/resources/images/bg-img/3.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">Jan 02, 2019</a>
	                    <a href="#" class="post-catagory">Event</a>
	                </div>
	                <!-- Post Title -->
	                <a href="#" class="post-title">What If Let You Run The Hubble</a>
	                <p>My point here is that if you have no clue for the answers above you probably are not operating a followup.</p>
	                <a href="index.html" class="btn continue-btn"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	            </div>
	        </div>
	
	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="700ms" style="visibility: visible; animation-delay: 700ms; animation-name: fadeInUp;">
	                <a href="#" class="post-thumbnail"><img src="/wayou/resources/images/bg-img/4.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">Jan 02, 2019</a>
	                    <a href="#" class="post-catagory">Event</a>
	                </div>
	                <!-- Post Title -->
	                    <a href="#" class="post-title">Six Pack Abs The Big Picture</a>
	                    <p>Some good steps to take to ensure you are getting what you need out of a autoresponder include…</p>
	                    <a href="index.html" class="btn continue-btn"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	                </div>
	            </div>
	
	        </div>
	    </div>
	</section>
	<!-- About Us Area End -->
	
	<!-- Testimonials Area Start -->
	<div></div>
	<section class="roberto-testimonials-area section-padding-100-0">
	    <div class="container">
			<div style="font-size: 50px; color:#1cc3b2; ">인기 호텔 모아보기</div>
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
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	<!-- Testimonials Area End -->
	
	
	<!-- Projects Area End -->
	

	<!-- Blog Area End -->
	
	<!-- Call To Action Area Start -->
	<section class="roberto-cta-area pt40 pb40">
	 <div class="container">
			<div style="font-size: 50px; color:#1cc3b2;">공지사항</div>
	 </div>
	    <div class="container">
	        <div class="cta-content bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/1.jpg);">
	            <div class="row align-items-center">
	                <div class="col-12 col-md-7">
	                    <div class="cta-text mb-50" style="width:900px">
	                       <div style="text-decoration: underline; font-size: 20px; color: white;">제목 뿌리기~!!!!!!!!!!!!!</div>
	                       <div style="text-decoration: underline; font-size: 20px; color: white;">제목 뿌리기~!!!!!!!!!!!!!</div>
	                       <div style="text-decoration: underline; font-size: 20px; color: white;">제목 뿌리기~!!!!!!!!!!!!!</div>	                        
	                    </div>
	                </div>
	                <div class="col-12 col-md-5 text-right">
	                    <a href="#" class="btn roberto-btn mb-50">보러가기</a>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	