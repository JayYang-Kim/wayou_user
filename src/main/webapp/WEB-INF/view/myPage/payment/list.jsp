<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	
});

function searchList() {
	var f = document.searchForm;
	f.submit();
}
</script>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/travel/main/top02.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-end">
            <div class="col-12">
                <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                	<h2 class="page-title">주문내역</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->

<!-- Blog Area Start -->
<div class="roberto-news-area section-padding-100-0">
	<div class="container">
		<form name="search_form" action="<%=cp%>/travel/party" method="post">
			<div class="row justify-content-center box_search mb40">
				<div class="col-12 col-sm-3 col-lg-2">
	            	<select name="searchKey">
	            		<option value="orderCode" ${searchKey == 'orderCode' ? "selected='selected'" : ""}>주문번호</option>
	            		<option value="userId" ${searchKey == 'userId' ? "selected='selected'" : ""}>아이디</option>
	            	</select>
	            </div>
	            <div class="col-12 col-sm-9 col-lg-6">
	            	<input type="text" name="searchValue" class="form-control" value="${searchValue}" placeholder="검색어를 입력해주세요."/>
	            </div>
	            <div class="col-12 col-lg-4">
	            	<button type="button" class="btn roberto-btn" onclick="sendSearch()">검색</button>
	            	<button type="button" class="btn roberto-btn" onclick="location.href='<%=cp%>/myPage/payment'">새로고침</button>
	            </div>
			</div>
		</form>
		<div class="row justify-content-center">
			<div class="col-12 col-lg-12">
				<div>
					<table class="tb_basic">
         				<colgroup>
         					<col style="width:12%">
         					<col style="width:20%">
         					<col style="">
         					<col style="width:8%">
         					<col style="width:10%">
         					<col style="width:10%">
         				</colgroup>
         				<thead>
         					<tr>
         						<th>주문번호</th>
         						<th>주문자</th>
         						<th>제품명</th>
         						<th>수량</th>
         						<th>수령방법</th>
         						<th>금액</th>
         						<th>총합</th>
         					</tr>
         				</thead>
         				<tbody>
         					<tr>
         						<td rowspan="3">0000001</td>
         						<td>쌀밥왕(user)</td>
         						<td>에버랜드 자유이용권 - 성인</td>
         						<td>1(개)</td>
         						<td>택배</td>
         						<td>800,000(원)</td>
         						<td>800,000(원)</td>
         					</tr>
         					<tr>
         						<td>쌀밥왕(user)</td>
         						<td>에버랜드 자유이용권 - 성인</td>
         						<td>1(개)</td>
         						<td>택배</td>
         						<td>800,000(원)</td>
         						<td>800,000(원)</td>
         					</tr>
         					<tr>
         						<td>쌀밥왕(user)</td>
         						<td>에버랜드 자유이용권 - 성인</td>
         						<td>1(개)</td>
         						<td>택배</td>
         						<td>800,000(원)</td>
         						<td>800,000(원)</td>
         					</tr>
         					<tr>
         						<td>0000001</td>
         						<td>쌀밥왕(user)</td>
         						<td>에버랜드 자유이용권 - 성인</td>
         						<td>1(개)</td>
         						<td>택배</td>
         						<td>800,000(원)</td>
         						<td>800,000(원)</td>
         					</tr>
         					<tr>
         						<td>0000001</td>
         						<td>쌀밥왕(user)</td>
         						<td>에버랜드 자유이용권 - 성인</td>
         						<td>1(개)</td>
         						<td>택배</td>
         						<td>800,000(원)</td>
         						<td>800,000(원)</td>
         					</tr>
         					<tr>
         						<td>0000001</td>
         						<td>쌀밥왕(user)</td>
         						<td>에버랜드 자유이용권 - 성인</td>
         						<td>1(개)</td>
         						<td>택배</td>
         						<td>800,000(원)</td>
         						<td>800,000(원)</td>
         					</tr>
         					<tr>
         						<td>0000001</td>
         						<td>쌀밥왕(user)</td>
         						<td>에버랜드 자유이용권 - 성인</td>
         						<td>1(개)</td>
         						<td>택배</td>
         						<td>800,000(원)</td>
         						<td>800,000(원)</td>
         					</tr>
         					<tr>
         						<td>0000001</td>
         						<td>쌀밥왕(user)</td>
         						<td>에버랜드 자유이용권 - 성인</td>
         						<td>1(개)</td>
         						<td>택배</td>
         						<td>800,000(원)</td>
         						<td>800,000(원)</td>
         					</tr>
         					<tr>
         						<td>0000001</td>
         						<td>쌀밥왕(user)</td>
         						<td>에버랜드 자유이용권 - 성인</td>
         						<td>1(개)</td>
         						<td>택배</td>
         						<td>800,000(원)</td>
         						<td>800,000(원)</td>
         					</tr>
         					<tr>
         						<td>0000001</td>
         						<td>쌀밥왕(user)</td>
         						<td>에버랜드 자유이용권 - 성인</td>
         						<td>1(개)</td>
         						<td>택배</td>
         						<td>800,000(원)</td>
         						<td>800,000(원)</td>
         					</tr>
         					<c:if test="${empty list}">
								<tr>
	         						<td colspan="7" class="f14 exbold">결제 내역이 없습니다.</td>
	         					</tr>
							</c:if>
         				</tbody>
         			</table>
				</div>

				<!-- Pagination -->
				<nav class="roberto-pagination mb-100" style="margin-top:20px; text-align: center;">${paging}</nav>
			</div>
		</div>
	</div>
</div>
<!-- Blog Area End -->