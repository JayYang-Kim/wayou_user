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



	          

  <div class="roberto-rooms-area section-padding-100-0">
      <div class="container">
          <div class="row">
          	  <div class="col-12 col-lg-3 mr-50">
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
									<button class="btn roberto-btnn w-100 mb10" style="font-size: 16px;">워터파크</button>
									<button class="btn roberto-btnn w-100 mb10" style="font-size: 16px;">익스트림</button>
									<button class="btn roberto-btnn w-100 mb10" style="font-size: 16px;">공연/전시</button>
									<button class="btn roberto-btnn w-100 mb10" style="font-size: 16px;">키즈</button>
									<button class="btn roberto-btnn w-100 mb10" style="font-size: 16px;">축제/캠핑</button>
									<button class="btn roberto-btnn w-100 mb10" style="font-size: 16px;">투어/교통</button>
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
          		<div class="row" style="font-size: 20px; margin-bottom: 20px;">
               		<select name="" class="nice-select">
               			<option value="popular">인기순</option>
               			<option value="review">후기많은순</option>
               			<option value="sales">판매순</option>
               		</select>
				</div>
          		
				<div class="row" align="left">
                  <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">

                      <div class="room-thumbnail">
                          <img src="<%=cp%>/resources/images/bg-img/everland.jpeg" alt="">
                      </div>
                      <!-- Room Content -->
                      <div class="room-content" style="margin-top: 5px;">
                          <div style="font-size: 18px; margin-bottom: 3px;">경기도 용인</div>
                          <h2 style="margin-bottom: 20px;">에버랜드 입장권</h2>
                          <div><h4>50000<span>원</span></h4></div>
                          <div class="room-feature">
                              <div><h6>★★★★★(255)</h6></div>
                              <h6>423개 구매</h6>
                          </div>
                          <a href="<%=cp%>/ticket/detail" class="btn view-detail-btn">더보기 <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
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
</div>	
