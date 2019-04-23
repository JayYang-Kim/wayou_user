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
	
	.travello_title {
	    font-family: "Oswald",sans-serif;
	    font-size: 48px;
	    color: #ffffff;
	    max-width: 210px;
	    line-height: 1;
	}
	.travello_container {
	    position: absolute;
	    top: 0px;
	    left: 0px;
	    width: 100%;
	    height: 100%;
	    z-index: 1;
	    padding-bottom: 47px;
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
	$(function(){
		$(".newRoute").click(function(){
			location.href="<%=cp%>/travel/myplan/add";
		});
	});
</script>
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: none;" data-jarallax-original-styles="background-image: url(/wayou/resources/images/bg-img/17.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="breadcrumb-content text-center">
                    <h2 class="page-title">나만의 일정</h2>
                </div>
            </div>
        </div>
    </div>
	<div id="jarallax-container-0" style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; overflow: hidden; pointer-events: none; z-index: -100;">
		<div style="background-position: 50% 50%; background-size: cover; background-repeat: no-repeat; background-image: url(&quot;http://localhost:9090/wayou/resources/images/bg-img/17.jpg&quot;); position: fixed; top: 0px; left: 0px; width: 1104px; height: 610px; overflow: hidden; pointer-events: none; margin-top: 155px; transform: translate3d(0px, -190px, 0px);"></div>
	</div>
</div>
<div class="roberto-news-area section-padding-100-0">
<div id="container">
	<form name="search_form" action="/wayou/travel/party" method="post">
	    	<div class="row justify-content-center box_search mb40">
		            <div class="col-12 col-sm-3 col-lg-2">
		            	<select name="searchKey" style="display: none;">
		            		<option value="all" selected="selected">제목 + 내용</option>
		            		<option value="subject">제목</option>
		            		<option value="content">내용</option>
		            		<option value="startDate">시작일</option>
		            		<option value="endDate">종료일</option>
		            		<option value="userId">아이디</option>
		            		<option value="userCount">인원수</option>
		            	</select><div class="nice-select" tabindex="0"><span class="current">제목 + 내용</span><ul class="list"><li data-value="all" class="option selected">제목 + 내용</li><li data-value="subject" class="option">제목</li><li data-value="content" class="option">내용</li><li data-value="startDate" class="option">시작일</li><li data-value="endDate" class="option">종료일</li><li data-value="userId" class="option">아이디</li><li data-value="userCount" class="option">인원수</li></ul></div>
		            </div>
		            <div class="col-12 col-sm-9 col-lg-8">
		            	<input type="text" name="searchValue" class="form-control" value="" placeholder="검색어를 입력해주세요.">
		            </div>
		            <div class="col-12 col-lg-2">
		            	<button type="button" class="btn roberto-btn" onclick="sendSearch()">검색</button>
		            </div>
			</div>
		</form>
	<div class="myListContent">
		
		<div style="float: left;" align="center" class="col12 col-lg-9" >
		<button type="button" class="btn btn-black newRoute" style="float: right;">새 경로 작성하기</button>
			<section class="routeList" style="margin-top: 40px;">
				<c:forEach var="dto" items="${list}">
					<div class="routeItem">
						<img src="<%=cp%>/resource/user/images/travel/seoul.jpg">
						<p>
							<input type="hidden" data-locCode="${dto.locCode}" data-workCode="${dto.workCode}" data-dayCount="${dto.dayCount}">
							<span style="font-size: 20px; font-weight: bold; text-overflow:ellipsis; display: block; overflow: hidden; white-space: nowrap;">${dto.subject}</span>
							<span>출발일 : ${dto.startDay} | 여행기간 : ${dto.dayCount}(일)</span><br>
							<span>작성일 : ${dto.created}| 여행지역 : ${dto.locName}</span>
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
							<c:forEach var="n" items="${locCategory}">
								<li><a>${n.locName}</a>(${n.count})</li>
							</c:forEach>
							
						</ul>
					</div>
				</div>
				<div class="travello">		
					<div class="background_image" style="background-image:url(<%=cp%>/resources/images/bg-img/background_tour.jpg)">
						<div class="travello_content">
						<div class="travello_container">
								<span class="travello_title">여기는 광고 들어갈 자리</span>
					</div>
					</div>
				</div>
					
					</div>
					
			</div>
		</div>
	</div>
</div>
</div>