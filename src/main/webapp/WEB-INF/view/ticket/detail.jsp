<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.star2 {
	font-size: 0;
	letter-spacing: -4px;
}

.star a {
	font-size: 35px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 3px;
	color: #cccccc;
	text-decoration: none;
}

.star2 a {
	font-size: 20px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 3px;
	color: #cccccc;
	text-decoration: none;
}
.star a:first-child {
	margin-left: 0;
}
.star a.on {
	color: #F2CB61;
}

.star2 a:first-child {
	margin-left: 0;
}
.star2 a.on {
	color: #F2CB61;
}
</style>
 

<script type="text/javascript">
//티켓 옵션 선택
$(function(){
	var id=$("#tabContent1");
	var url="<%=cp%>/ticket/tab1";
	/* var url="tab1.jsp"; */
	viewTabContent(id, url);
	
	$(".nice-select").css("width", "100%");
	$(".nice-select ul.list").css("width", "100%");
	
	$(".nice-select.date .current").html("날짜 선택");
	$(".nice-select.option .current").html("옵션 선택");
/* 	$(".nice-select.option ul").empty(); */
});

//날짜 선택
$("body").on("click", ".nice-select.date ul li", function(){
	$(".nice-select.option ul").empty();
	$(".nice-select.option .current").html("옵션 선택");
	
	var date = $(this).attr("data-value");
	var storeCode = ${dto.storeCode};
	var query = "storeCode="+storeCode+"&date="+date;
	var url = "<%=cp%>/ticket/readOption";
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			for(var i=0; i<data.listOption.length; i++) {
				if(data.listOption[i].ticketDetailName==null) {
					var html = "<li data-value='soldout' class='option'>soldout</li>"
					$(".nice-select.option ul").append(html);
					return false;
					}
				var ticketDetailName = data.listOption[i].ticketDetailName;
				var price = data.listOption[i].price;
				var count = data.listOption[i].count;
				var ticketDetailCode = data.listOption[i].ticketDetailCode;
				var html = "<li data-detailCode='"+ticketDetailCode+"' data-name='"+ticketDetailName+"' data-value='"+price+"' data-count='"+count+"' class='option'>"+ticketDetailName+"&nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp"+price+"원&nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp"+count+"개 남음</li>"
				$(".nice-select.option ul").append(html);
			}
		}
	 	,error:function(e) {
	    	if(e.status==403) {
	    		location.href="<%=cp%>/member/login";
	    		return;
	    	}
	    	console.log(e.responseText);
	    }
	});
});

//옵션 선택
$("body").on("click", ".nice-select.option ul li", function(){
	var selectedDate = $("#selectedDate option:selected").val();
	var selectedName = $(this).attr("data-name");
	var selectedPrice = $(this).attr("data-value");
	var selectedCount = $(this).attr("data-count");
	var selectedCode = $(this).attr("data-detailCode");
	var totalPrice = $("#ttPrice").attr("data-total");
	
	if(typeof totalPrice == "undefined") {
		totalPrice = selectedPrice;	
	} else {
		totalPrice = Number(totalPrice) + Number(selectedPrice);
	}
	
	// #buy_list에 등록된 data-detailcode값을 배열로 담아두기
	var buyList_detailCode = new Array();
	for(var i = 0; i < $("#buy_list li").length; i++) {
		buyList_detailCode.push($("#buy_list li:eq("+i+")").attr("data-detailCode"));
	}
	
	// #buy_list에 등록된 data-detailcode값을 buyList_detailCode(배열)에 있는 값과 비교하여 같은 경우 이벤트 취소처리
	for(var i = 0; i < buyList_detailCode.length; i++) {
		if(selectedCode == buyList_detailCode[i]) {
			return false;
		}	
	}
	
	var out="";
	out += "<li class='buy_item clear' id='buy_item' data-sssPrice='"+selectedPrice+"' data-detailCode='"+selectedCode+"' style='margin-top: 50px; padding-top: 20px; padding-bottom: 20px; background-color: #f8f8f8'>";
	out += "<p style='margin-left: 20px; font-size: 15px; margin-right: 20px;'>";
	out += "<span class='ssCode' data-ssCode='"+selectedCode+"'>"+selectedName+"&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp"+numberWithCommas(selectedCount)+"개 남음</span>";
	out += "<span style='float:right;'><button type='button' class='button deleteSel'>x</button></span>";
	out += "</p>";
	out += "<p style='margin-top: 25px; margin-left: 20px; margin-right: 20px;'>";
	out += "<span><button type='button' class='button minusBtn'>-</button><input type='text' class='ssBuyCount' value='1'><button type='button' class='button plusBtn'>+</button></span>";
	out += "<span style='float:right; font-weight: bold; font-size: 15px;' class='ssPrice' data-ssPrice='"+selectedPrice+"'>"+numberWithCommas(selectedPrice)+"원</span>";
	out += "</p></li>"; 

	$("#buy_list").append(out);
	
	var html = "<span style='float:right; margin-right: 5px; font-weight: bold; font-size: 20px;' id='ttPrice' data-total='"+totalPrice+"'>"+numberWithCommas(totalPrice)+"</span>";
	
	$(this).closest("ul.detail").find(".total_price").html(html);
});

