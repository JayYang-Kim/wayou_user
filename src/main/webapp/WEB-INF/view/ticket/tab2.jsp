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
				<h5 style="font-weight: bold; margin-bottom: 20px; margin-left: 15px;">후기 작성</h5>
			<div style="border: 2px solid #aaaaaa; padding: 40px 20px 0px 30px; margin: 0px 10px 10px 10px;">
			<div>
				<h6 style="font-weight: bold;">별점을 선택해주세요</h6>
				<c:if test="${dto.star==null}">
					<p class="star">					  
						<a href="#">★</a> 
						<a href="#">★</a> 
						<a href="#">★</a> 
						<a href="#">★</a> 
						<a href="#">★</a>
					</p>
				</c:if>

				<input type="hidden" name="score" id="score" value="${dto.star}">
			</div>
			
			
				<table style='width: 100%; margin: 15px auto 40px; border-spacing: 0px;'>
					<tr height='30'>
						<td align='left'><h6 style='font-weight: bold;'>후기를 작성해주세요</h6></td>
					</tr>
					<tr>
						<td style='padding: 5px 5px 0px;'><textarea class='boxTA'
								style='width: 99%; height: 70px;'></textarea></td>
					</tr>
					<tr>
						<td align="right">
							<button type="button" class="btn_classic btnSendReview"
								style="font-size: 15px; height: 30px; border-radius: 5px; margin-top: 20px; margin-right: 15px;">등록하기</button>
						</td>
					</tr>
				</table>
				</div>
				<div id="listReview"></div>
			</div>
		</div>
	</div>
</div>
