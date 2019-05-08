<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<div class="roberto-rooms-area section-padding-100-0">
	<div class="container">
		<div class="row">
			<div>
				<table
					style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
					<tr height='30'>
						<td align='left'><span style='font-weight: bold;'>후기 작성하기</span></td>
					</tr>
					<tr>
					<div>

				<form name="ReviewForm" method="post">

					<div class="t_center mt30">
						<span style="display: inline-block; width: 20%;">기업 총 평점</span>
						<div class="p30" style="display: inline-block; width: 70%;">
						<c:if test="${dto.star==null}">
							<p class="star">					  
								<a href="#">★</a> 
								<a href="#">★</a> 
								<a href="#">★</a> 
								<a href="#">★</a> 
								<a href="#">★</a>
							</p>
						</c:if>
						<c:if test="${dto.star!=null}">
						<p class="star">
							<c:forEach var="dto" begin="1" end="${dto.star}">
								<a class="on" href="#">★</a> 
							</c:forEach>
							<c:forEach var="dto" begin="1" end="${5-dto.star}">
							
								<a href="#">★</a> 
							</c:forEach>
						</p>
						</c:if>
						</div>


						<input type="hidden" name="score" id="score" value="${dto.star}"
							readonly="readonly">


					</div>
					</tr>
					
					<tr>
						<td style='padding: 5px 5px 0px;'><textarea class='boxTA'
								style='width: 99%; height: 70px;'></textarea></td>
					</tr>
					<tr>
						<td align='right'>
							<button type='button' class='btn btnSendReview'
								style='padding: 10px 20px;'>후기 등록</button>
						</td>
					</tr>
				</table>

				<div id="listReview"></div>
			</div>
		</div>
	</div>
</div>
