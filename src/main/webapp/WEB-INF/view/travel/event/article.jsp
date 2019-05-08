<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div class="breadcrumb-area bg-img bg-overlay jarallax"
	style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcrumb-content text-center">
					<h2 class="page-title">이벤트</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Area End -->

<!-- Blog Area Start -->
<div class="roberto-news-area section-padding-100-0">
	<div class="container">
		<div class="eventView">
					<div class="viewTop">
						<p class="tit">5월은 5직 매직데이! 렌탈하고 효도선물도 받기!</p>
						<div class="info">
							<span>
								<em class="flag bk">D - 23</em>
								2019.05.07 ~ 2019.05.31
							</span>
						</div>
						<div class="right">
							<span class="share tooltip click">
								<button type="button">공유</button>
								<span class="layer">
									<a href="#share" onclick="share('url'); return false;" class="url">URL</a>
		                            <a href="#share" onclick="share('naver'); return false;" class="blog">블로그</a>
		                            <a href="#share" onclick="share('facebook'); return false;" class="facebook">페이스북</a>
		                            <a href="#share" onclick="share('kakaostory'); return false;" class="kakaoStory">카카오 스토리</a>
		                            <a href="#share" onclick="share('kakaotalk'); return false;" class="kakaoTalk">카카오톡</a>
								</span>
							</span>
						</div>
					</div>
					<div class="viewCont">
						<div class="promInfo top">
							<img src="/asset/images/event/201904/loveFamily_top.jpg" alt="">
						</div>
						<!-- NEW -->
						<div>
							<div class="promInfo list01">
								<img src="/asset/images/event/201904/loveFamily_01.jpg" alt="">

								<p class="btn01 tlink01">
									<a href="/goods/indexGoodsDetail?goodsId=G000056779" class="btnGoodsDetail">자세히보기</a> 
									<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000056779" data-prdt-cd="WPUA900CREWH">주문/상담하기</a>
								</p>
								<p class="btn01 tlink02">
									<a href="/goods/indexGoodsDetail?goodsId=G000056780" class="btnGoodsDetail">자세히보기</a> 
									<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000056780" data-prdt-cd="WPUA800CREWH">주문/상담하기</a>
								</p>
								<p class="btn01 tlink03">
									<a href="/goods/indexGoodsDetail?goodsId=G000056781" class="btnGoodsDetail">자세히보기</a> 
									<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000056781" data-prdt-cd="WPUA410CREWH">주문/상담하기</a>
								</p>
								<p class="btn01 tlink04">
									<a href="/goods/indexGoodsDetail?goodsId=G000056782" class="btnGoodsDetail">자세히보기</a> 
									<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000056782" data-prdt-cd="WPUA310CREWH">주문/상담하기</a>
								</p>
								<p class="btn01 tlink05">
									<a href="/goods/indexGoodsDetail?goodsId=G000056783" class="btnGoodsDetail">자세히보기</a> 
									<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000056783" data-prdt-cd="WPUA220CREWH">주문/상담하기</a>
								</p>

								<div class="tableBox">
									<div class="table-swiper-info">
										<div class="slideTable">
											<h4>(의무사용기간 5년 / 계약기간 5년 기준)</h4>
											<table>
												<caption>의무사용기간 5년 / 계약기간 5년 기준</caption>
												<colgroup>
													<col style="width: *;">
													<col style="width: 150px;">
													<col style="width: 150px;">
													<col style="width: 150px;">
													<col style="width: 150px;">
													<col style="width: 150px;">
												</colgroup>
												<tbody>
													<tr>
														<th></th>
														<th><span>WPUA900C</span></th>
														<th><span>WPUA800C</span></th>
														<th><span>WPUA410C</span></th>
														<th><span>WPUA310C</span></th>
														<th><span>WPUA220C</span></th>
													</tr>
													<tr>
														<td class="bg01">기준 렌탈료</td>
														<td class="txt01">월 26,900원</td>
														<td class="txt01">월 24,900원</td>
														<td class="txt01">월 32,900원</td>
														<td class="txt01">월 30,900원</td>
														<td class="txt01">월 31,900원</td>
													</tr>
													<tr>
														<td class="bg01">특별 할인</td>
														<td class="txt01">월 4,000원</td>
														<td class="txt01">월 4,000원</td>
														<td class="txt01">월 4,000원</td>
														<td class="txt01">월 4,000원</td>
														<td class="txt01">월 4,000원</td>
													</tr>
													<tr>
														<td class="bg02">할인 렌탈료</td>
														<td class="txt02">월 22,900원</td>
														<td class="txt02">월 20,900원</td>
														<td class="txt02">월 28,900원</td>
														<td class="txt02">월 26,900원</td>
														<td class="txt02">월 27,900원</td>
													</tr>
													<tr>
														<td class="bg02">제휴 신용카드 할인 시</td>
														<td class="txt02">월 9,900원</td>
														<td class="txt02">월 7,900원</td>
														<td class="txt02">월 15,900원</td>
														<td class="txt02">월 13,900원</td>
														<td class="txt02">월 14,900원</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- BEST -->
						<div>
							<div class="promInfo list02">
								<img src="/asset/images/event/201904/loveFamily_02.jpg" alt="">

								<p class="btn01 tlink01">
									<a href="/goods/indexGoodsDetail?goodsId=G000021043" class="btnGoodsDetail">자세히보기</a> 
									<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000021043" data-prdt-cd="WPUA700CRERO">주문/상담하기</a>
								</p>
								<p class="btn01 tlink02">
									<a href="/goods/indexGoodsDetail?goodsId=G000021044" class="btnGoodsDetail">자세히보기</a> 
									<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000021044" data-prdt-cd="WPUA700CRESL">주문/상담하기</a>
								</p>
								<p class="btn01 tlink03">
									<a href="/goods/indexGoodsDetail?goodsId=G000021049" class="btnGoodsDetail">자세히보기</a> 
									<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000021049" data-prdt-cd="WPUI200CREWH">주문/상담하기</a>
								</p>
								<p class="btn01 tlink04">
									<a href="/goods/indexGoodsDetail?goodsId=G000021037" class="btnGoodsDetail">자세히보기</a> 
									<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000021037" data-prdt-cd="ACL140MASKSL">주문/상담하기</a>
								</p>
								<p class="btn01 tlink05">
									<a href="/goods/indexGoodsDetail?goodsId=G000021040" class="btnGoodsDetail">자세히보기</a> 
									<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000021040" data-prdt-cd="BIDS32DR47WH">주문/상담하기</a>
								</p>

								<div class=" tableBox">
									<div class="table-swiper-info">
										<div class="slideTable">
											<h4>(의무사용기간 5년 / 계약기간 5년 기준)</h4>
											<table>
												<caption>의무사용기간 5년 / 계약기간 5년 기준</caption>
												<colgroup>
													<col style="width: *;">
													<col style="width: 150px;">
													<col style="width: 150px;">
													<col style="width: 150px;">
													<col style="width: 150px;">
													<col style="width: 150px;">
												</colgroup>
												<tbody>
													<tr>
														<th></th>
														<th><span>WPUA700C(RO)</span></th>
														<th><span>WPUA700C(SL)</span></th>
														<th><span>WPUI200C</span></th>
														<th><span>ACL140MA</span></th>
														<th><span>BIDS32</span></th>
													</tr>
													<tr>
														<td class="bg01">기준 렌탈료</td>
														<td class="txt01">월 36,900원</td>
														<td class="txt01">월 36,900원</td>
														<td class="txt01">월 49,900원</td>
														<td class="txt01">월 37,900원</td>
														<td class="txt01">월 24,900원</td>
													</tr>
													<tr>
														<td class="bg01">특별 할인</td>
														<td class="txt01">월 4,000원</td>
														<td class="txt01">월 4,000원</td>
														<td class="txt01">월 4,000원</td>
														<td class="txt01">월 4,000원</td>
														<td class="txt01">월 4,000원</td>
													</tr>
													<tr>
														<td class="bg02">특별 할인<strong>(+10% 할인 적용 시)</strong></td>
														<td class="txt02">월 29,610원</td>
														<td class="txt02">월 29,610원</td>
														<td class="txt02">월 41,310원</td>
														<td class="txt02">월 30,510원</td>
														<td class="txt02">월 18,810원</td>
													</tr>
													<tr>
														<td class="bg02">제휴 신용카드 할인 시</td>
														<td class="txt02">월 16,610원</td>
														<td class="txt02">월 16,610원</td>
														<td class="txt02">월 28,310원</td>
														<td class="txt02">월 17,510원</td>
														<td class="txt02">월 5,810원</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

							<!-- 가족사랑 패키지 1 -->
							<div>
								<div class="promInfo  list03">
									<img src="/asset/images/event/201904/loveFamily_03.jpg" alt="">

									<p class="btn02 tlink03">
										<a href="/goods/indexGoodsDetail?goodsId=G000056781" class="btnGoodsDetail">자세히보기</a> 
										<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000056781" data-prdt-cd="WPUA410CREWH" data-package-id="G000056738" data-package-cd="ACL130Z0SKBR">주문/상담하기</a>
										<a href="/goods/indexGoodsDetail?goodsId=G000056738" class="btnGoodsDetail">자세히보기</a>
									</p>

									<div class="tableBox">
										<div class="table-swiper-data">
											<div class="bx-wrapper" style="max-width: 100%;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 268px;"><ul class="table-bxslider-data" style="width: 515%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>5년 의무 사용기간 계약 시</h4>
														<table>
															<caption>5년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA410C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 28,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 46,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 26,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 42,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 29,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>4년 의무 사용기간 계약 시</h4>
														<table>
															<caption>4년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA410C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>

																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 30,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 48,800원</td>
																</tr>
																<tr>

																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 28,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 44,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 31,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>3년 의무 사용기간 계약 시</h4>
														<table>
															<caption>3년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA410C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 32,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 50,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 30,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 46,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 33,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
											</ul></div><div class="bx-controls bx-has-pager bx-has-controls-direction"><div class="bx-pager bx-default-pager"><div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link active">1</a></div><div class="bx-pager-item"><a href="" data-slide-index="1" class="bx-pager-link">2</a></div><div class="bx-pager-item"><a href="" data-slide-index="2" class="bx-pager-link">3</a></div></div><div class="bx-controls-direction"><a class="bx-prev disabled" href="">Prev</a><a class="bx-next" href="">Next</a></div></div></div>
										</div>
									</div>
								</div>
							</div>

							<!-- 가족사랑 패키지 2 -->
							<div>
								<div class="promInfo list04">
									<img src="/asset/images/event/201904/loveFamily_04.jpg" alt="">

									<p class="btn02 tlink04">
										<a href="/goods/indexGoodsDetail?goodsId=G000056782" class="btnGoodsDetail">자세히보기</a> 
										<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000056782" data-prdt-cd="WPUA310CREWH" data-package-id="G000056738" data-package-cd="ACL130Z0SKBR">주문/상담하기</a>
										<a href="/goods/indexGoodsDetail?goodsId=G000056738" class="btnGoodsDetail">자세히보기</a>
									</p>

									<div class="tableBox">
										<div class="table-swiper-data">
											<div class="bx-wrapper" style="max-width: 100%;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 268px;"><ul class="table-bxslider-data" style="width: 515%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>5년 의무 사용기간 계약 시</h4>
														<table>
															<caption>5년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA310C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 26,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 44,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 24,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 40,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 27,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>4년 의무 사용기간 계약 시</h4>
														<table>
															<caption>4년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA310C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 28,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 46,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 26,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 42,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 29,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>3년 의무 사용기간 계약 시</h4>
														<table>
															<caption>3년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA310C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 30,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 48,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 28,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 44,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 31,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
											</ul></div><div class="bx-controls bx-has-pager bx-has-controls-direction"><div class="bx-pager bx-default-pager"><div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link active">1</a></div><div class="bx-pager-item"><a href="" data-slide-index="1" class="bx-pager-link">2</a></div><div class="bx-pager-item"><a href="" data-slide-index="2" class="bx-pager-link">3</a></div></div><div class="bx-controls-direction"><a class="bx-prev disabled" href="">Prev</a><a class="bx-next" href="">Next</a></div></div></div>
										</div>
									</div>
								</div>
							</div>

							<!-- 가족사랑 패키지 3 -->
							<div>
								<div class="promInfo list05">
									<img src="/asset/images/event/201904/loveFamily_05.jpg" alt="">

									<p class="btn02 tlink05">
										<a href="/goods/indexGoodsDetail?goodsId=G000056783" class="btnGoodsDetail">자세히보기</a> 
										<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000056783" data-prdt-cd="WPUA220CREWH" data-package-id="G000056738" data-package-cd="ACL130Z0SKBR">주문/상담하기</a>
										<a href="/goods/indexGoodsDetail?goodsId=G000056738" class="btnGoodsDetail">자세히보기</a>
									</p>

									<div class="tableBox">
										<div class="table-swiper-data">
											<div class="bx-wrapper" style="max-width: 100%;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 268px;"><ul class="table-bxslider-data" style="width: 515%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>5년 의무 사용기간 계약 시</h4>
														<table>
															<caption>5년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA220C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 27,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 45,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 25,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 41,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 28,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>4년 의무 사용기간 계약 시</h4>
														<table>
															<caption>4년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA220C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 29,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 47,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 27,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 43,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 30,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>3년 의무 사용기간 계약 시</h4>
														<table>
															<caption>3년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA220C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 31,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 49,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 29,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 45,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 32,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
											</ul></div><div class="bx-controls bx-has-pager bx-has-controls-direction"><div class="bx-pager bx-default-pager"><div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link active">1</a></div><div class="bx-pager-item"><a href="" data-slide-index="1" class="bx-pager-link">2</a></div><div class="bx-pager-item"><a href="" data-slide-index="2" class="bx-pager-link">3</a></div></div><div class="bx-controls-direction"><a class="bx-prev disabled" href="">Prev</a><a class="bx-next" href="">Next</a></div></div></div>
										</div>
									</div>
								</div>
							</div>

							<!-- 가족사랑 패키지 4 -->
							<div>
								<div class="promInfo list06">
									<img src="/asset/images/event/201904/loveFamily_06.jpg" alt="">

									<p class="btn02 tlink06">
										<a href="/goods/indexGoodsDetail?goodsId=G000056780" class="btnGoodsDetail">자세히보기</a> 
										<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000056780" data-prdt-cd="WPUA800CREWH" data-package-id="G000056738" data-package-cd="ACL130Z0SKBR">주문/상담하기</a>
										<a href="/goods/indexGoodsDetail?goodsId=G000056738" class="btnGoodsDetail">자세히보기</a>
									</p>

									<div class="tableBox">
										<div class="table-swiper-data">
											<div class="bx-wrapper" style="max-width: 100%;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 268px;"><ul class="table-bxslider-data" style="width: 515%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>5년 의무 사용기간 계약 시</h4>
														<table>
															<caption>5년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th class="le">직수정수기<span>WPUA800C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 20,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 38,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 18,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 34,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 21,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>4년 의무 사용기간 계약 시</h4>
														<table>
															<caption>4년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA800C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 22,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 40,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 20,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 36,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 23,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>3년 의무 사용기간 계약 시</h4>
														<table>
															<caption>3년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA800C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 24,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 42,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 22,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 38,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 25,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
											</ul></div><div class="bx-controls bx-has-pager bx-has-controls-direction"><div class="bx-pager bx-default-pager"><div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link active">1</a></div><div class="bx-pager-item"><a href="" data-slide-index="1" class="bx-pager-link">2</a></div><div class="bx-pager-item"><a href="" data-slide-index="2" class="bx-pager-link">3</a></div></div><div class="bx-controls-direction"><a class="bx-prev disabled" href="">Prev</a><a class="bx-next" href="">Next</a></div></div></div>
										</div>
									</div>
								</div>
							</div>

							<!-- 가족사랑 패키지 5 -->
							<div>
								<div class="promInfo list07">
									<img src="/asset/images/event/201904/loveFamily_07.jpg" alt="">

									<p class="btn02 tlink07">
										<a href="/goods/indexGoodsDetail?goodsId=G000056779" class="btnGoodsDetail">자세히보기</a> 
										<a href="#layConsult" class="btnLayerEvent" data-goods-id="G000056779" data-prdt-cd="WPUA900CREWH" data-package-id="G000056738" data-package-cd="ACL130Z0SKBR">주문/상담하기</a>
										<a href="/goods/indexGoodsDetail?goodsId=G000056738" class="btnGoodsDetail">자세히보기</a>
									</p>

									<div class="tableBox">
										<div class="table-swiper-data">
											<div class="bx-wrapper" style="max-width: 100%;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 268px;"><ul class="table-bxslider-data" style="width: 515%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>5년 의무 사용기간 계약 시</h4>
														<table>
															<caption>5년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA900C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 22,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 40,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 20,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 36,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 23,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>4년 의무 사용기간 계약 시</h4>
														<table>
															<caption>4년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA900C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 24,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 42,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 22,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 38,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 25,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
												<li class="" style="float: left; list-style: none; position: relative; width: 672px;">
													<div class="slideTable">
														<h4>3년 의무 사용기간 계약 시</h4>
														<table>
															<caption>3년 의무 사용기간 계약 시</caption>
															<colgroup>
																<col style="width: *;">
																<col style="width: 150px;">
																<col style="width: 150px;">
																<col style="width: 150px;">
															</colgroup>
															<tbody>
																<tr>
																	<th></th>
																	<th>직수정수기<span>WPUA900C</span></th>
																	<th>코어 공기청정기<span>ACL130Z</span></th>
																	<th>합계</th>
																</tr>
																<tr>
																	<td class="bg01">기준 렌탈료</td>
																	<td class="txt01">월 26,900원</td>
																	<td class="txt01">월 17,900원</td>
																	<td class="txt01">월 44,800원</td>
																</tr>
																<tr>
																	<td class="bg02">패키지 렌탈 할인 시</td>
																	<td class="txt02">월 24,900원</td>
																	<td class="txt02">월 15,900원</td>
																	<td class="txt02">월 40,800원</td>
																</tr>
																<tr>
																	<td class="bg02">제휴 신용카드 할인 시</td>
																	<td class="txt02"></td>
																	<td class="txt02 bl-no"></td>
																	<td class="txt02 bl-no">월 27,800원</td>
																</tr>
															</tbody>
														</table>
													</div>
												</li>
											</ul></div><div class="bx-controls bx-has-pager bx-has-controls-direction"><div class="bx-pager bx-default-pager"><div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link active">1</a></div><div class="bx-pager-item"><a href="" data-slide-index="1" class="bx-pager-link">2</a></div><div class="bx-pager-item"><a href="" data-slide-index="2" class="bx-pager-link">3</a></div></div><div class="bx-controls-direction"><a class="bx-prev disabled" href="">Prev</a><a class="bx-next" href="">Next</a></div></div></div>
										</div>
									</div>
								</div>
							</div>

							<div class="promInfo footer">
								<img src="/asset/images/event/201904/loveFamily_f.jpg" alt="">
								<a href="/event/indexEventDetail?eventNo=391" class="tlink01">후기에젠트</a> 
								<a href="/event/indexEventDetail?eventNo=828" class="tlink02">제휴카드</a>
							</div>
						</div>
					</div>
					<div class="btnArea">
						<a class="btnb bk" href="#"><span>목록</span></a>
					</div>

					<h3 class="borno">진행중인 이벤트</h3>
					<div class="eventSlide">
						<!-- slide -->
						<div class="slideWrap">
							<div class="bx-wrapper" style="max-width: 1180px; margin: 0px auto;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 170px;"><ul class="slideArea" style="width: 1115%; position: relative; transition-duration: 0s; transform: translate3d(-1220px, 0px, 0px);"><li style="float: left; list-style: none; position: relative; width: 590px;" class="bx-clone">
										<a class="banner" href="/event/indexEventDetail?eventNo=828"><img alt="SK매직 제휴 신용카드 혜택 안내" src="https://image.skmagic.com/skmagic/image/event/828/828_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li><li style="float: left; list-style: none; position: relative; width: 590px;" class="bx-clone">
										<a class="banner" href="/event/indexEventDetail?eventNo=529"><img alt="다이렉트 렌탈 경험하고 포인트와 사은품 혜택까지!!" src="https://image.skmagic.com/skmagic/image/event/529/529_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li>
								
									
									<li style="float: left; list-style: none; position: relative; width: 590px;">
										<a class="banner" href="/event/indexEventDetail?eventNo=1088"><img alt="5월은 5직 매직데이! 렌탈하고 효도선물도 받기!" src="https://image.skmagic.com/skmagic/image/event/1088/1088_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li>
									
									<li style="float: left; list-style: none; position: relative; width: 590px;">
										<a class="banner" href="/event/indexEventDetail?eventNo=1048"><img alt="SK매직과 함께하는 행복한 어린이날 이벤트" src="https://image.skmagic.com/skmagic/image/event/1048/1048_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li>
									
									<li style="float: left; list-style: none; position: relative; width: 590px;">
										<a class="banner" href="/event/indexEventDetail?eventNo=929"><img alt="브랜드 1위 SK매직 직수정수기 혜택 모음!" src="https://image.skmagic.com/skmagic/image/event/929/929_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li>
									
									<li style="float: left; list-style: none; position: relative; width: 590px;">
										<a class="banner" href="/event/indexEventDetail?eventNo=928"><img alt="사계절 필수품! SK매직 공기청정기 혜택 모음!" src="https://image.skmagic.com/skmagic/image/event/928/928_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li>
									
									<li style="float: left; list-style: none; position: relative; width: 590px;">
										<a class="banner" href="/event/indexEventDetail?eventNo=930"><img alt="5중 살균 케어 SK매직 비데 혜택 모음!" src="https://image.skmagic.com/skmagic/image/event/930/930_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li>
									
									<li style="float: left; list-style: none; position: relative; width: 590px;">
										<a class="banner" href="/event/indexEventDetail?eventNo=391"><img alt="제품후기 쓰고 10만원 상품권&amp;스타벅스 커피 받자!" src="https://image.skmagic.com/skmagic/image/event/391/391_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li>
									
									<li style="float: left; list-style: none; position: relative; width: 590px;">
										<a class="banner" href="/event/indexEventDetail?eventNo=1008"><img alt="SK매직 렌탈 고객을 위한 이달의 사은품" src="https://image.skmagic.com/skmagic/image/event/1008/1008_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li>
									
									<li style="float: left; list-style: none; position: relative; width: 590px;">
										<a class="banner" href="/event/indexEventDetail?eventNo=828"><img alt="SK매직 제휴 신용카드 혜택 안내" src="https://image.skmagic.com/skmagic/image/event/828/828_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li>
									
									<li style="float: left; list-style: none; position: relative; width: 590px;">
										<a class="banner" href="/event/indexEventDetail?eventNo=529"><img alt="다이렉트 렌탈 경험하고 포인트와 사은품 혜택까지!!" src="https://image.skmagic.com/skmagic/image/event/529/529_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li>
									
								
							<li style="float: left; list-style: none; position: relative; width: 590px;" class="bx-clone">
										<a class="banner" href="/event/indexEventDetail?eventNo=1088"><img alt="5월은 5직 매직데이! 렌탈하고 효도선물도 받기!" src="https://image.skmagic.com/skmagic/image/event/1088/1088_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li><li style="float: left; list-style: none; position: relative; width: 590px;" class="bx-clone">
										<a class="banner" href="/event/indexEventDetail?eventNo=1048"><img alt="SK매직과 함께하는 행복한 어린이날 이벤트" src="https://image.skmagic.com/skmagic/image/event/1048/1048_20_10.jpg" onerror="this.src='/asset/images/etc/no_img_590x170.png';"></a>
									</li></ul></div></div>
						</div>
						<div class="btnSlidePrev">
							<button class="prev">prev</button>
						</div>
						<div class="btnSlideNext">
							<button class="next">next</button>
						</div>
						<!-- //slide -->
					</div>
				</div>
	</div>
</div>
<!-- Blog Area End -->