<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
	.routeItem {
		height:200px;
		width:100%;
		min-width:300px;
		margin-top:10px; 
		cursor: pointer; 
	}
	.routeItem img {
		float:left;
		height: 100%;
		width: 30%; 
	}
	.routeItem div {
		float: left; 
		padding-left:20px; 
		padding-top:15px;
		width:70%;
	}
	.myListContent {
		padding-top: 100px;
		-webkit-font-smoothing: antialiased;
	}
	
	.locations{
		height: auto;
		margin-bottom: 30px;
	}
	
	.sidebar_list {
		min-height: 100px;
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
    	height: auto;
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
	    height: 800px;
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
	    width: 100%;
	    height: 100%;
	    background-repeat: no-repeat;
	    background-size: cover;
	    background-position: center center;
	}
	.routeLocList {
		float:left;
		width:50px;
	}
}
</style>
<script type="text/javascript">
	$(function(){
		$("body").on("click",".routeItem", function(){
			var locCode = $(this).find("input").attr("data-locCode");
			var workCode = $(this).find("input").attr("data-workCode");
			var dayCount = $(this).find("input").attr("data-dayCount");
			var userIdx = $(this).find("input").attr("data-userIdx");
			location.href="<%=cp%>/travel/plan/view?locCode="+locCode+"&workNum="+workCode+"&dayCount="+dayCount+"&userIdx="+userIdx;
		});
	});
	$(function(){
		$(".newRoute").click(function(){
			location.href="<%=cp%>/travel/myplan/add";
		});
	});
	
	$(function(){
		$(".routeLocList").click(function(){
			var locCode= $(this).attr("data-locCode");
			location.href="<%=cp%>/travel/myplan/myList?locCode="+locCode;
		});
	});
	
	function search(){
		$(function(){
			var form = $("#searchRoute")
			if(!$("#searchRoute input").val()){
				alert("값을 입력하세요!");
				return false;
			}
			var searchKey = form.find("select[name=searchKey]").val();
			if(searchKey=="startDay" || searchKey=="created"){
				form.find("input[name=searchValue]").val(form.find("input[name=searchValue]").val().replace(/(\.|\-|\/)/g,""));
			}
			var query = form.serialize();
			location.href="<%=cp%>/travel/myplan/myList?page=${page}&"+query;
		});
	}
</script>
<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="breadcrumb-content text-center">
                    <h2 class="page-title">나만의 일정</h2>
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
            <div class="col-12 col-lg-8">
            	<form id="searchRoute" style="width: 100%;">
			    	<div class="row justify-content-center box_search">
				            <div class="col-12 col-sm-3 col-lg-2">
				            	<select name="searchKey">
				            		<option value="title" ${searchKey == 'all' ? "selected='selected'" : ""}>일정 제목</option>
				            		<option value="startDay" ${searchKey == 'startDay' ? "selected='selected'" : ""}>시작일</option>
				            		<option value="created" ${searchKey == 'created' ? "selected='selected'" : ""}>작성일</option>
				            	</select>
				            </div>
				            <div class="col-12 col-sm-9 col-lg-7">
				            	<input type="text" name="searchValue" class="form-control" value="${searchValue}" placeholder="검색어를 입력해주세요." style="width: 100%;"/>
				            </div>
				            <div class="col-12 col-lg-3">
				            	<button type="button" class="btn roberto-btn" style="width: 100%;" onclick="search()">검색</button>
				            </div>
					</div>
				</form>
            	
				
				<c:if test="${not empty sessionScope.member}">
	                <div>
	                	<div class="col-12 text-right">
		                    <button type="button" class="btn roberto-btn newRoute" style="margin-bottom: 10px; margin-top: 20px;">새 경로 생성하기</button>
		                </div>
	                </div>
                </c:if>
                <section class="routeList" style="min-height: 700px;">
					<c:forEach var="dto" items="${list}">
						<div class="routeItem wow fadeInUp" data-wow-delay="100ms">
							<img src="<%=cp%>/resource/user/images/travel/seoul.jpg" style="float: left;">
							<div style="float: left;">
								<p>
									<input type="hidden" data-locCode="${dto.locCode}" data-workCode="${dto.workCode}" data-dayCount="${dto.dayCount}" data-userIdx="${dto.userIdx}">
									<span style="font-size: 20px; font-weight: bold; text-overflow:ellipsis; display: block; overflow: hidden; white-space: nowrap;">${dto.subject}</span>
									<span>여행지역 : ${dto.locName}</span><br>
									<span>출발일 : ${dto.startDay} | 여행기간 : ${dto.dayCount}(일)</span><br>
									<span>작성일 : ${dto.created}|</span>
								</p> 
							</div>
						</div>
						<c:if test="${empty list}">
		                	<div class="t_center mt40 mb40">
		                		<span class="f14 exbold">등록된 여행 일정이 없습니다.</span>
		                	</div>
		                </c:if>          
					</c:forEach>
				</section>
                <!-- Pagination -->
                <nav class="roberto-pagination mb-50 text-center" style="margin-top:10px;">
                	${paging}
                </nav>
            </div>

            <div class="col-12 col-sm-12 col-md-12 col-lg-4">
                <div class="roberto-sidebar-area pl-md-4">
					<div class="sidebar">
						<div class="locations">
							<div class="sidebar_title">지역별 일정</div>
							<div class="sidebar_list">
								<ul>
									<c:forEach var="n" items="${locCategory}">
										<li class="routeLocList" data-locCode="${n.locCode}"><a>${n.locName}</a>(${n.count})</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="travello">		
							<div class="background_image" style="background-image:url(<%=cp%>/resources/images/bg-img/eduwill.jpg)">
							</div>
						</div>
					</div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Blog Area End -->