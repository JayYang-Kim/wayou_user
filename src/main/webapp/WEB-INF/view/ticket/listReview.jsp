<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<div class="col-12 col-lg-12">
	<!-- Room Review -->
	<div class="room-review-area mt-100 mb-100">
		<h5 style="font-weight: bold; margin-bottom: 3px;">상품 리뷰</h5>
		<div><hr style="border: solid 1px #aaaaaa;"></div>

<c:forEach var="vo" items="${listReview}">
		<div class="single-room-review-area d-flex align-items-center">
			<div class="reviwer-thumbnail">
				<img alt="" src="<%=cp%>/resources/images/bg-img/53.jpg">
			</div>
			<div class="reviwer-content">
				<div>
					<div class="reviwer-title">
						<span>${vo.created}</span>
						<h6>${vo.userName}</h6>
					</div>
					<div>
                        <p class="star2">
                           <c:forEach var="dto" begin="1" end="${vo.star}">
                              <a class="on">★</a>
                           </c:forEach>
                        </p>
					</div>
					<div style="font-size: 20px;">${vo.content}</div>
				</div>
				
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
	
