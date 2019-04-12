<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: none;" data-jarallax-original-styles="background-image: url(<%=cp%>/resources/images/bg-img/16.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-end">
                <div class="col-12">
                    <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                        <h2 class="room-title">해당호텔 이름</h2>
                        <h2 class="room-price">가격 <span>/ 1박</span></h2>
                    </div>
                </div>
            </div>
        </div>
 </div>
	
	<!-- Welcome Area End -->
<div class="roberto-rooms-area section-padding-100-0">
        <div class="container">
            <div class="row" style="margin-right:0px; margin-left:0px;">
                <div class="col-12 col-lg-8">
                    <!-- Single Room Details Area -->
                    <div class="single-room-details-area mb-50">
 						<div class="room-thumbnail-slides mb-50">
                            <div id="room-thumbnail--slide" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item">
                                        <img src="<%=cp%>/resources/images/bg-img/48.jpg" class="d-block w-100" alt="">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%=cp%>/resources/images/bg-img/49.jpg" class="d-block w-100" alt="">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%=cp%>/resources/images/bg-img/50.jpg" class="d-block w-100" alt="">
                                    </div>
                                    <div class="carousel-item active">
                                        <img src="<%=cp%>/resources/images/bg-img/51.jpg" class="d-block w-100" alt="">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%=cp%>/resources/images/bg-img/52.jpg" class="d-block w-100" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Room Features -->
                        <div class="room-features-area d-flex flex-wrap mb-50">
                            <h6>Size: <span>350-425sqf</span></h6>
                            <h6>Capacity: <span>Max persion 5</span></h6>
                            <h6>Bed: <span>King beds</span></h6>
                            <h6>Services: <span>Wifi, television ...</span></h6>
                        </div>

                        <p>숙박 자세한 내용</p>

                        <ul>
                            <li><i class="fa fa-check"></i> 숙박 체크내용</li>
                            <li><i class="fa fa-check"></i> Dictum purus at blandit molestie.</li>
                            <li><i class="fa fa-check"></i> Neque non fermentum suscipit.</li>
                            <li><i class="fa fa-check"></i> Donec id dui ac massa malesuada.</li>
                            <li><i class="fa fa-check"></i> In sit amet sapien quis orci maximus.</li>
                            <li><i class="fa fa-check"></i> Vestibulum rutrum diam vel eros tristique.</li>
                        </ul>

                        <p>숙박 자세한 내용</p>
                    </div>

                    <!-- Room Service -->
                    <div class="room-service mb-50">
                        <h4>Room Services</h4>

                        <ul>
                            <li><img src="<%=cp%>/resources/images/core-img/icon1.png" alt=""> Air Conditioning</li>
                            <li><img src="<%=cp%>/resources/images/core-img/icon2.png" alt=""> Free drinks</li>
                            <li><img src="<%=cp%>/resources/images/core-img/icon3.png" alt=""> Restaurant quality</li>
                            <li><img src="<%=cp%>/resources/images/core-img/icon4.png" alt=""> Cable TV</li>
                            <li><img src="<%=cp%>/resources/images/core-img/icon5.png" alt=""> Unlimited Wifi</li>
                            <li><img src="<%=cp%>/resources/images/core-img/icon6.png" alt=""> Service 24/24</li>
                        </ul>
                    </div>

                    <!-- Room Review -->
                    <div class="room-review-area mb-100">
                        <h4>Room Review</h4>

                        <!-- Single Review Area -->
                        <div class="single-room-review-area d-flex align-items-center">
                            <div class="reviwer-thumbnail">
                                <img src="<%=cp%>/resources/images/bg-img/55.jpg" alt=""><div>별찍기</div>
                            </div>
                            <div class="reviwer-content">
                                <div class="reviwer-title-rating d-flex align-items-center justify-content-between">
                                    <div class="reviwer-title">
                                        <span>27 Aug 2019</span>
                                        <!-- <h6>Amada Lyly</h6> -->
                                        <div style="font-size: 15px; color: #1cc3b2; font-weight: border;">작성자</div>
                                    </div>
                                </div>
                                 <p>후기내용</p>
                            </div>
                        </div>

                        <!-- Single Review Area -->
                        <div class="single-room-review-area d-flex align-items-center">
                            <div class="reviwer-thumbnail">
                                <img src="<%=cp%>/resources/images//bg-img/55.jpg" alt="">
                            </div>
                            <div class="reviwer-content">
                                <div class="reviwer-title-rating d-flex align-items-center justify-content-between">
                                    <div class="reviwer-title">
                                        <span>27 Aug 2019</span>
                                        <!-- <h6>Amada Lyly</h6> -->
                                        <div style="font-size: 15px; color: #1cc3b2; font-weight: border;">작성자</div>
                                    </div>
                                </div>
                                 <p>후기내용</p>
                            </div>
                        </div>

                        <!-- Single Review Area -->
                        <div class="single-room-review-area d-flex align-items-center">
                            <div class="reviwer-thumbnail">
                                <img src="<%=cp%>/resources/images/bg-img/55.jpg" alt="">
                            </div>
                            <div class="reviwer-content">
                                <div class="reviwer-title-rating d-flex align-items-center justify-content-between">
                                    <div class="reviwer-title">
                                        <span>27 Aug 2019</span>
                                        <!-- <h6>Amada Lyly</h6> -->
                                        <div style="font-size: 15px; color: #1cc3b2; font-weight: border;">작성자</div>
                                    </div>
                                </div>
                                 <p>후기내용</p>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-12 col-lg-4">
                    <!-- Hotel Reservation Area -->
                    <div class="hotel-reservation--area mb-100" style="border: 2px  solid; border-color:gray; padding: 10px;">
                        <form action="#" method="post">
                             <div >
                                <label style="font-size: 25px;" >날짜 검색</label>
                                <div>
                                    <div class="row no-gutters">
			                            <div class="col-6 col-md-6 col-lg-6">                              
			                                <input type="date" class="form-control" id="checkIn" name="checkin-date">
			                            </div>
			                           	<div class="col-6 col-md-6 col-lg-6">                              
			                                <input type="date" class="form-control" id="checkIn" name="checkin-date">
			                            </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="margin-top: 40px;">
                                <button type="submit" class="btn roberto-btn w-100">예약하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Rooms Area End -->

    <!-- Call To Action Area Start -->
    <section class="roberto-cta-area" style="padding-bottom: 30px;">
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
    <!-- Call To Action Area End -->

	