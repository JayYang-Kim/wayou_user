<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>


  <!-- Breadcrumb Area Start -->
   <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(img/bg-img/16.jpg);">
       <div class="container h-100">
           <div class="row h-100 align-items-center">
               <div class="col-12">
                   <div class="breadcrumb-content text-center">
                       <h2 class="page-title">티켓</h2>
                       <nav aria-label="breadcrumb">
                           <ol class="breadcrumb justify-content-center">
                               <li class="breadcrumb-item"><a href="#">Home</a></li>
                               <li class="breadcrumb-item active" aria-current="page">ticket</li>
                           </ol>
                       </nav>
                   </div>
               </div>
           </div>
       </div>
   </div>
   <!-- Breadcrumb Area End -->



	          
  <!-- Rooms Area Start -->
  <div class="roberto-rooms-area section-padding-100-0">
      <div class="container">
          <div class="row">
          	  <div class="col-12 col-lg-4 mr-10">
                  <!-- Hotel Reservation Area -->
                  <div class="hotel-reservation--area mb-100">
                      <form action="#" method="post">
                          <div class="form-group mr-10 mb-30">
                              <label for="regionSearch">지역 검색</label>
                              
                                  <div class="row no-gutters">
                                      <div class="col-12">
	                        				<input type="text" class="form-control" id="input_search" name="input_search"/>
                                      </div>
                                  </div>
                             
                          </div>
                          <div class="form-group mb-30">
                              <label for="guests">카테고리</label>
                              <div class="row">
                                  <div class="col-12">
									<button class="btn roberto-btnn w-100 mb10" style="font-size: 16px;">테마파크</button>
									<button class="btn roberto-btn w-100 mb10" style="font-size: 16px;">워터파크</button>
									<button class="btn roberto-btn w-100 mb10" style="font-size: 16px;">익스트림</button>
									<button class="btn roberto-btn w-100 mb10" style="font-size: 16px;">공연/전시</button>
									<button class="btn roberto-btn w-100 mb10" style="font-size: 16px;">키즈</button>
									<button class="btn roberto-btn w-100 mb10" style="font-size: 16px;">축제/캠핑</button>
									<button class="btn roberto-btn w-100 mb10" style="font-size: 16px;">투어/교통</button>
                                  </div>
                              </div>
                          </div>
                          <div class="form-group mb-50">
                              <div class="slider-range">
                                  <div class="range-price">Max Price: $0 - $3000</div>
                                  <div data-min="0" data-max="3000" data-unit="$" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="0" data-value-max="3000" data-label-result="Max Price: ">
                                      <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                      <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                      <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                  </div>
                              </div>
                          </div>
                        
                      </form>
                  </div>
              </div>

          		
          		
             
               <div class="col-12 col-lg-8">
               <div style="text-align: right; font-size: 20px; margin-bottom: 20px;">인기순</div>

                  <!-- Single Room Area -->

                  <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
                      <!-- Room Thumbnail -->
                      <div class="room-thumbnail">
                          <img src="<%=cp%>/resources/images/bg-img/everland.jpeg" alt="">
                      </div>
                      <!-- Room Content -->
                      <div class="room-content">
                          <span>경기도 용인</span>
                          <h2>에버랜드 입장권</h2>
                          <h4>50000<span>원</span></h4>
                          <div class="room-feature">
                              <h6>Size: <span>★★★★★(255)</span></h6>
                              <h6>Capacity: <span>423개 구매</span></h6>
                              <h6>Bed: <span>King beds</span></h6>
                              <h6>Services: <span>Wifi, television ...</span></h6>
                          </div>
                          <a href="<%=cp%>/ticket/detail" class="btn view-detail-btn">View Details <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                      </div>
                  </div>

                  <!-- Single Room Area -->
                  <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="300ms">
                      <!-- Room Thumbnail -->
                      <div class="room-thumbnail">
                          <img src="img/bg-img/44.jpg" alt="">
                      </div>
                      <!-- Room Content -->
                      <div class="room-content">
                          <h2>Small Room</h2>
                          <h4>400$ <span>/ Day</span></h4>
                          <div class="room-feature">
                              <h6>Size: <span>30 ft</span></h6>
                              <h6>Capacity: <span>Max persion 5</span></h6>
                              <h6>Bed: <span>King beds</span></h6>
                              <h6>Services: <span>Wifi, television ...</span></h6>
                          </div>
                          <a href="#" class="btn view-detail-btn">View Details <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                      </div>
                  </div>

                  <!-- Single Room Area -->
                  <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="500ms">
                      <!-- Room Thumbnail -->
                      <div class="room-thumbnail">
                          <img src="img/bg-img/45.jpg" alt="">
                      </div>
                      <!-- Room Content -->
                      <div class="room-content">
                          <h2>Premium King Room</h2>
                          <h4>400$ <span>/ Day</span></h4>
                          <div class="room-feature">
                              <h6>Size: <span>30 ft</span></h6>
                              <h6>Capacity: <span>Max persion 5</span></h6>
                              <h6>Bed: <span>King beds</span></h6>
                              <h6>Services: <span>Wifi, television ...</span></h6>
                          </div>
                          <a href="#" class="btn view-detail-btn">View Details <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                      </div>
                  </div>

                  <!-- Single Room Area -->
                  <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="700ms">
                      <!-- Room Thumbnail -->
                      <div class="room-thumbnail">
                          <img src="img/bg-img/46.jpg" alt="">
                      </div>
                      <!-- Room Content -->
                      <div class="room-content">
                          <h2>Room Vip King</h2>
                          <h4>400$ <span>/ Day</span></h4>
                          <div class="room-feature">
                              <h6>Size: <span>30 ft</span></h6>
                              <h6>Capacity: <span>Max persion 5</span></h6>
                              <h6>Bed: <span>King beds</span></h6>
                              <h6>Services: <span>Wifi, television ...</span></h6>
                          </div>
                          <a href="#" class="btn view-detail-btn">View Details <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                      </div>
                  </div>

                  <!-- Single Room Area -->
                  <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="900ms">
                      <!-- Room Thumbnail -->
                      <div class="room-thumbnail">
                          <img src="img/bg-img/47.jpg" alt="">
                      </div>
                      <!-- Room Content -->
                      <div class="room-content">
                          <h2>Royal Room</h2>
                          <h4>400$ <span>/ Day</span></h4>
                          <div class="room-feature">
                              <h6>Size: <span>30 ft</span></h6>
                              <h6>Capacity: <span>Max persion 5</span></h6>
                              <h6>Bed: <span>King beds</span></h6>
                              <h6>Services: <span>Wifi, television ...</span></h6>
                          </div>
                          <a href="#" class="btn view-detail-btn">View Details <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                      </div>
                  </div>

                  <!-- Pagination -->
                  <nav class="roberto-pagination wow fadeInUp mb-100" data-wow-delay="1000ms">
                      <ul class="pagination">
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item"><a class="page-link" href="#">Next <i class="fa fa-angle-right"></i></a></li>
                      </ul>
                  </nav>
              </div>
			</div>

          </div>
      </div>
  <!-- Rooms Area End -->
	

	
	<!-- Call To Action Area Start -->
	<section class="roberto-cta-area pt40 pb40">
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