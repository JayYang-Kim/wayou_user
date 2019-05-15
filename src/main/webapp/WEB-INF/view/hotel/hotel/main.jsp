<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
div {
   border: none;
}
.star {
   font-size: 0;
   letter-spacing: -4px;
}
.star a {
   font-size: 20px;
   text-align: center;
   letter-spacing: 0;
   display: inline-block;

   color: #cccccc;
   text-decoration: none;
}
.star a:first-child {
   margin-left: 0;
}
.star a.on {
   color: #F2CB61;
}
</style>
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
	                <h2>지역별 호텔 모아보기</h2>
	            </div>
	        </div>
	    </div>
	
	    <div class="row">
	        <!-- Single Post Area -->
	     <c:forEach var="mainRanking" items="${mainRanking }">
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="300ms" style="visibility: visible; animation-delay: 300ms; animation-name: fadeInUp;">
	                <a href="#" class="post-thumbnail"><img src="/wayou/resources/images/bg-img/2.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="">
	                    <a href="<%=cp%>/hotel/hotel/article?hotelCode=${mainRanking.hotelCode}&page=1" class="post-date" style="font-size: 20px; color: #1cc3b2;">${mainRanking.hName }</a>
	              <div>
	                    <span class="star" style="margin-right: 0px; width: 100%;">
                           <c:forEach begin="1" end="${mainRanking.star}">
                              <a class="on">★</a> 
                           </c:forEach>
                        </span>
                        <span  style="color: gray; font-size: 18px;">(${mainRanking.REVIEW })</span>
                  </div> 
	                </div>
	                <!-- Post Title -->
	                <a href="<%=cp%>/hotel/hotel/article?hotelCode=${mainRanking.hotelCode}&page=1" class="post-title" style="white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;">${mainRanking.information }</a>
	                <p></p>
	                <a href="<%=cp%>/hotel/hotel/article?hotelCode=${mainRanking.hotelCode}&page=1" class="btn continue-btn">더보기&nbsp;<i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	            </div>
	        </div>
	      </c:forEach>
	    </div>
	    </div>
	</section>
	<!-- About Us Area End -->

	
	    <!-- Projects Area Start -->
   <section class="roberto-project-area">
   <div class="container">
    <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms" style="visibility: visible; animation-delay: 100ms; animation-name: fadeInUp; font-size: 50px; color:#1cc3b2;" >
                    
                        <h2>인기 호텔 모아보기</h2>
                    </div>
                    </div>
                </div>
            </div>
   
    
   <div class="projects-slides owl-carousel">
     	     <c:forEach var="mainRanking" items="${mainRanking }">
       <div class="single-project-slide bg-img" style="background-image: url(<%=cp%>/resources/images/bg-img/5.jpg);height:500px;">
           <!-- Project Text -->
           <div class="project-content">
               <div class="text">
                   <h6>${mainRanking.hName }</h6>
                   <h5>	                    <span class="star" style="margin-right: 0px; width: 100%;">
                           <c:forEach begin="1" end="${mainRanking.star}">
                              <a class="on">★</a> 
                           </c:forEach>
                        </span>
                        <span  style="color: white; font-size: 18px;">(${mainRanking.REVIEW })</span></h5>
                   <h5>${mainRanking.price}원</h5>
               </div>
           </div>
           <!-- Hover Effects -->
           <div class="hover-effects">
               <div class="text">
                   <h5>${mainRanking.hName }</h5>
                 <h6>	                    <span class="star" style="margin-right: 0px; width: 100%;">
                           <c:forEach begin="1" end="${mainRanking.star}">
                              <a class="on">★</a> 
                           </c:forEach>
                        </span>
                        <span  style="color: white; font-size: 18px;">(${mainRanking.REVIEW })</span></h6>
                   <h5>${mainRanking.price}원</h5>
               </div>
               <a href="<%=cp%>/hotel/hotel/article?hotelCode=${mainRanking.hotelCode}&page=1"  class="btn project-btn">더보기 <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
           </div>
       </div>
      </c:forEach>
     </div>
   </section>
   <!-- Projects Area End -->

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
	                <c:forEach var="mainHevent" items="${mainHevent}">
	                <a href="<%=cp%>/hotel/hevent/list" class="post-thumbnail"><img src="<%=cp%>/resources/images/bg-img/4.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">${mainHevent.created}</a>
	                    <a href="#" class="post-catagory">이벤트</a>
	                </div>
	                <!-- Post Title -->
	                    <a href="<%=cp%>/hotel/hevent/article?eventNum=${mainHevent.eventNum}" class="post-title">${mainHevent.subject}</a>
	                    <p>${mainHevent.content}</p>
	                    <a href="<%=cp%>/hotel/hevent/list" class="btn continue-btn">더보기 &nbsp;<i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	                </c:forEach>
	                </div>
	            </div>
	
	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="500ms">
                	<c:forEach var="mainHnotice" items="${mainHnotice}">
	                <a href="<%=cp%>/hotel/hnotice/list" class="post-thumbnail"><img src="<%=cp%>/resources/images/bg-img/2.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">${mainHnotice.created}</a>
	                    <a href="<%=cp%>/hotel/hnotice/list"  class="post-catagory">공지사항</a>
	                </div>
	                <!-- Post Title -->
	                <a href="<%=cp%>/hotel/hnotice/article?noticeNum=${mainHnotice.noticeNum}" class="post-title">${mainHnotice.subject}</a>
	                <p>${mainHnotice.content}</p>
	                <a href="<%=cp%>/hotel/hnotice/list" class="btn continue-btn">더보기 &nbsp;<i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	            </c:forEach>
	            </div>
	        </div>
	
	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="300ms">
	                <c:forEach var="mainHqna" items="${mainHqna}">
	                <a href="<%=cp%>/hotel/hqna/main" class="post-thumbnail"><img src="<%=cp%>/resources/images/bg-img/3.jpg" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">${mainHqna.created}</a>
	                    <a href="#" class="post-catagory">문의사항</a>
	                </div>
	                <!-- Post Title -->
	                <a href="<%=cp%>/hotel/hqna/main" class="post-title">${mainHqna.subject}</a>
	                <p>${mainHqna.content}</p>
	                <a href="<%=cp%>/hotel/hqna/main" class="btn continue-btn">더보기 &nbsp;<i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	            </c:forEach>
	            </div>
	        </div>
	
	       
	        </div>
	    </div>
	</section>
	
	<!-- Call To Action Area Start -->
	 <section class="roberto-cta-area" style="padding-bottom: 80px;">
        <div class="container">
            <div class="cta-content bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/1.jpg);">
                <div class="row align-items-center">
                    <div class="col-12 col-md-7">
                        <div class="cta-text mb-50">
                            <h2>Contact us now!</h2>
                            <h6>Contact (+12) 345-678-9999 to book directly or for advice</h6>
                        </div>
                    </div>
                    <div class="col-12 col-md-5 text-right">
                        <a href="#" class="btn roberto-btn mb-50">Contact Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	