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
			 var wishCode=data.listdh[i].wishCode;
	         var amount=data.listdh[i].amount;
	         var price=data.listdh[i].price;
	         var listNum = data.listdh[i].listNum;
	         var amount1=data.listdh[i].amount1;
	         var price1=data.listdh[i].price1;
	         var totalprice1=data.listdh[i].totalprice1;
	         totalprice+=(amount*price);
         
         out+=" <tr data-Type='1' data-wishCode="+wishCode+">";
         out+=" <td style='text-align:center'>"+listNum+"</td>";
         out+=" <td style='text-align:center'>"+'사진'+"</td>";
         out+=" <td style='text-align:center'>"+'상품명'+"</td>";
         out+=" <td style='text-align:center'><input class='upInput' style='border:none; width:45px' readonly='readonly' value="+amount1+"><button type='button' class='update_confirm button btn_blue h20 m20' style='margin-left:10px; margin-top:0px'>수정</button></td>";
         out+=" <td style='text-align:center'>"+price1+"원</td>";
         out+=" <td style='text-align:center; color:#DA6464;'>"+totalprice1+"원</td>";
         out+=" <td style='text-align:center'>"+'없음'+"</td>";
         out+=" <td style='text-align:center'><button type='button' class='order_confirm button btn_red h20 m20' style='margin-right:10px; margin-top:0px'>주문하기</button><button type='button' class='delete_confirm button btn_blue h20 m20' style='margin-top:0px'>삭제</button></td>";
         out+=" </tr>";
         }
         for(var i=0; i<data.listdt.length; i++){
			 var wishCode=data.listdt[i].wishCode;
             var amount=data.listdt[i].amount;
             var price=data.listdt[i].price;
             var listNum = data.listdt[i].listNum;
             var amount1=data.listdt[i].amount1;
             var price1=data.listdt[i].price1;
             var totalprice1=data.listdt[i].totalprice1;
             totalprice+=(amount*price);
             var totalprice2=(""+totalprice).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			alert(totalprice2);
             out+=" <tr data-Type='2' data-wishCode="+wishCode+">";
             out+=" <td style='text-align:center'>"+listNum+"</td>";
             out+=" <td style='text-align:center'>"+'사진'+"</td>";
             out+=" <td style='text-align:center'>"+'상품명'+"</td>";
             out+=" <td style='text-align:center'><input class='update_amount' style='border:none; width:45px' readonly='readonly' value="+amount1+"><button type='button' class='update_confirm button btn_blue h20 m20' style='margin-left:10px; margin-top:0px'>수정</button></td>";
             out+=" <td style='text-align:center'>"+price1+"원</td>";
             out+=" <td style='text-align:center; color:#DA6464;'>"+totalprice1+"원</td>";
             out+=" <td style='text-align:center'>"+'없음'+"</td>";
             out+=" <td style='text-align:center'><button type='button' class='order_confirm button btn_red h20 m20' style='margin-right:10px; margin-top:0px'>주문하기</button><button type='button' class='delete_confirm button btn_blue h20 m20' style='margin-top:0px'>삭제</button></td>";
             out+=" </tr>";
         }

	         out+=" <tr style='border:2px solid;'>";
	         out+=" <td colspan='6' style='font-weight:bold; font-size:14px; text-align:center;'>"+'합&nbsp;&nbsp;계'+"</td>";
	         out+=" <td colspan='2' style='font-weight:bold; font-size:14px; text-align:center;'>"+totalprice2+"원</td>";
	         out+=" </tr>";
	         out+=" <tr style='border:none;'>";
	         out+=" <td colspan='6'></td>";
	         out+=" <td colspan='2' style='font-weight:bold; font-size:14px; text-align:center; border:none'><button type='button' class='Allorder_confirm button btn_red h30 m20' style='margin-right:10px'>전체 주문하기</button></td>";
	         out+=" </tr>";
         
      }
      $("#listWishBody").html(out);
   }
    
    $("body").on("click", ".delete_confirm",function(){
    	var dataType=$(this).closest("tr").attr("data-Type");
    	var wishCode=$(this).closest("tr").attr("data-wishCode");
    	var query="dataType="+dataType+"&wishCode="+wishCode;
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
           	alert(amount);
        	var wishCode=$(".update_confirm").closest("tr").attr("data-wishCode");
        	var dataType=$(".update_confirm").closest("tr").attr("data-Type");
        	var query="dataType="+dataType+"&amount="+amount+"&wishCode="+wishCode;
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
</script>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/wishlist.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="breadcrumb-content text-center">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->

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