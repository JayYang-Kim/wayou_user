<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>

</style>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	   listWish();
	});

	function listWish(){
	   var url="<%=cp%>/myPage/wishlist/list";
	   $.ajax({
	      type:"GET",
	      url:url,
	      dataType:"json",
	      success:function(data){
	         printWish(data);
	      },beforeSend:function(jqXHR){
	         jqXHR.setRequestHeader("AJAX", true);
	      },error:function(x,e){ if(x.status==0){ alert('You are offline!!n Please Check Your Network.'); }else if(x.status==404){ alert('Requested URL not found.'); }else if(x.status==500){ alert('Internel Server Error.'); }else if(e=='parsererror'){ alert('Error.nParsing JSON Request failed.'); }else if(e=='timeout'){ alert('Request Time out.'); }else { alert('Unknow Error.n'+x.responseText); } }
	   });
	};

	   function printWish(data){
	      var dataCount=data.dataCount;
	      var out="";
	      
	   if(dataCount!=0){
	      for(var i=0; i<data.list1.length; i++){
	      var listNum = data.list1[i].listNum;
	      var amount=data.list1[i].amount;
	      var price=data.list1[i].price;
	      var totalprice=data.list1[i].totalprice;
	      
	      out+=" <tr>";
	      out+=" <td style='text-align:center'>"+listNum+"</td>";
	      out+=" <td style='text-align:center'>"+상품명+"</td>";
	      out+=" <td style='text-align:center'>"+amount+"</td>";
	      out+=" <td style='text-align:center'>"+price+"원</td>";
	      out+=" <td style='text-align:center; color:#DA6464;'>"+totalprice+"원</td>";
	      out+=" <td style='text-align:center'>"+없음+"</td>";
	      out+=" </tr>";
	      }
	   }
	   $("#listWishBody").html(out);
	}

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
			<col style="width:15%"/>
			<col />
			<col style="width:10%"/>
			<col />
			<col />
			<col style="width:20%"/>
		</colgroup>
			<tr style="border-bottom:2px solid">
				<td style="text-align:center; font-weight: bold;">번호</td>
				<td style="text-align:center; font-weight: bold;">상품명</td>
				<td style="text-align:center; font-weight: bold;">수량</td>
				<td style="text-align:center; font-weight: bold;">상품금액</td>
				<td style="text-align:center; font-weight: bold;">소계금액</td>
				<td style="text-align:center; font-weight: bold;">배송비</td>
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
