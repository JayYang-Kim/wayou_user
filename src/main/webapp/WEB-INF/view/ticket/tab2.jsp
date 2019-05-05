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
						<td align='left'><span style='font-weight: bold;'>댓글쓰기</span><span>
								- 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span></td>
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

			<div class="col-12 col-lg-8">
				<!-- Room Review -->
				<div class="room-review-area mb-100">
					<h4>Room Review</h4>

					<!-- Single Review Area -->
					<div class="single-room-review-area d-flex align-items-center">
						<div class="reviwer-thumbnail">
							<img alt="" src="<%=cp%>/resources/images/bg-img/53.jpg">
						</div>
						<div class="reviwer-content">
							<div
								class="reviwer-title-rating d-flex align-items-center justify-content-between">
								<div class="reviwer-title">
									<span>27 Aug 2019</span>
									<h6>Brandon Kelley</h6>
								</div>
								<div class="reviwer-rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</div>
							<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit
								amet, consectetur, adipisci velit, sed quia non numquam eius
								modi tempora.</p>
						</div>
					</div>

					<!-- Single Review Area -->
					<div class="single-room-review-area d-flex align-items-center">
						<div class="reviwer-thumbnail">
							<img alt="" src="<%=cp%>/resources/images/bg-img/54.jpg">
						</div>
						<div class="reviwer-content">
							<div
								class="reviwer-title-rating d-flex align-items-center justify-content-between">
								<div class="reviwer-title">
									<span>27 Aug 2019</span>
									<h6>Sounron Masha</h6>
								</div>
								<div class="reviwer-rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</div>
							<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit
								amet, consectetur, adipisci velit, sed quia non numquam eius
								modi tempora.</p>
						</div>
					</div>

					<!-- Single Review Area -->
					<div class="single-room-review-area d-flex align-items-center">
						<div class="reviwer-thumbnail">
							<img alt="" src="<%=cp%>/resources/images/bg-img/55.jpg">
						</div>
						<div class="reviwer-content">
							<div
								class="reviwer-title-rating d-flex align-items-center justify-content-between">
								<div class="reviwer-title">
									<span>27 Aug 2019</span>
									<h6>Amada Lyly</h6>
								</div>
								<div class="reviwer-rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</div>
							<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit
								amet, consectetur, adipisci velit, sed quia non numquam eius
								modi tempora.</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
