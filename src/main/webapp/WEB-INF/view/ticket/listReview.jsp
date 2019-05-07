<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<div class="col-12 col-lg-8">
	<!-- Room Review -->
	<div class="room-review-area mb-100">
		<h4>상품 후기</h4>

		<!-- Single Review Area -->
<c:forEach var="vo" items="${listReview}">	
		<div class="single-room-review-area d-flex align-items-center">
			<div class="reviwer-thumbnail">
				<img alt="" src="<%=cp%>/resources/images/bg-img/53.jpg">
			</div>
			<div class="reviwer-content">
				<div
					class="reviwer-title-rating d-flex align-items-center justify-content-between">
					<div class="reviwer-title">
						<span>${vo.created}</span>
						<h6>${vo.userName}</h6>
					</div>
					<div class="reviwer-rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>
				</div>
				<p>${vo.content}</p>
			</div>
		</div>
</c:forEach>
	<nav class="roberto-pagination"> 
                  <table style="width: 100%; margin: 10px auto 50px; border-spacing: 0px;">
		  			<tr height="40">
						<td align="center" style="padding-top:30px;">
		        			${reviewCount==0 ? "등록된 후기가 없습니다." : paging}
						</td>
		   			</tr>
				</table>
	</nav> 

	</div>
</div>
	
