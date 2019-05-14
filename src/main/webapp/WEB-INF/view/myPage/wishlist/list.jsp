<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<style>

</style>
<script type="text/javascript">
$(function(){
   listWish();
});
function listWish(){
   var url="<%=cp%>/myPage/wishlist/list2";
   $.ajax({
         type:"GET",
         url:url,
         dataType:"json",
         success:function(data){
              printWish(data);
         },beforeSend:function(jqXHR){
            jqXHR.setRequestHeader("AJAX", true);
         },error:function(x,e){ 

          }
      });
   };
    function printWish(data){
         var dataCount=data.dataCount;
         var out="";
         var totalprice=0;
         
      if(dataCount!=0){
         for(var i=0; i<data.listdh.length; i++){
        	 var departCode=data.listdh[i].departCode;
			 var wishCode=data.listdh[i].wishCode;
	         var amount=data.listdh[i].amount;
	         var price=data.listdh[i].price;
	         var listNum = data.listdh[i].listNum;
	         var hName=data.listdh[i].hName;
	         var roomNum=data.listdh[i].roomNum;
	         var information=data.listdh[i].information;
	         var amount1=data.listdh[i].amount1;
	         var price1=data.listdh[i].price1;
	         var totalprice1=data.listdh[i].totalprice1;
	         totalprice+=(amount*price);
         
         out+=" <tr data-departCode="+departCode+" data-wishCode="+wishCode+" data-amount="+amount+" data-price="+price+">";
         out+=" <td style='text-align:center'>"+listNum+"</td>";
         out+=" <td style='text-align:center'><img src ='<%=cp%>/resources/images/bg-img/everland.jpeg' style='width:100px; height:100px;'></td>";
         out+=" <td style='text-align:center'><h6>"+hName+"/ "+roomNum+"호실</h><br>"+information+"</td>";
         out+=" <td style='text-align:center'><input class='upInput' style='border:none; width:45px' readonly='readonly' value="+amount1+"><button type='button' class='update_confirm button btn_blue h25 m20' style='margin:0px;'>수정</button></td>";
         out+=" <td style='text-align:center' class='price'>"+price1+"원</td>";
         out+=" <td style='text-align:center; color:#DA6464;'>"+totalprice1+"원</td>";
         out+=" <td style='text-align:center'>"+'없음'+"</td>";
         out+=" <td style='text-align:center'><button type='button' class='order_confirm button btn_red h25 m20' style='margin-right:10px; margin-top:0px; margin-left:10px'>주문하기</button><button type='button' class='delete_confirm button btn_blue h25 m20' style='margin-top:0px; margin-left:0px; margin-right:0px'>삭제</button></td>";
         out+=" </tr>";
         }
         for(var i=0; i<data.listdt.length; i++){
        	 var departCode=data.listdt[i].departCode;
			 var wishCode=data.listdt[i].wishCode;
             var amount=data.listdt[i].amount;
             var price=data.listdt[i].price;
             var listNum = data.listdt[i].listNum;
	         var ticketName=data.listdt[i].ticketName;
	         var ticketdetailName=data.listdt[i].ticketdetailName;
             var amount1=data.listdt[i].amount1;
             var price1=data.listdt[i].price1;
             var totalprice1=data.listdt[i].totalprice1;
             totalprice+=(amount*price);
             out+=" <tr data-departCode="+departCode+" data-wishCode="+wishCode+" data-amount="+amount+" data-price="+price+">";
             out+=" <td style='text-align:center'>"+listNum+"</td>";
             out+=" <td style='text-align:center'><img src ='<%=cp%>/resources/images/bg-img/everland.jpeg' style='width:100px; height:100px;'></td>";
             out+=" <td style='text-align:center'><h6>"+ticketName+"/ "+ticketdetailName+"</h><br></td>";
             out+=" <td style='text-align:center'><input class='update_amount' style='border:none; width:45px' readonly='readonly' value="+amount1+"><button type='button' class='update_confirm button btn_blue h25 m20' style='margin:0px;'>수정</button></td>";
             out+=" <td style='text-align:center'>"+price1+"원</td>";
             out+=" <td style='text-align:center; color:#DA6464;'>"+totalprice1+"원</td>";
             out+=" <td style='text-align:center'>"+'없음'+"</td>";
             out+=" <td style='text-align:center'><button type='button' class='order_confirm button btn_red h25 m20' style='margin-right:10px; margin-top:0px; margin-left:10px'>주문하기</button><button type='button' class='delete_confirm button btn_blue h25 m20' style='margin-top:0px; margin-left:0px; margin-right:0px'>삭제</button></td>";
             out+=" </tr>";
         }

	         out+=" <tr style='border:2px solid;'>";
	         out+=" <td colspan='6' style='font-weight:bold; font-size:14px; text-align:center;'>"+'합&nbsp;&nbsp;계'+"</td>";
	         out+=" <td colspan='2' style='font-weight:bold; font-size:14px; text-align:center;'>"+(""+totalprice).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원</td>";
	         out+=" </tr>";
	         out+=" <tr style='border:none;'>";
	         out+=" <td colspan='6'></td>";
	         out+=" <td colspan='2' style='font-weight:bold; font-size:14px; text-align:center; border:none'><button type='button' class='Allorder_confirm button btn_red h30 m20' style='margin-right:10px'>전체 주문하기</button></td>";
	         out+=" </tr>";
         
      }
      $("#listWishBody").html(out);
   }
    
    $("body").on("click", ".delete_confirm",function(){
    	var departCode=$(this).closest("tr").attr("data-departCode");
    	var wishCode=$(this).closest("tr").attr("data-wishCode");
    	var query="departCode="+departCode+"&wishCode="+wishCode;
    	var url="<%=cp%>/myPage/wishlist/delete";
    	$.ajax({
    		type:"POST"
    		,url:url
    		,data:query
    		,dataType:"json"
    		,success:function(data){
    			var status=data.status;
    			layerShow('#popup');
				var title = $(".pop_wrap").find("h1"); 
				var content = $(".pop_wrap .pop_cont p:first-child");
				var btn = $(".pop_wrap .pop_cont p.t_center");
				
				title.html("Wishlist");
				content.html(status);
				listWish();
    		},
    		beforeSend:function(jqXHR){
    			jqXHR.setRequestHeader("AJAX", true);
    		},
    		error:function(jqXHR){
    			if(jqXHR.status==403){
    				location.href="<%=cp%>/member/login";
    				return;
    			}
    			console.log(jqXHR.responseText);
    		}
    	});
    });
    
    $("body").on("click", ".update_confirm",function(){
    	if($(this).siblings("input").attr("readonly")=='readonly'){//t수정눌러쓴데 read가 true. 인데 false
    		$(this).html("수정완료");
    		$(this).siblings("input").attr("readonly",false);
    		$(this).siblings("input").css("border","1px solid");
    	}else{
           	var amount=$(this).siblings("input").val();
        	var departCode=$(this).closest("tr").attr("data-departCode");
        	var wishCode=$(this).closest("tr").attr("data-wishCode");
        	var query="departCode="+departCode+"&amount="+amount+"&wishCode="+wishCode;
        	var url="<%=cp%>/myPage/wishlist/update";
        	$.ajax({
        		type:"POST"
        		,url:url
        		,data:query
        		,dataType:"json"
        		,success:function(data){
        			var status=data.status;
        			layerShow('#popup');
    				var title = $(".pop_wrap").find("h1"); 
    				var content = $(".pop_wrap .pop_cont p:first-child");
    				var btn = $(".pop_wrap .pop_cont p.t_center");
    				
    				title.html("Wishlist");
    				content.html(status);
    				listWish();
        		},
        		beforeSend:function(jqXHR){
        			jqXHR.setRequestHeader("AJAX", true);
        		},
        		error:function(jqXHR){
        			if(jqXHR.status==403){
        				location.href="<%=cp%>/member/login";
        				return;
        			}
        			console.log(jqXHR.responseText);
        		}
        	});   		
    	}
    });
    
    $("body").on("click", ".order_confirm", function(){
    	var wishCode=$(this).closest("tr").attr("data-wishCode");
    	var departCode=$(this).closest("tr").attr("data-departCode");
		var query="?wishCode="+wishCode+"&departCode="+departCode;
        	 location.href="<%=cp%>/payment/orderMenu"+query;	
    });
    $("body").on("click", ".Allorder_confirm", function(){
        	 location.href="<%=cp%>/payment/AllorderMenu";	
    });
