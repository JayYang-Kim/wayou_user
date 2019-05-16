<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resources/css/travel.css">

<section class="welcome-area">
	<div class="welcome-slides owl-carousel">
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/ticket/bg01.png);" data-img-url="<%=cp%>/resources/images/ticket/bg01.png">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInLeft" data-delay="200ms">WAYOU & 티켓몰</h6>
	                            <h2 data-animation="fadeInLeft" data-delay="500ms">저렴하게 티켓 구매</h2>
	                            <a href="<%=cp%>/ticket/list" class="btn roberto-btn btn-2" data-animation="fadeInLeft" data-delay="800ms">바로가기</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/ticket/bg02.png);" data-img-url="<%=cp%>/resources/images/ticket/bg02.png">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInUp" data-delay="200ms">WAYOU & 티켓몰</h6>
	                            <h2 data-animation="fadeInUp" data-delay="500ms">다양한 티켓 목록</h2>
	                            <a href="<%=cp%>/ticket/list" class="btn roberto-btn btn-2" data-animation="fadeInUp" data-delay="800ms">바로가기</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/ticket/bg03.png);" data-img-url="<%=cp%>/resources/images/ticket/bg03.png">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                        <div class="col-12">
	                            <div class="welcome-text text-center">
	                                <h6 data-animation="fadeInDown" data-delay="200ms">WAYOU & 티켓몰</h6>
	                                <h2 data-animation="fadeInDown" data-delay="500ms">티켓 구매하고 즐기기</h2>
	                                <a href="<%=cp%>/ticket/list" class="btn roberto-btn btn-2" data-animation="fadeInDown" data-delay="800ms">바로가기</a>
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
	

	<!-- Service Area Start -->
	<div class="roberto-service-area section-padding-100-0">
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
</section>	
	<!-- Service Area End -->
	
	<section class="roberto-service-area section-padding-100-0 colorlib-light-grey">
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
                        <img src="<%=cp%>/uploads/location/2019051609515049291553806152.jpg" alt="">
                        <div class="service-title d-flex align-items-center justify-content-center">
                            <h5>서울</h5>
                        </div>
                    </div>
                </div>
                <!-- Single Service Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-service-area mb-100 wow fadeInUp" data-wow-delay="500ms" style="visibility: visible; animation-delay: 500ms; animation-name: fadeInUp;">
                        <img src="<%=cp%>/uploads/location/2019051609501349194939638584.jpg" alt="">
                        <div class="service-title d-flex align-items-center justify-content-center">
                            <h5>부산</h5>
                        </div>
                    </div>
                </div>
                <!-- Single Service Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-service-area mb-100 wow fadeInUp" data-wow-delay="700ms" style="visibility: visible; animation-delay: 700ms; animation-name: fadeInUp;">
                        <img src="<%=cp%>/uploads/location/2019051609502149202754842341.jpg" alt="">
                        <div class="service-title d-flex align-items-center justify-content-center">
                            <h5>제주도</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	
	<!-- Projects Area Start -->
	<section class="roberto-project-area section-padding-100-0">
	<div class="container">
	 <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms" style="visibility: visible; animation-delay: 100ms; animation-name: fadeInUp;">
                        <h6>지금 가장 인기있는 티켓!</h6>
                        <h2>인기상품</h2>
                    </div>
                    </div>
                </div>
            </div>
	
	 
	<div class="projects-slides owl-carousel">
	    <c:forEach var="listBest" items="${listBest}">
	    <div class="single-project-slide bg-img" style="background-image: url(/wadmin/uploads/store/${listBest.saveFilename});height:400px;">
	        <!-- Project Text -->
	        <div class="project-content" style="height: 150px;">
	            <div class="text" style="height: 100px;">
	                <h6>${listBest.loctitle}</h6>
	                <h5>${listBest.ticketName}</h5>
	                <h6 style="margin-top: 3px;">${listBest.price}원</h6>
	                 <div>
                               	<span class="star"> 
                           			<c:forEach begin="1" end="${listBest.star}">
                              			<a class="on" style="color: #F2CB61; font-size: 20px;">★</a> 
                           			</c:forEach>
                        		</span>
                        		<span style="font-size: 20px; color: white;">(${listBest.reviewCount})</span>
                              </div>
	            </div>
	        </div>
	        <!-- Hover Effects -->
	        <div class="hover-effects">
	            <div class="text">
	                <h6>${listBest.loctitle}</h6>
	                <h5>${listBest.ticketName}</h5>
	                <h5 style="color: black;">${listBest.price}원</h5>
	            </div>
	            <a href="<%=cp%>/ticket/detail?page=1&regionCode=0&cateCode=0&ticketCode=${listBest.ticketCode}&storeCode=${listBest.storeCode}" class="btn project-btn">더보기 <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	        </div>
	    </div>
		</c:forEach>
	  </div>
	</section>
	<!-- Projects Area End -->

	
	<!-- Blog Area Start -->
	<section class="roberto-blog-area section-padding-100-0 colorlib-light-grey">
	    <div class="container">
	        <div class="row">
	            <!-- Section Heading -->
	        <div class="col-12">
	            <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
	                <h6>WAYOU 소식을 전해드립니다</h6>
	                <h2>WAYOU 소식</h2>
	            </div>
	        </div>
	    </div>
	
	    <div class="row">
	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="300ms">
                	<c:forEach var="listNotice" items="${listNotice}">
	                <a href="<%=cp%>/ticket/notice/list" class="post-thumbnail"><img src="<%=cp%>/resources/images/common/notice.png" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">${listNotice.created}</a>
	                    <a href="<%=cp%>/ticket/notice/list" class="post-catagory">공지사항</a>
	                </div>
	                <!-- Post Title -->
	                <a href="<%=cp%>/ticket/notice/article?noticeNum=${listNotice.noticeNum}" class="post-title">${listNotice.subject}</a>
	                <p style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${listNotice.content}</p>
	                <a href="<%=cp%>/ticket/notice/list" class="btn continue-btn">더보기 &nbsp;<i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	            </c:forEach>
	            </div>
	        </div>
	
	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="500ms">
	                <c:forEach var="listQnA" items="${listQnA}">
	                <a href="<%=cp%>/ticket/qna/list" class="post-thumbnail"><img src="<%=cp%>/resources/images/common/question.png" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">${listQnA.created}</a>
	                    <a href="#" class="post-catagory">문의사항</a>
	                </div>
	                <!-- Post Title -->
	                <a href="<%=cp%>/ticket/qna/list" class="post-title">${listQnA.subject}</a>
	                <p style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${listQnA.content}</p>
	                <a href="<%=cp%>/ticket/qna/list" class="btn continue-btn">더보기 &nbsp;<i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	            </c:forEach>
	            </div>
	        </div>
	
	        <!-- Single Post Area -->
	        <div class="col-12 col-md-6 col-lg-4">
	            <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="700ms">
	                <c:forEach var="listEvent" items="${listEvent}">
	                <a href="<%=cp%>/ticket/event/list" class="post-thumbnail"><img src="<%=cp%>/resources/images/common/event.png" alt=""></a>
	                <!-- Post Meta -->
	                <div class="post-meta">
	                    <a href="#" class="post-date">${listEvent.created}</a>
	                    <a href="#" class="post-catagory">이벤트</a>
	                </div>
	                <!-- Post Title -->
	                    <a href="<%=cp%>/ticket/event/article?eventNum=${listEvent.eventNum}" class="post-title">${listEvent.subject}</a>
	                    <p style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${listEvent.content}</p>
	                    <a href="<%=cp%>/ticket/event/list" class="btn continue-btn">더보기 &nbsp;<i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
	                </c:forEach>
	                </div>
	            </div>
	
	        </div>
	    </div>
	</section>
	<!-- Blog Area End -->
	