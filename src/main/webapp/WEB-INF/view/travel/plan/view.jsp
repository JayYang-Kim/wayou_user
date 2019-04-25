<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.totMoney p {
	float: left;
	width: 100px;
}

.day_info_box {
	height: 60px;
	width: 100%;
}

.day_txt {
	float: left;
	background: #203341;
	height: 60px;
	line-height: 60px;
	color: white;
	font-weight: bold;
	font-size: 22px;
	min-width: 110px;
	width: 15%;
	text-align: center;
}

.day_info {
	float: left;
	min-width: 609px;
	background: white;
	border-top: 1px solid #e5e5e5;
	border-right: 1px solid #e5e5e5;
	height: 60px;
	width: 85%;
}

.day_info_left {
	float: left;
	width: 430px;
	padding-left: 10px;
}

.day_info_right {
	width: 172px;
	float: left;
	height: 60px;
	line-height: 60px;
	font-size: 16px;
	color: #555555;
	font-weight: bold;
	text-align: right;
	padding-right: 15px;
}

.day_info_box .date {
	font-size: 12px;
	color: #b3b3b3;
	font-weight: bold;
	padding-top: 5px;
}

.day_info_box .day_title {
	color: #363636;
	font-weight: bold;
	font-size: 18px;
	padding-top: 5px;
}

.day_route {
	min-height: 100px;
	border: 1px solid #e5e5e5;
}

.day_route_box {
	height: 60px;
	width: 100%;
}

.day_sch_box {
	width: 100%;
	border: 1px solid #e5e5e5;
	background: white;
	min-height: 100px;
}

.day_sch_num {
    height: 150px;
    text-align: center;
    float: left;
    width: 110px;
    line-height: 60px;
}

.sch_num {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    color: white;
    background: #223b68;
    margin: 0 auto;
    font-size: 18px;
    font-weight: bold;
    line-height: 32px;
    text-align: center;
    margin-top: 60px;
}

.sch_content {
    width: 300px;
    float: left;
    padding-top: 35px;
    height: 100%;
}

.spot_img {
	float: left;
	width: 70px;
	height: 70px;
}

.spot_content_box {
	width: 150px;
	float: left;
	padding-left: 10px;
}

.spot_name {
	font-size: 17px;
	color: #555555;
	font-weight: bold;
}

.spot_info {
	height: 41px;
	padding-top: 10px;
}

.btn_memo {
	font-weight: bold;
	font-size: 12px;
	color: #49b2e9;
	text-decoration: underline;
	cursor: pointer;
}

.spot_btn_box {
	width: 109px;
	float: left;
	height: 100%;
	padding-right: 15px;
	margin-top: 20px;
}

.spot_btn {
	float: right;
	margin-left: 15px;
	cursor: pointer;
}

.clear {
	clear: both;
}

.sch_add_content {
    width: 300px;
    padding-left: 0;
    padding-right: 15px;
    padding-top: 35px;
    padding-bottom: 20px;
    float: left;
}

.sch_price {
	color: #555555;
	font-size: 13px;
	font-weight: bold;
	padding-bottom: 20px;
}

.sch_memo {
	font-size: 13px;
	color: #808080;
	line-height: 18px;
}

.sch_memo_box {
	display: none;
}

.plan_info_box.nleft {
	padding-left: 0;
}

.memo_input {
	width: 420px;
	outline: none;
	resize: none;
	line-height: 18px;
	font-size: 13px;
	color: #808080;
	border: 1px solid #e5e5e5;
	float: left;
	height: 61px;
	padding: 10px;
}

.memo_save_btn {
	width: 65px;
	height: 31px;
	float: left;
	text-align: center;
	background: #ff9320;
	border: 1px solid #f7870f;
	color: white;
	font-size: 13px;
	line-height: 31px;
	cursor: pointer;
	margin-left: 5px;
}
.landTag {
    background: #eee;
    border-radius: 3px 0 0 3px;
    color: #999;
    display: inline-block;
    height: 26px;
    line-height: 26px;
    padding: 0 20px 0 23px;
    position: relative;
    margin: 0 10px 10px 0;
    text-decoration: none;
    -webkit-transition: color 0.2s;
}
</style>
<script type="text/javascript">
</script>
<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax"
	style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcrumb-content text-left"
					style="color: white; padding-top: 90px;">
					<h5 style="padding-bottom: 20px;">${workspace.userName}의일정</h5>
					<h2 style="padding-bottom: 5px;">${workspace.subject}</h2>
					<h6 style="padding-bottom: 15px;">${workspace.startDay}~${workspace.endDay}(${workspace.dayCount}일)</h6>
					<div
						style="border: 1px solid white; padding: 10px 5px; width: 300px; height: 40px;"
						class="totMoney">
						<p style="width: 100px; text-align: center;">필요 경비 :</p>
						<p style="text-align: right; width: 130px;">10,000,000</p>
						<p style="width: 50px; text-align: center;">원</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Area End -->

<!-- Blog Area Start -->
<div class="roberto-news-area section-padding-100-0">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-9">
				<div class="day_info_box">
					<div class="day_txt">Day ${day}</div>
					<div class="day_info">
						<div class="day_info_left">
							<div class="date">2019.04.18 (목)</div>
							<div class="day_title">서울이랑당</div>
						</div>
						<div class="day_info_right">KRW 12,000</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>

				<c:forEach var="dto" items="${list}">
					<div class="day_sch_box">
							<div class="day_sch_num">
								<div class="sch_num">${dto.orderNum}</div>
							</div>
							<div class="sch_content" data-landCode="${dto.landCode}" data-workLandCode="${dto.workLandCode}">
								<img src="${dto.saveFileName}" alt="no image" class="spot_img">
								<div class="spot_content_box">
									<div class="spot_name" onclick="window.open('http://localhost:9090/wayou/travel');" style="cursor: pointer;">${dto.landName}</div>
									<div class="spot_info">
										<div class="landTag">${dto.tagName}</div>
					 					<div class="clear"></div>
									</div>
									<div class="btn_memo" onclick="memoOn();">메모&amp;예산수정</div>
								</div>
							</div>
							<div class="sch_add_content">
								<div class="sch_price" data-srl="1-1">KRW 10,000.00</div>
								<div class="sch_memo"
									data-full="안녕하세요ㅂㅈㄷ&nbsp;<span class='memo_more' data-op='min'>닫기</span>"
									data-min="안녕하세요ㅂㅈㄷ" data-srl="1-1">안녕하세요ㅂㅈㄷ</div>
								<div class="sch_memo_box" data-srl="1-1">
									<div class="plan_info_box nleft white">
										<div class="info_select">
											<select name="" class="currency sc" data-srl="1-1">
												<option data="KRW" value="KRW" style="color: #000">KRW</option>
												<option data="USD" value="USD" style="color: #000">USD</option>
												<option data="JPY" value="JPY" style="color: #000">JPY</option>
												<option data="NPR" value="NPR" style="color: #000">NPR</option></select>
										</div>
										<input type="text" class="price" value="10000.00" data-srl="1-1">
									</div>
									<textarea name="" id="" cols="30" rows="10" class="memo_input"
										data-srl="1-1">안녕하세요ㅂㅈㄷ</textarea>
									<div class="memo_save_btn" data-srl="1-1">저장</div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
				</c:forEach>

				<!-- Pagination -->
				<nav class="roberto-pagination wow fadeInUp mb-100"
					data-wow-delay="600ms">${paging}</nav>
			</div>
			<div class="col-12 col-lg-3"></div>
		</div>
	</div>
</div>
<!-- Blog Area End -->