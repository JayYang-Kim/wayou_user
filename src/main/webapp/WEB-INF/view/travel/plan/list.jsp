<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
	.locCategory {
		cursor: pointer;
	}
	.locCategory :hover {
		color: #e5e5e5;
	}
	.routeItem {
		width: 33%;
		min-width: 250px;
		height: 250px;
		float: left;
		padding:15px 10px;
		cursor: pointer;
	}
	.routeItem img {
		position:relative;
		top:0px;
		left:0px;
		z-index:2;
	}
	.routeItem div {
		position: relative;
		top:-50%;
		left:15px;
		z-index: 1;
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
		$(".routeItem").mouseover(function(){
			$(this).find("img").css("top","-50%");
		});
		$(".routeItem").mouseout(function(){
			$(this).find("img").css("top","0px");
		});
	});

	function search() {
		var f = document.search_form;
		if(f.searchValue.value.trim()==''){
			alert("검색어를 입력하세요");
			location.href="<%=cp%>/travel/plan/list";
			return false;
		}
		
		
		var searchKey = f.searchKey.value;
		
		if(searchKey=='startDay' || searchKey=='created'){
			f.searchValue.value = f.searchValue.value.replace(/(\.|\-|\/)/g,"");
		}
		var searchValue = f.searchValue.value;
		f.action="<%=cp%>/travel/plan/list?searchKey="+searchKey+"&searchValue="+encodeURIComponent(searchValue);
		f.submit();
	}
	$(function(){
		$(".locCategory").click(function(){
			var locCode= $(this).attr("data-locCode");
			if(${searchValue==''}){
				location.href="<%=cp%>/travel/plan/list?locCode="+locCode;	
			}else {
				location.href="<%=cp%>/travel/plan/list?locCode="+locCode+"&searchKey=${searchKey}&searchValue=${searchValue}";
			}
			
		});
	});
</script>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="breadcrumb-content text-center">
                    <h2 class="page-title">모두의 일정</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->

<!-- Blog Area Start -->
<div class="roberto-news-area section-padding-100-0">
    <div class="container">
    	<form name="search_form">
	    	<div class="row justify-content-center box_search mb40">
		            <div class="col-12 col-sm-3 col-lg-2">
				         <select name="searchKey">
				            <option value="title" ${searchKey == 'all' ? "selected='selected'" : ""}>일정 제목</option>
				            <option value="startDay" ${searchKey == 'startDay' ? "selected='selected'" : ""}>시작일</option>
				            <option value="created" ${searchKey == 'created' ? "selected='selected'" : ""}>작성일</option>
				            <option value="userName" ${searchKey == 'userName' ? "selected='selected'" : ""}>작성자</option>
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
        <div class="row justify-content-center">
            <div class="col-12">
            	<div class="locations">
					<div class="sidebar_list" style="margin-bottom:40px; text-align: center">
						<c:forEach var="n" items="${locCategory}">
							<a data-locCode="${n.locCode}" class="locCategory"><span style="font-size: 18px;">${n.locName}(${n.count}) </span></a>
						</c:forEach>
					</div>
				</div>
                <section class="routeList" style="min-height: 700px; padding-left: 20px; padding-right: 20px;">
					<c:forEach var="dto" items="${list}">
						<div class="routeItem">
							<img src="<%=cp%>/resource/user/images/travel/seoul.jpg" style="float: left;">
							<div style="float: left;">
								<p>
									<input type="hidden" data-locCode="${dto.locCode}" data-workCode="${dto.workCode}" data-dayCount="${dto.dayCount}" data-userIdx="${dto.userIdx}">
									<span style="font-size: 20px; font-weight: bold; text-overflow:ellipsis; display: block; overflow: hidden; white-space: nowrap;">${dto.subject}</span>
									<span>여행지역 : ${dto.locName}</span><br>
									<span>출발일 : ${dto.startDay} | 여행기간 : ${dto.dayCount}(일)</span><br>
									<span>작성일 : ${dto.created}</span><br>
									<span>작성자 : ${dto.userName}</span>
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

        </div>
    </div>
</div>