$("body").on("click", ".deleteSel", function(){
	var totalPrice = $("#ttPrice").attr("data-total");
	var buy_item = $(this).closest(".buy_item");
	var selectedPrice = buy_item.find(".ssPrice").attr("data-ssPrice");
	var totalPrice = $("#ttPrice").attr("data-total");

	totalPrice = Number(totalPrice) - Number(selectedPrice);

	$(this).closest(".buy_item").remove();
	
	var html = "<span style='float:right; margin-right: 5px; font-weight: bold; font-size: 20px;' id='ttPrice' data-total='"+totalPrice+"'>"+numberWithCommas(totalPrice)+"</span>";
	$(".total_price").html(html);
});

//탭 메뉴
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
		  
		  viewTabContent(id, url, tab);
	});	
});

function viewTabContent(id, url, tab) {
	var storeCode = ${dto.storeCode};
	var ticketCode = ${dto.ticketCode};
	
	$.post(url, {storeCode : storeCode, ticketCode : ticketCode}, function(data){		
		  id.html(data);

		  if(tab=="2")
			  listPage(1);
		  
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

//후기 리스트
function listPage(page) {
	var storeCode = ${dto.storeCode};
	var query = "storeCode="+storeCode+"&pageNo="+page;
	var url = "<%=cp%>/ticket/listReview";
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,success:function(data) {
			$("#listReview").html(data);
		}
		,error:function(e) {
			if(e.status==403) {
				location.href="<%=cp%>/member/login";
				return;
			}
			console.log(e.responseText);
		}
	});
}

//후기 별점
$(function() {
	$("body").on("click", ".star a", function(){
		var b = $(this).hasClass("on");
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		if (b)
			$(this).removeClass("on");
		var s = $(".star .on").length;
		$("#score").val(s);
		});
	});

//후기 작성
$(function(){
	$("body").on("click", ".btnSendReview", function(){
		var storeCode = ${dto.storeCode};
		var $tb = $(this).closest("table");
		var content = $tb.find("textarea").val().trim();
		if(!content) {
			$tb.find("textarea").focus();
			return;
		}
		content = encodeURIComponent(content);
		var star = $("#score").val().trim();
		
		var query = "storeCode="+storeCode+"&content="+content+"&star="+star;
		var url = "<%=cp%>/ticket/insertReview";
		
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				$tb.find("textarea").val("");
				$("#score").val(0);
				$(".star").children("a").removeClass("on");
				listPage(1);
				
				
			}
		 	,error:function(e) {
		    	if(e.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	}
		    	console.log(e.responseText);
		    }
		});
	});
	
});

