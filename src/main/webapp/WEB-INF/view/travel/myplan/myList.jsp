<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
	.routeItem {
		position:relative;
		float: left;
		height:200px;
		min-width:300px;
		max-width:30%;
		margin-left: 20px;
		margin-top: 20px;
		cursor: pointer; 
	}
	.routeItem:hover img{
		top:-50%;
	}
	
	.routeItem img {
		height: 100%;
		position: relative;
		z-index: 9999;
	}
	.routeItem p {
		position: absolute;
		bottom:0px;
		height: 100px;
		width:100%;
	}
	
	.lookup {
		top:-50%;
	}
	
	.myListContent {
		padding-top: 100px;
		-webkit-font-smoothing: antialiased;
	}
	
	.sidebar_title {
    font-family: 'Oswald', sans-serif;
    font-weight: 500;
    font-size: 24px;
    color: #181818;
    line-height: 0.75;
    }
    
    .sidebar_list {
    	margin-top: 55px;
    }
        
    .sidebar_list ul{
    	padding-left: 35px;
    }
    
    .sidebar_list ul li:not(:last-child) {
    	margin-bottom: 15px;
	}
	
	.sidebar_list ul li {
    	position: relative;
    	cursor : pointer;
	}
	
	.sidebar_list ul li:hover {
    	color: #e4e4e4;
	}
	.sidebar_list ul li:hover a{
    	color: #e4e4e4;
	}
	
	.sidebar_list ul li a {
	    display: block;
	    font-size: 14px;
	    color: #72728c;
	    font-weight: 400;
	    -webkit-transition: all 200ms ease;
	    -moz-transition: all 200ms ease;
	    -ms-transition: all 200ms ease;
	    -o-transition: all 200ms ease;
	    transition: all 200ms ease;
	}
    .align-items-start {
	    -ms-flex-align: start!important;
	    align-items: flex-start!important;
	}
	.justify-content-start {
	    -ms-flex-pack: start!important;
	    justify-content: flex-start!important;
	}
	.flex-row {
    	-ms-flex-direction: row!important;
    	flex-direction: row!important;
	}
	.d-flex {
 	    display: -ms-flexbox!important;
   	 	display: flex!important;
	}
	.ml-auto, .mx-auto {
	    margin-left: auto!important;
	}
	
	.travello {
	    width: 250px; 
	    height: 600px;
	    overflow: hidden;
	    margin-top: 50px;
	}
	
	.myListContent div {
	    display: block;
	    position: relative;
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	}
	.background_image {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-repeat: no-repeat;
	    background-size: cover;
	    background-position: center center;
	}
}
</style>
<script type="text/javascript">
	$(function(){
		$("body").on("click",".routeItem", function(){
			var locCode = $(this).find("input").attr("data-locCode");
			var workCode = $(this).find("input").attr("data-workCode");
			var dayCount = $(this).find("input").attr("data-dayCount");
			location.href="<%=cp%>/travel/myplan/workspace?locCode="+locCode+"&workNum="+workCode+"&dayCount="+dayCount;
		});
	});
</script>
<div id="container" style="height: 1300px;">
	<div style="width: 100%;">
		<img src="<%=cp%>/resources/images/bg-img/background_tour.jpg" style="width:100%;height:270px;">
	</div>
	<div class="myListContent" style="height: 1030px;">
		<div style="float: left;" align="center" class="col12 col-lg-9" >
			<section class="routeList">
				<c:forEach var="dto" items="${list}">
					<div class="routeItem">
						<img src="<%=cp%>/resource/user/images/travel/seoul.jpg">
						<p>
							<input type="hidden" data-locCode="${dto.locCode}" data-workCode="${dto.workCode}" data-dayCount="${dto.dayCount}">
							<span style="font-size: 20px; font-weight: bold; text-overflow:ellipsis; display: block; overflow: hidden; white-space: nowrap;">${dto.subject}</span>
							<span>출발일 : ${dto.startDay} | 여행기간 : ${dto.dayCount}(일)</span><br>
							<span>작성일 : ${dto.created}</span>
						</p> 
					</div>
				</c:forEach>
			</section>
			<div style="clear: both; height: 30px; text-align: center; padding-top: 15px;  margin-bottom: 30px;" align="center">
				<div>${paging}</div>
				<div style="height: 42px;" align="center">
					<select> 
						<option>일정제목</option>
						<option>출발일</option>
						<option>작성일</option> 
					</select>
					<input type="text" placeholder="검색어를 입력하세요" style="height: 100%;">
					<button type="button" class="btn btn-black" style="height: 100%;">검색</button>
				</div>
			</div>
		</div>	
		<div class="col12 col-lg-3" style="float: left; padding-left: 15px; padding-right:15px;" align="left">
			<div class="sidebar">
				<div class="locations">
					<div class="sidebar_title">지역별 일정</div>
					<div class="sidebar_list">
						<ul>
							<li><a>서울</a>(8)</li>
							<li><a>인천</a>(8)</li>
							<li><a>경상북도</a>(8)</li>
							<li><a>함경도</a>(8)</li>
						</ul>
					</div>
				</div>
				<div class="travello">		
					<div class="background_image" style="background-image:url(<%=cp%>/resources/images/bg-img/background_tour.jpg)"></div><div class="travello_content">
						<div class="travello_content_inner">
							<div></div>
							<div></div>
						</div>
					</div>
					<div class="travello_container" style="border: 1px solid black">
						<a href="#">
							여기는 광고가 들어갈 겁니다.
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>