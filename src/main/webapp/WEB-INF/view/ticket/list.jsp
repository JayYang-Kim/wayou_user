<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
//지역선택창
	$(function(){
		$(".no-gutters").find(".regionSelect").hide();
	});
	
	$("body").on("click", ".input_search", function(){
		var select = $(this).closest(".no-gutters").find(".regionSelect");
		var is = $(this).closest(".no-gutters").find(".regionSelect").is(":hidden");
		
		if(is) {
			select.show();
		} else {
			select.hide();
		}
	});
	
//지역선택시
	$(function(){
		$("body").on("click", ".btn_sendRegion", function(){
			var form=document.regionSelect;
			
			var regionCode = $(this).attr("data-locCode");
			
			var url="<%=cp%>/ticket/list?regionCode="+regionCode;
			
			form.action=url;
			form.submit();
		});
	});
	
</script>

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
                      <form name="regionSelect" method="post">
                          <div class="form-group mr-10 mb-30">
                              <label for="regionSearch">지역 검색</label>
                                  <div class="row no-gutters">
                                      <div class="col-12">
	                        				<input type="text" class="form-control input_search"/>
                                      </div>
                                      <div class="col-12 regionSelect" style="height:200px; padding-top:10px; text-align:center; border-left: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black;">
                                  		<c:forEach var="dto_region" items="${listRegion}">	
                                  			<button class="btn_classic btn_sendRegion" style="margin: 5px auto 5px; font-size: 13px;" data-locCode='${dto_region.locCode}'>${dto_region.locName}</button>
                                  		</c:forEach>	
                        			</div>
                                  </div>
                                  
                          </div>
                          
                          
                          <div class="form-group mb-30">
                              <label for="guests">카테고리</label>
                              <div class="row">
                                  <div class="col-12">
                                  <c:forEach var="dto_category" items="${listCategory}">	
										<button class="btn roberto-btnn w-100 mb10" style="font-size: 16px;">${dto_category.categoryName}</button>
									</c:forEach>
                                  </div>
                              </div>
                          </div>
                         <!--  <div class="form-group mb-50">
                              <div class="slider-range">
                                  <div class="range-price">Max Price: $0 - $3000</div>
                                  <div data-min="0" data-max="3000" data-unit="$" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="0" data-value-max="3000" data-label-result="Max Price: ">
                                      <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                      <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                      <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                  </div>
                              </div>
                          </div> -->
                        
                      </form>
                  </div>
              </div>

          	<div class="col-12 col-lg-8">              
          		<div class="row" style="font-size: 20px; margin-bottom: 20px; margin-left: 700px;">
               		<select name="" class="nice-select">
               			<option value="popular">인기순</option>
               			<option value="review">후기많은순</option>
               			<option value="sales">판매순</option>
               		</select>
				</div>
<c:forEach var="dto" items="${list}">          		
				<div class="row" align="left">
                  <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms" style="height: 250px;">

                      <div class="room-thumbnail" style="width: 450px; margin-left: 70px;">
                          <img src="<%=cp%>/resources/images/bg-img/everland.jpeg" alt="">
                      </div>
                      <!-- Room Content -->
                      <div class="room-content" style="margin-top: 1px;">
                          <div style="font-size: 18px; margin-bottom: 3px;">${dto.address1}</div>
                          <h1 style="margin-bottom: 20px;">${dto.ticketName}</h1>
                          <div><h4>${dto.price}<span>원</span></h4></div>
                          <div class="room-feature">
                              <div><h6>★★★★★(255)</h6></div>
                              <h6>423개 구매</h6>
                          </div>
                          <a href="<%=cp%>/ticket/detail" class="btn view-detail-btn">더보기 <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                      </div>                     
                  </div>
          		</div>
</c:forEach>
				 <!-- Pagination -->
                  <!-- <nav class="roberto-pagination wow fadeInUp mb-100" data-wow-delay="1000ms">
                      <ul class="pagination">
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item"><a class="page-link" href="#">Next <i class="fa fa-angle-right"></i></a></li>
                      </ul>
                  </nav> -->
                 <nav class="roberto-pagination wow fadeInUp mb-100" data-wow-delay="500ms"> 
                  <table style="width: 100%; margin: 10px auto 50px; border-spacing: 0px;">
		  			<tr height="40">
						<td align="center" style="padding-top:10px;">
		        			${dataCount==0 ? "등록된 자료가 없습니다." : paging}
						</td>
		   			</tr>
				</table>
				</nav>         		
          	</div>
      </div>
	</div>
</div>	