</script>

<!-- 지역상세정보(Top) -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/travel/main/top02.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-end">
            <div class="col-12">
                <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                	<h2 class="page-title">장바구니</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //지역상세정보(Top) -->

<!-- Blog Area Start -->
    <div class="container" style="margin-top:100px; margin-bottom:100px">
      <h3 style="text-align:center; padding-bottom:20px">My Wish List</h3>
      <table class="table left_tbl">
      <colgroup>
         <col style="width:5%"/>
         <col />
         <col />
         <col />
         <col style="width:10%"/>
         <col style="width:10%"/>
         <col style="width:10%"/>
         <col style="width:20%"/>    
      </colgroup>
         <tr style="border-bottom:2px solid">
            <td style="text-align:center; font-weight: bold;">번호</td>
            <td colspan="2" style="text-align:center; font-weight: bold;">상품명</td>
            <td style="text-align:center; font-weight: bold;">수량</td>
            <td style="text-align:center; font-weight: bold;">상품금액</td>
            <td style="text-align:center; font-weight: bold;">소계금액</td>
            <td style="text-align:center; font-weight: bold;">배송비</td>
            <td style="text-align:center; font-weight: bold;">주문</td>
         </tr>
            <tbody id="listWishBody"></tbody>
            </table>
            <table class="table left_tbl">
               <tr>
                  <tr>
               </tr>
            </table>
         <c:if test="">
                   <div class="t_center mt40 mb40">
                      <span class="f14 exbold">등록된 상품이 없습니다.</span>
                   </div>
            </c:if> 
        </div>