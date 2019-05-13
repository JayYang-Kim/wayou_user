<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<style type="text/css">
	.event_title {
		padding: 20px 5px; 
		border-bottom: 1px solid #e5e5e5;
		margin-bottom: 20px;
	}
	.event_title h3 {
		margin-bottom: 5px;
	}
	.event_content {
		 border-bottom: 1px solid #e5e5e5;
		 margin-top:10px;
		 margin-bottom: 20px;"
	}
	
	.replyFrame {
		margin-bottom: 20px;
	}
	
	.replyFrame h4{
		margin-bottom: 10px;
	}
	
	.replyInput {
		padding:10px 5px; 
		border: 1px solid #e5e5e5;
		margin-bottom: 20px;
	}
	
	.replyInput p {
		padding-left: 20px;
		margin-bottom: 10px; 
	}
</style>


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

<div class="roberto-news-area section-padding-100-0">
	<div class="container">
		<div class="col-12 lg-9 mb-40" style="font-size: 16px;">
			<div class="event_title">
				<h3>${event.subject}</h3>
				<p>${event.startDate}~${event.endDate}</p>
			</div>

				<img src="<%=cp%>/resources/images/bg-img/1.jpg" style="height: 300px; width: 100%;">			

			<div class="event_content">
				<p>${event.content}</p>
			</div>
			<div align="center">
				<button class="btn btn-gray" onclick="location.href='<%=cp%>/ticket/event/list?${query}';">목록으로</button>
			</div>
			<div class="replyFrame">
				<h4>전체 댓글 </h4>
				<div class="replyInput" align="center">
					<p align="left">${sessionScope.member.userName}</p>
					<textarea style="width: 80%;" placeholder="최대 300자 까지 입력 가능합니다." maxlength="300"></textarea>
					<button class="btn btn-gray btn_addEvent" style="height: 100px; width: 15%;">등록하기</button>
				</div>
				<div class="replyForm"></div>
				
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		replyList(1);
		var dataCount = $("#reply").attr("data-dataCount");
		$(".replyFrame").find("h4").append(dataCount+"개");
	});
	
	function replyList(page){
		var url = "<%=cp%>/ticket/event/replyList";
		$.ajax({
			type:"get",
			url:url,
			data:{
				eventNum:"${event.eventNum}",
				page:page
			},
			success:function(data){
				$(".replyForm").html(data);
			},
			beforesend:function(e){
				e.setRequestHeader("AJAX",true);
			},
			error:function(e){
		    	if(e.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	}
			}
		});
	}
	
	$(".btn_addEvent").click(function(){
		var $ta = $(this).parent().find("textArea");
		if(!$ta.val()){
			alert("내용을 입력하세요!");
			$ta.focus();
			return false; 
		}

		var url = "<%=cp%>/ticket/event/insertReply";
		$.ajax({
			type:"post",
			url:url,
			data:{
				eventNum:"${event.eventNum}",
				content:$ta.val()
			},
			success:function(){
				$ta.val("");
				replyList(1);
			},
			beforesend:function(e){
				e.setRequestHeader("AJAX",true);
			},
			error:function(e){
		    	if(e.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	}
			}
		});
	});
	
	$("body").on("click",".deleteReplyBtn", function(){
		replyNum = $(this).closest(".replyBox").attr("data-replyNum");
		userIdx = $(this).closest(".replyBox").attr("data-userIdx");
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
		var url = "<%=cp%>/ticket/event/deleteReply";
		$.ajax({
			type:"post",
			url:url,
			data:{
				replyNum:replyNum,
				userIdx:userIdx
			},
			dataType:"json",
			success:function(data){
				if(data.isDeleted){
					alert("삭제하였습니다.");
					replyList(1);
				}
			},
			beforesend:function(e){
				e.setRequestHeader("AJAX",true);
			},
			error:function(e){
		    	if(e.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	}
			}
		})
	});
</script>