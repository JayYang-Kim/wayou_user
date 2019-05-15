<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
.dashBoard_box {
	position:relative;
	border:1px solid #d8d8d8;
	-webkit-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.13);
    -moz-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.13);
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.13);
}
.dashBoard_title{text-align:left;padding:15px;font-size:0.97em;letter-spacing:1.2px;text-transform:uppercase;background-color: #f5f6f8;border-bottom:1px solid #d8d8d8;color:#666666;}
.dashBoard_title h4{font-size:14px;}
.dashBoard_title .more{
	float:right;
	position:relative;
	top:1px;
	font-size:0.9em;
	color:#4c4c4c;
	cursor:pointer;
	-webkit-transition: all .3s ease-out;
    -moz-transition: all .3s ease-out;
    -ms-transition: all .3s ease-out;
    -o-transition: all .3s ease-out;
    transition: all .3s ease-out;
}
.dashBoard_title .more:hover,
.dashBoard_title .more a:hover{
	-webkit-transform: scale(1.1);
	-ms-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-o-transform: scale(1.1);
	transform: scale(1.1);
	color:#1e8fc6;
}
.dashBoard_title .date{float:right;position:relative;top:1px;font-size:0.9em;color:#4c4c4c;}
.dashBoard_contents{background-color:#fff;}
.dashBoard_contents ul > li{padding:11px;border-bottom:1px solid #d8d8d8;}
/* .dashBoard_contents ul > li:nth-last-child(1){border-bottom:none;} */
.dashBoard_contents ul > li a{display:block;}
.dashBoard_contents ul > li a .title{display:block;margin-bottom:5px;font-size:1.1em;color:#4c4c4c;text-overflow:ellipsis;white-space:nowrap;background:url(../images/common/img_notice_dot.gif) no-repeat 0 5px;overflow:hidden;}
.dashBoard_contents ul > li a .reg_user,
.dashBoard_contents ul > li a .date{color:#999;}
.dashBoard_contents ul > li.data_zero{text-align:center;height:341px;line-height:341px;}
</style>

<!-- 지역상세정보(Top) -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/travel/main/top02.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-end">
            <div class="col-12">
                <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                	<h2 class="page-title">마이페이지</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //지역상세정보(Top) -->

<!-- 마이페이지 -->
<div class="roberto-news-area section-padding-100-0">
    <div class="container">
        <div class="box_myPage row justify-content-center">
            <div class="col-12 col-lg-12">
                <div class="title mb20 pb15" style="border-bottom:1px solid #c4c4c4">
                	<h3>마이페이지</h3>
                </div>
                <!-- 최근 주문내역 -->
                <div class="row">
                	<div class="col-12 col-lg-12">
                		<div>
                			<div class="dashBoard_title mb20" style="background-color:#ffffff;">
	                            <h4>
	                                <span class="float_left'">최근 주문내역</span>
	                                <span id="aNoticeMore" class="more">더보기</span>
	                            </h4>
	                        </div>
                			<table class="tb_basic tb_hover">
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
                						<th>총합</th>
                					</tr>
                				</thead>
                				<tbody>
                					<tr>
                						<td>0000001</td>
                						<td>쌀밥왕(user)</td>
                						<td>에버랜드 자유이용권 - 성인</td>
                						<td>1(개)</td>
                						<td>택배</td>
                						<td>800,000(원)</td>
                					</tr>
                					<tr>
                						<td>0000001</td>
                						<td>쌀밥왕(user)</td>
                						<td>에버랜드 자유이용권 - 성인</td>
                						<td>1(개)</td>
                						<td>택배</td>
                						<td>800,000(원)</td>
                					</tr>
                					<tr>
                						<td>0000001</td>
                						<td>쌀밥왕(user)</td>
                						<td>에버랜드 자유이용권 - 성인</td>
                						<td>1(개)</td>
                						<td>택배</td>
                						<td>800,000(원)</td>
                					</tr>
                					<tr>
                						<td>0000001</td>
                						<td>쌀밥왕(user)</td>
                						<td>에버랜드 자유이용권 - 성인</td>
                						<td>1(개)</td>
                						<td>택배</td>
                						<td>800,000(원)</td>
                					</tr>
                					<tr>
                						<td>0000001</td>
                						<td>쌀밥왕(user)</td>
                						<td>에버랜드 자유이용권 - 성인</td>
                						<td>1(개)</td>
                						<td>택배</td>
                						<td>800,000(원)</td>
                					</tr>
                				</tbody>
                			</table>
                		</div>
                	</div>
                </div>
                <!-- //최근 주문내역 -->
                
                <!-- 회원등급 -->
                <div class="row">
                	<div class="col-12 col-lg-12">
                		<div class="mt30 mb30">
							<h4 class="title mb20 pb15 p15" style="font-size: 14px;letter-spacing: 1.2px;border-bottom:1px solid #c4c4c4">회원님의 등급</h4>
							<div class="pb15" style="border-bottom:1px solid #c4c4c4;text-align:center;letter-spacing:1.2px;font-size:16px;font-weight:bold;">
								<span>회원님의 등급은</span>
								<span><img src="<%=cp%>/resources/images/level-img/friends.png" style="width:50px; height:50px; border-bottom:none"></span>
								<span>"프렌즈"</span>
								<span>입니다.</span>
							</div>
						</div>
                	</div>
                </div>
                <!-- 회원등급 -->
                
                <!-- 문의사항 -->
                <div class="row">
                	<div class="col-12 col-lg-12">
                		<div class="mb30">
                			<div class="dashBoard_title mb20" style="background-color:#ffffff;">
	                            <h4>
	                                <span class="float_left'">문의사항</span>
	                                <span id="aNoticeMore" class="more">더보기</span>
	                            </h4>
	                        </div>
                			<table class="tb_basic tb_hover">
                				<colgroup>
                					<col style="width:5%">
                					<col style="width:20%">
                					<col style="width:10%">
                					<col style="width:8%">
                					<col style="width:5%">
                					<col style="width:5%">
                				</colgroup>
                				<thead>
                					<tr>
                						<th>No</th>
                						<th>제목</th>
                						<th>작성자</th>
                						<th>작성일</th>
                						<th>구분</th>
                						<th>답변상태</th>
                					</tr>
                				</thead>
                				<tbody>
                					<tr>
                						<td>1</td>
                						<td>티켓 구매했는데 어떻게 사용하나요?</td>
                						<td>쌀밥왕(user)</td>
                						<td>2019-05-14</td>
                						<td>티켓</td>
                						<td>미답변</td>
                					</tr>
                					<tr>
                						<td>1</td>
                						<td>티켓 구매했는데 어떻게 사용하나요?</td>
                						<td>쌀밥왕(user)</td>
                						<td>2019-05-14</td>
                						<td>티켓</td>
                						<td>미답변</td>
                					</tr>
                					<tr>
                						<td>1</td>
                						<td>티켓 구매했는데 어떻게 사용하나요?</td>
                						<td>쌀밥왕(user)</td>
                						<td>2019-05-14</td>
                						<td>티켓</td>
                						<td>미답변</td>
                					</tr>
                					<tr>
                						<td>1</td>
                						<td>티켓 구매했는데 어떻게 사용하나요?</td>
                						<td>쌀밥왕(user)</td>
                						<td>2019-05-14</td>
                						<td>티켓</td>
                						<td>미답변</td>
                					</tr>
                					<tr>
                						<td>1</td>
                						<td>티켓 구매했는데 어떻게 사용하나요?</td>
                						<td>쌀밥왕(user)</td>
                						<td>2019-05-14</td>
                						<td>티켓</td>
                						<td>미답변</td>
                					</tr>
                				</tbody>
                			</table>
                		</div>
                	</div>
                </div>
                <!-- //문의사항 -->
                
                <!-- 수정 / 탈퇴 -->
                <div class="t_center" style="margin-bottom:100px;">
                	<button class="btn_classic btn-black w140 h40" onclick="location.href='<%=cp%>/myPage/check'">수정 / 탈퇴</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //마이페이지 -->