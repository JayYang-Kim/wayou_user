<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

 
<script type="text/javascript">

//날짜 선택시 옵션
$(function(){
	
	 $("body").on("click", ".btn_sendCategory", function(){
			var form=document.searchSelect;
			
			var date = $("select[name=dateSelect]").val();
			
			var url="<%=cp%>/ticket/list?regionCode="+regionCode+"&cateCode="+cateCode;
			
			form.action=url;
			form.submit();
		}); 
});




$(function(){
	var id=$("#tabContent1");
	var url="tab1.jsp";
	viewTabContent(id, url);
	
	$(".nice-select").css("width", "100%");
	$(".nice-select ul.list").css("width", "100%");
	
	$(".nice-select.date .current").html("날짜 선택");
	$(".nice-select.option .current").html("옵션 선택");
});

$(function(){
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  // alert(e.target); // newly activated tab
		  // e.relatedTarget // previous active tab
		  var tab=$(this).attr("aria-controls");
		  var id=$("#tabContent"+tab);
		  
		  var url;
		  if(tab=="1") {
			  url="<%=cp%>/ticket/tab1";
		  } else if(tab=="2") {
			  url="<%=cp%>/ticket/tab2";
		  } else if(tab=="3") {
			  url="<%=cp%>/ticket/tab3";
		  }
		  
		  viewTabContent(id, url);
	});	
});

function viewTabContent(id, url) {
	var storeCode = ${dto.storeCode};
	
	$.post(url, {storeCode : storeCode}, function(data){		
		  id.html(data);
	}); 
}


function ajaxHTML(url, type, query, id) {//url에 query를갖고 처리한 data를 리턴한 jsp에 뿌려주고 해당 jsp의 html을 해당 id자리에 뿌려줌

	$.ajax({ 
		type:type
		,url:url
		,data:query
		,success:function(data){
			$("#"+id).html(data);
		
		}
		,beforeSend:function(e) {
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e) {
			if(e.status==403){  
				location.href="<%=cp%>/member/login";
				return;
			}
			console.log(e.responseText);
		}		
	});
}

/* $(function () {
	tab1();
}); */

<%-- function tab3(storeCode) {
	var id="tabContent3";
	var url="<%=cp%>/ticket/tab3";
	var query="storeCode="+storeCode;
	
	ajaxHTML(url, "get", query, id);
} --%>


</script>

  
 

    <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(img/bg-img/16.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-end">
                <div class="col-12">
                    <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                        <h2 class="room-title">ticket</h2>
                       <!--  <h2 class="room-price">$180 <span>/ Per Night</span></h2> -->
                    </div>
                </div>
            </div>
        </div>
    </div>


 
 
    <!-- Rooms Area Start -->
    <div class="roberto-rooms-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-7">
                    <!-- Single Room Details Area -->
                    <div class="single-room-details-area mb-50">
                        <!-- Room Thumbnail Slides -->
                        <div class="room-thumbnail-slides mb-50">
                            <div id="room-thumbnail--slide" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner mb-50">
                                    <div class="carousel-item active">
                                        <img src="<%=cp%>/resources/images/bg-img/everland.jpeg" class="d-block w-100" alt="">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%=cp%>/resources/images/bg-img/everland2.jpeg" class="d-block w-100" alt="">
                                    </div>
                                   
                                </div>

                                <ol class="carousel-indicators">
                                    <li data-target="#room-thumbnail--slide" data-slide-to="0" class="active">
                                        <img src="<%=cp%>/resources/images/bg-img/everland.jpeg" class="d-block w-100" alt="">
                                    </li>
                                    <li data-target="#room-thumbnail--slide" data-slide-to="1">
                                        <img src="<%=cp%>/resources/images/bg-img/everland2.jpeg" class="d-block w-100" alt="">
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-12 col-lg-5">
                    <div class="roberto-sidebar-area pl-md-4">

                        <!-- Newsletter -->
                        <div class="single-widget-area mb-100">
                            <div class="newsletter-form" style="height: 420px;">  	
                            <ul class="detail">
                            		<li style="font-size:18px;">${dto.address1}</li>
                            		<li style="font-size:25px;">${dto.ticketName}</li>
                            		<li style="font-size: 23px; margin-top: 10px;">${dto.price}원</li>
                            		<li style="font-size: 15px; margin-top: 10px;">판매기간: ${dto.sales_start} ~ ${dto.sales_end}</li>
                            		<li style="font-size: 15px; margin-top: 12px;">티켓선택
                            		<li style="text-align: right">1인당 최대 4개 구매 가능</li>
                            		
                  					<li style="margin-top: 5px;">
                            		<select class="nice-select date">
                           		<c:forEach var="dto_date" items="${listDate}">	
                            			<option name="dateSelect" value="${dto_date.use_start}">${dto_date.use_start}</option>
                            	</c:forEach>
                            		</select>
                            		</li>
                            		
                            		
                            		<li class="clear">
                            		<select class="nice-select option mt3">
                            			<option value="">성인</option>
                            			<option value="">청소년</option>
                            		</select>
                            		</li>
                            		
                            		<li class="clear" style="margin-top: 30px;">
                            		
                            		</li>
                            		
                            		<li class="mb-10 t-center">
                            			<button type="button" class="btn cart-btn" style="width: 130px; margin-top: 20px;">카트담기</button>
                            		
                            			<button type="button" class="btn buy-btn" style="margin-left: 10px; margin-top: 20px;">바로구매</button>
                            		</li>
                            </ul>

                            
                        </div>
                    
                           <!--  <div class="form-group">
                                <button type="submit" class="btn roberto-btn w-100">Check Available</button>
                            </div> -->
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- Rooms Area End -->

    <!-- tab -->
        <div class="container">
            <div class="row align-items-center mb-100">
				<div style="margin: 30px auto; width: 100%;">
					<div role="tabpanel">
	  					<ul id="myTab" class="tabmenu" role="tablist">
	      					<li role="presentation"  class="active"><a href="#tabContent1" aria-controls="1" role="tab" data-toggle="tab">상품설명</a></li>
	      					<li role="presentation"><a href="#tabContent2" aria-controls="2" role="tab" data-toggle="tab">상품리뷰</a></li>
	      					<li role="presentation"><a href="#tabContent3" aria-controls="3" role="tab" data-toggle="tab">환불규정/상품고시</a></li>
	  					</ul>
	
	  				<div class="tab-content">
	      				<div role="tabpanel" class="tab-pane active" id="tabContent1"></div>
	      				<div role="tabpanel" class="tab-pane" id="tabContent2"></div>
	      				<div role="tabpanel" class="tab-pane" id="tabContent3"></div>
	  				</div>
   					</div>
				</div>
			</div>
       	</div>
      



