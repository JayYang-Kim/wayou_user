<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!-- 회원등급(Top) -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/travel/main/top02.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-end">
            <div class="col-12">
                <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                	<h2 class="page-title">회원등급</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //회원등급(Top) -->

<!-- Blog Area Start -->
<div class="mt-50 mb-100">
	<div class="container">
		<div class="mb40">
			<h2 class="mb10">회원님의 등급</h2>
			<table class="table left_tbl">
				<tr>
					<c:if test="${sessionScope.member.roleCode==1}">
					<td style="font-size: 20px;padding:10px 0px 10px 300px">회원님의 등급은</td>
					<td style="border: none;text-align:center; width:100px;"><img src="<%=cp%>/resources/images/level-img/friends.png" style="width:50px; height:50px; border-bottom:none" ></td>
					<td style="text-align:center;border: none;font-size:20px;width:150px; font-weight: bold;" >'프렌즈'</td>
					</c:if>
					<c:if test="${sessionScope.member.roleCode==2}">
					<td style="font-size: 20px;padding:10px 0px 10px 300px">회원님의 등급은</td>
					<td style="border: none;text-align:center; width:100px;"><img src="<%=cp%>/resources/images/level-img/premium.png" style="width:50px; height:50px; border-bottom:none" ></td>
					<td style="text-align:center;border: none;font-size:20px;width:150px; font-weight: bold;" >'프리미엄'</td>
					</c:if>
					<c:if test="${sessionScope.member.roleCode==3}">
					<td style="font-size: 20px;padding:10px 0px 10px 300px">회원님의 등급은</td>
					<td style="border: none;text-align:center; width:100px;"><img src="<%=cp%>/resources/images/level-img/super.png" style="width:50px; height:50px; border-bottom:none" ></td>
					<td style="text-align:center;border: none;font-size:20px;width:150px; font-weight: bold;" >'슈퍼프리미엄'</td>
					</c:if>
					<c:if test="${sessionScope.member.roleCode==3}">
					<td style="font-size: 20px;padding:10px 0px 10px 300px">회원님의 등급은</td>
					<td style="border: none;text-align:center; width:100px;"><img src="<%=cp%>/resources/images/level-img/superplus.png" style="width:50px; height:50px; border-bottom:none" ></td>
					<td style="text-align:center;border: none;font-size:20px;width:150px; font-weight: bold;" >'슈퍼프리미엄플러스'</td>
					</c:if>															
					<td style="font-size: 20px;border: none;padding: 44px 11px;">입니다.</td>
				</tr>
			</table>
		</div>
		<div class="mb20">
			<div style="padding-bottom:20px">
			<h2>회원 등급 안내</h2>
			</div>
			<table>
				<tr>
					<td style="font-size:14px; padding-bottom:15px;" >
					* 회원 등급은 최근 1년간의 온라인 상품 금액 기준으로 선정되며, 선정일부터 1개월 동안 등급이 유지됩니다.<br>
					* 회원 등급별  혜택은 당사의 사정으로 변경될수 있습니다.
					</td>
				</tr>			
			</table>
			<table class="table left_tbl">
				<tr>
					<td style="width:200px; height:125px; padding-top:65px; text-align:center" >
						<img src="<%=cp%>/resources/images/level-img/superplus.png">
					</td>
					<td rowspan="2" style="padding:30px">
						<h5>최근 1년간 $5,000이상 구매 고객</h5><br>
						<h6><span>-</span>&nbsp;할인 혜택 최대 20%</h6><br>
						<h6><span>-</span>슈퍼프리미엄 플러스 등급 할인쿠폰 6종 & 적립금 15,000원 증정</h6><br>
						<h6><span>-</span>로그인시 매일 1회 별 100point 증정</h6><br>
						<h6><span>-</span>Hotels.com 최대 10% 할인</h6><br>
					</td>
				<tr>
					<td style="text-align:center; font-size:16px; border-top:none;">슈퍼프리미엄플러스</td>
				<tr>
				<tr>
					<td style="width:200px; height:125px; padding-top:65px; text-align:center" >
						<img src="<%=cp%>/resources/images/level-img/super.png">
					</td>
					<td rowspan="2" style="padding:30px">
						<h5>최근 1년간 $3,000 이상 구매 고객</h5><br>
						<h6><span>-</span>&nbsp;할인 혜택 최대 20%</h6><br>
						<h6><span>-</span>슈퍼프리미엄 등급 할인쿠폰 6종 & 적립금 10,000원 증정</h6><br>
						<h6><span>-</span>로그인시 매일 1회 별 80point 증정</h6><br>
						<h6><span>-</span>Hotels.com 최대 10% 할인</h6><br>
					</td>
				<tr>
					<td style="text-align:center; font-size:16px; border-top:none;">슈퍼프리미엄</td>
				<tr>
				<tr>
					<td style="width:200px; height:125px; padding-top:65px; text-align:center" >
						<img src="<%=cp%>/resources/images/level-img/premium.png">
					</td>
					<td rowspan="2" style="padding:30px">
						<h5>최근 1년간 $1,000 이상 구매 고객</h5><br>
						<h6><span>-</span>&nbsp;할인 혜택 최대 20%</h6><br>
						<h6><span>-</span>프리미엄 등급 할인쿠폰 5종 & 적립금 7,000원 증정</h6><br>
						<h6><span>-</span>로그인시 매일 1회 별 80point 증정</h6><br>
						<h6><span>-</span>Hotels.com 최대 7% 할인</h6><br>
					</td>
				<tr>
					<td style="text-align:center; font-size:16px; border-top:none;">프리미엄</td>
				<tr>
				<tr>
					<td style="width:200px; height:125px; padding-top:65px; text-align:center" >
						<img src="<%=cp%>/resources/images/level-img/friends.png">
					</td>
					<td rowspan="2" style="border-bottom:1px solid #dee2e6; padding:30px">
						<h5>신규 가입 고객</h5><br>
						<h6><span>-</span>&nbsp;할인 혜택 최대 10%</h6><br>
						<h6><span>-</span>프렌즈 등급 할인쿠폰 4종 & 적립금 5,000원 증정</h6><br>
						<h6><span>-</span>로그인시 매일 1회 별 30point 증정</h6><br>
						<h6><span>-</span>Hotels.com 최대 6% 할인</h6><br>
					</td>
				<tr>
					<td style="text-align:center; font-size:16px; border-top:none; border-bottom:1px solid #dee2e6">프렌즈</td>
				<tr>			
				</table>
		</div>
		
	</div>
</div>
<!-- Blog Area End -->