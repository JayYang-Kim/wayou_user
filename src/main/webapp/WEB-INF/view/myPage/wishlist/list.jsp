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
			<c:forEach var="dto" items="${list3}">
				<tr>
					<td style="text-align:center">${dto.listNum}</td>
					<td style="text-align:center">상품명</td>
					<td style="text-align:center">${dto.amount}</td>
					<td style="text-align:center">${dto.price1}원</td>
					<td style="text-align:center; color:#DA6464;">${dto.totalprice}원</td>
					<td style="text-align:center">없음</td>
				</tr>
			</c:forEach>
			<c:forEach var="dto" items="${list2}">
				<tr>
					<td style="text-align:center">${dto.listNum}</td>
					<td style="text-align:center">상품명</td>
					<td style="text-align:center">${dto.amount}</td>
					<td style="text-align:center">${dto.price1}원</td>
					<td style="text-align:center; color:#DA6464;">${dto.totalprice}원</td>
					<td style="text-align:center">없음</td>
				</tr>
			</c:forEach>
			<c:forEach var="dto" items="${list1}">
				<tr>
					<td style="text-align:center">${dto.listNum}</td>
					<td style="text-align:center">상품명</td>
					<td style="text-align:center">${dto.amount}</td>
					<td style="text-align:center">${dto.price1}원</td>
					<td style="text-align:center; color:#DA6464;">${dto.totalprice}원</td>
					<td style="text-align:center">없음</td>
				</tr>
			</c:forEach>
				</table>
				<table class="table left_tbl">
					<tr>
						<tr>
					</tr>
				</table>
			<c:if test="${dataCount==0}">
                	<div class="t_center mt40 mb40">
                		<span class="f14 exbold">등록된 상품이 없습니다.</span>
                	</div>
            </c:if> 
        </div>