$(function(){
	
	$("body").on("keyup",".ssBuyCount",function(){
		var $span = $(this).parent();
		if(parseInt($(this).val())>99){
			alert("최대 구매 수량은 99개 입니다.");
			$(this).val(99);
			return false;
		}else if(parseInt($(this).val())<1){
			alert("최소 구매 수량은 1개 입니다.");
			$(this).val(1);
			return false;
		}
		$span.siblings("span").html((""+$(this).val()*($span.siblings("span").attr("data-ssprice"))).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
		getSum();
	});
	
	$("body").on("click",".plusBtn",function(){
		var $span = $(this).parent();
		var $buyCount = $span.find(".ssBuyCount");
		if(parseInt($buyCount.val())>=99){
			alert("최대 구매 수량은 99개 입니다.");
			return false;
		}
		$buyCount.val(parseInt($buyCount.val())+1);
		$span.siblings("span").html((""+$buyCount.val()*($span.siblings("span").attr("data-ssprice"))).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
		getSum();
	});
	$("body").on("click",".minusBtn",function(){
		var $span = $(this).parent();
		var $buyCount = $span.find(".ssBuyCount");
		if(parseInt($buyCount.val())<=1){
			alert("최소 구매 수량은 1개 입니다.");
			return false;
		}
		$buyCount.val(parseInt($buyCount.val())-1);
		$span.siblings("span").html((""+$buyCount.val()*($span.siblings("span").attr("data-ssprice"))).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
		
		getSum();
	});
	
	function getSum(){
		var $totPrice = $(".newsletter-formm").find("#ttPrice");
		var sum = 0;
		for(var i = 0; i < $("#buy_list li").length; i++) {
			sum += ($("#buy_list li:eq("+i+")").attr("data-sssPrice")*$("#buy_list li:eq("+i+")").find(".ssBuyCount").val());
		}
		$totPrice.html((""+sum).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
	}
	
	$("body").on("click", ".cart-btn", function(){
		var buyList_code = new Array();
		var buyList_price = new Array();
		var buyList_buyCount = new Array();
		for(var i = 0; i < $("#buy_list li").length; i++) {
			buyList_code.push($("#buy_list li:eq("+i+")").attr("data-detailCode"));
			buyList_price.push($("#buy_list li:eq("+i+")").attr("data-sssPrice"));
			buyList_buyCount.push($("#buy_list li:eq("+i+")").find(".ssBuyCount").val());
			
		var query = "ticketDetailCode="+buyList_code[i]+"&price="+buyList_price[i]+"&buyCount="+buyList_buyCount[i];
		var url = "<%=cp%>/ticket/insertWishlist";	
		
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				 location.href="<%=cp%>/myPage/wishlist/list";
			}
		 	,error:function(e) {
		    	if(e.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	}
		    	console.log(e.responseText);
		    }
		});
		
		}
	});
	$("body").on("click", ".buy-btn", function(){
		var totPrice = 0;
		
		if($("#buy_list li").length==0){
			alert("구매할 티켓을 선택하세요!");
			return false;
		}
		
		for(var i = 0; i < $("#buy_list li").length; i++) {
			totPrice += $("#buy_list li:eq("+i+")").attr("data-sssPrice")*$("#buy_list li:eq("+i+")").find(".ssBuyCount").val();		
		}

		var data = "userIdx=${sessionScope.member.userIdx}";
		var url = "<%=cp%>/payInfo";		
		$.ajax({
			type:"get",
			url:url,
			data:data,
			dataType:"json",
			success:function(data){
				var IMP = window.IMP; // 생략가능
				IMP.init(data.payInfo.storeCode);
				IMP.request_pay({
				    pg : 'inicis', // version 1.1.0부터 지원.
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명:결제테스트',
				    amount : totPrice,
 				    buyer_email : data.payInfo.userEmail,
				    buyer_name : data.payInfo.userName,
				    buyer_tel : data.payInfo.userTel,
				    buyer_addr : data.payInfo.userAddr1 + data.payInfo.userAddr2,
				    buyer_postcode : data.payInfo.postCode				 
				}, function(rsp) {
				    if ( rsp.success ) { 
				        var msg = '결제가 완료되었습니다.';
				        var impCode = rsp.imp_uid;
				        var paymethod= rsp.pay_method;
				        var status=rsp.status;
				        $.ajax({
				        	type:"post",
							url:url, 
							data:{
								impCode:impCode,
								payMethod:paymethod,
								status:status
							},
							dataType:"json",
							success:function(){
								alert("구매해주셔서 감사합니다.");
								location.replace("<%=cp%>/");
							},
							beforesend:function(e){
								e.setRequestHeader("AJAX",true);
							},
							error:function(e){
						    	if(e.status==403) {
						    		location.href="<%=cp%>/member/login";
						    		return;
						    	}
							}
				        });
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				    }
				});		
			},
			beforesend:function(e){
				e.setRequestHeader("AJAX",true);
			},
			error:function(e){
		    	if(e.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	} 
			}
		});
	});

});



</script>

  
  

    <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/16.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-end">
                <div class="col-12">
                    <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                        <h2 class="room-title">Ticket</h2>
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
                                	<c:forEach var="listStoreFile" items="${listStoreFile}">
	                                    <div class="carousel-item active">
	                                        <img src="/wadmin/uploads/store/${listStoreFile.saveFilename}" class="d-block w-100" alt="">
	                                    </div>
                                    </c:forEach>
                                </div>

                                <ol class="carousel-indicators">
                                	<c:forEach var="listStoreFile" items="${listStoreFile}" varStatus="status">
                                    <li data-target="#room-thumbnail--slide" data-slide-to="${status.index}" class="active">
                                        <img src="/wadmin/uploads/store/${listStoreFile.saveFilename}" class="d-block w-100" alt="">
                                    </li>
                                    </c:forEach>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-12 col-lg-5">
                    <div class="roberto-sidebar-area pl-md-4">

                        <!-- Newsletter -->
                        <div class="single-widget-area mb-100">
                            <div class="newsletter-formm">  	
                            <ul class="detail">
                            		<li style="font-size:18px;">${dto.loctitle}</li>
                            		<li style="font-size:25px;">${dto.ticketName}</li>
                            		<li style="font-size: 23px; margin-top: 10px;"><fmt:formatNumber>${dto.price}</fmt:formatNumber>원</li>
                            		<li style="font-size: 15px; margin-top: 10px;">판매기간: ${dto.sales_start} ~ ${dto.sales_end}</li>
                            		<li style="font-size: 15px; margin-top: 12px;">티켓선택
                            		<li style="text-align: right">1인당 최대 99개 구매 가능</li>
                            		
                  					<li style="margin-top: 5px;">
                            		<select class="nice-select date" id="selectedDate" name="selectedDate">
                           		<c:forEach var="dto_date" items="${listDate}">	
                            			<option value="${dto_date.use_start}">${dto_date.use_start}</option>
                            	</c:forEach>
                            		</select>
                            		</li>
                            		
                            		
                            		<li class="clear">
                            		<select class="nice-select option mt3"  id="selectedOption" name="selectedOption">
                            		</select>
                            		</li>
                            		
                            		<li class="clear" id="buy_list">
									</li>
                            		
                            		<li class="clear" style="margin-top: 30px;">
                            			<span style="font-size: 15px;">총 상품금액</span><span style="float:right; font-size: 15px;">원</span><span class="total_price" style="float:right; font-weight: bold; font-size: 20px;">0</span>
                            		</li>
                            		
                            		<li class="clear mb-10 t-center">
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
	      					<li role="presentation active"><a href="#tabContent1" aria-controls="1" role="tab" data-toggle="tab">상품설명</a></li>
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
      



