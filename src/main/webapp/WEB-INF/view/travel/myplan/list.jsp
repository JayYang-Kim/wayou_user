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
		width:310px;
		margin-left: 20px;
		margin-top: 40px; 
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
	}
	
	.lookup {
		top:-50%;
	}

</style>
<script type="text/javascript">
	$(function(){
		/* $(".routeItem").mouseenter(function(){
			$(this).children("img").toggleClass("lookup");
		});
		$(".routeItem").mouseleave(function(){
			$(this).children("img").toggleClass("lookup");
		}); */
	});
</script>
<div id="container" style="min-height: 1000px;">
<div style="width: 100%;" >
	<img src="<%=cp%>/resources/images/bg-img/background_tour.jpg" style="width:100%;height:270px;">
</div>

<div style="width:60%; height:100%; margin: 0 auto;" >
	<h3 style="margin-top: 20px;">| 여행 일정</h3>
	<section class="routeList">
			<div class="routeItem">
				<img src="<%=cp%>/resources/images/bg-img/background_tour.jpg">
				<p>
					<span style="font-size: 20px; font-weight: bold; text-overflow:ellipsis; display: block; overflow: hidden; white-space: nowrap;">즐거운weqweqweqweqw 서울 여행!</span>
					<span>여기는 제목</span><br>
					<span>여기는 시작일</span><br>
					<span>5 days</span>
				</p>
			</div>
	</section>
</div>	
</div>