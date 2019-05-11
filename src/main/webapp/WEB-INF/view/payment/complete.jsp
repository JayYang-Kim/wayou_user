<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
	.container.payment .title{margin-top:100px;margin-bottom:30px;padding-bottom:20px;border-bottom:1px solid #c4c4c4;}
</style>


<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);"></div>

<div class="container payment">
	<div class="row">
		<div class="title col-md-12">
			<h3>결제완료</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="order_complate">
				<div class="mt20 mb40 t_center">
					<h1><strong class="t_red">김아무개님</strong> <strong class="t_red">결제</strong>가 완료되었습니다.</h1>
				</div>
				<h5 class="cont_tit tit2">결제번호 <strong class="t_red">012345645</strong> <span class="f12 normal">2014년 2월 25일 13시 40분에 결제하신 결제 내역입니다.</span></h5>

				<table class="table mt10">
					<colgroup>			
						<col />
						<col style="width:100px" />
						<col style="width:120px" />
						<col style="width:120px" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">주문상품</th>
							<th scope="col">수량</th>
							<th scope="col">상품가격</th>
							<th scope="col">최종결제금액</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th scope="row" colspan="2" class="f14">합계</th>
							<td><strong class="f18">35,300</strong></td>
							<td><strong class="f20 t_red">30,000</strong></td>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td class="t_left">디즈니랜드 45박 46일 </td>
							<td class="t_gray">2</td>
							<td><strong>800,000</strong></td>
							<td><strong>1,600,000</strong></td>
						</tr>
					</tbody>
				</table>

				<h5 class="cont_tit tit2 mt40">결제방식</h5>
				<table class="table mt10">
					<caption>결제방식</caption>
					<colgroup>			
						<col style="width:150px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th class="t_right">주문자</th>
							<td class="t_gray t_left">김아무개</td>
						</tr>
						<tr>
							<th class="t_right">수령방법</th>
							<td class="t_gray t_left">모바일</td>
						</tr>
						<tr>
							<th class="t_right">결제수단</th>
							<td class="t_gray t_left"><strong class="t_blue">일반카드</strong></td>
						</tr>
						<tr>
							<th class="t_right">할부개월</th>
							<td class="t_gray t_left"><strong class="t_blue">3(개월)</strong></td>
						</tr>
						<tr>
							<th class="t_right">최종결제금액</th>
							<td class="t_gray t_left"><strong class="t_red">0원</strong></td>
						</tr>
					</tbody>
				</table>
				<p class="t_center mt30 mb50">
					<a href="<%=cp%>/travel" class="button btn_wht w200 h40">메인가기</a>
					<a href="#" class="button btn_blk w200 h40 ml10">주문 내역확인</a>
				</p>
			</div>
		</div>
	</div>
</div>