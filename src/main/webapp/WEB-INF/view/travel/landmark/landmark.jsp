<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resources/css/travel.css">

<script type="text/javascript">
	var starCount = 0;
	
	$(function(){
		replyList(1);
		
		$(".star a").click(function() {
			var b = $(this).hasClass("on");
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			if(b) {
				$(this).removeClass("on");
			}
				
			starCount = $(".star .on").length;
		});
	});
	
	function replyList(page){
		var url = "<%=cp%>/travel/landmark/replyList";
		var query="landCode=${readLandmark.landCode}&page=" + page;
		
		$.ajax({
			type:"get",
			url:url,
			data:query,
			success:function(data){
				$("#layoutReply").html(data);
			},
			beforesend:function(e){
				e.setRequestHeader("AJAX",true);
			},
			error:function(e){
		    	<%-- if(e.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	} --%>
			}
		});
	}
	
	$("body").on("click",".btn_addReply",function(){
		var $content = $(this).closest(".roberto-contact-form").find("textarea");
		if(!$content.val()){
			alert("내용을 입력해주세요.");
			$content.focus();
			return false; 
		}
		
		var url = "<%=cp%>/travel/landmark/reply/insert";
		var query="landCode=${readLandmark.landCode}&starNum=" + starCount + "&content=" + $content.val();
	
		$.ajax({
			type:"post",
			url:url,
			data:query,
			success:function(data){
				if(data.msg == "false") {
					alert("글 등록 실패했습니다.");
					
					return false;
				}
				
				$content.val("");
				$(".star a").removeClass("on");
				starCount = 0;
				
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
	
	$("body").on("click",".btn_deleteReply", function(){
		replyNum = $(this).closest(".reviwer-content").attr("data-replynum");
		userIdx = $(this).closest(".reviwer-content").attr("data-userIdx");
		
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
		
		var url = "<%=cp%>/travel/landmark/reply/delete";
		var query = "replyNum=" + replyNum + "&userIdx=" + userIdx;
		$.ajax({
			type:"post",
			url:url,
			data:query,
			dataType:"json",
			success:function(data){
				if(data.msg == "true"){
					alert("글 삭제 성공했습니다.");
					replyList(1);
					
					return false;
				}
				
				alert("글 삭제 실패했습니다.");
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

<!-- 관광명소 상세정보(Top) -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/travel/main/top02.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-end">
            <div class="col-12">
                <div class="breadcrumb-content align-items-center justify-content-between pb-5">
                    <h2 class="room-title">${readLandmark.landName}</h2>
                    <div class="mt10 mb10" style="font-size:15px;color:#ffffff;">${readLandmark.address1}, ${readLandmark.address2}</div>
                    <p class="star" style="font-size:14px;color:#ffffff;">
						<c:if test="${readLandmark.landAvgStarNum < 5}">
							<c:forEach begin="${readLandmark.landAvgStarNum}" end="4">
								<i class="fa fa-star"></i>
							</c:forEach>
						</c:if>
						<c:if test="${readLandmark.landAvgStarNum > 0}">
							<c:forEach begin="1" end="${readLandmark.landAvgStarNum}">
			            		<i class="fa fa-star" style="color: #f5b917;"></i>
			            	</c:forEach>
		            	</c:if>
						/ ${readLandmark.landReplyCount} (댓글수)
					</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //관광명소 상세정보(Top) -->

<!--  -->
<div class="roberto-news-area section-padding-100-0">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8 mb-100" style="border-right:1px solid #ebebeb;">
                <div class="single-room-details-area mb-50">
					<!-- Room Thumbnail Slides -->
					<div class="room-thumbnail-slides mb-50">
						<div id="room-thumbnail--slide" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<c:if test="${not empty landmarkFiles}">
										<c:forEach var="landmarkFiles" items="${landmarkFiles}">
											<img src="<%=cp%>/uploads/landmark/${landmarkFiles.saveFilename}" class="d-block w-100" alt="">
										</c:forEach>
									</c:if>
									<c:if test="${empty landmarkFiles}">
										<c:forEach var="landmarkFiles" items="${landmarkFiles}">
											<img src="<%=cp%>/resources/images/bg-img/48.jpg" class="d-block w-100" alt="">
										</c:forEach>
									</c:if>
								</div>
							</div>
							
							<c:if test="${not empty landmarkFiles}">
								<ol class="carousel-indicators">
									<c:forEach var="landmarkFiles" items="${landmarkFiles}" varStatus="status">
										<li data-target="#room-thumbnail--slide" data-slide-to="${status.index}" class="active">
											<img src="<%=cp%>/uploads/landmark/${landmarkFiles.saveFilename}" class="d-block w-100" alt="">
										</li>
									</c:forEach>
								</ol>
							</c:if>
						</div>
					</div>
				</div>
				<div class="mt20 mb20 pb20" style="border-bottom:1px solid #ebebeb;line-height:22px;">
                	${readLandmark.memo}
                </div>
                <!-- 커뮤니티 -->
				<div class="room-review-area section-padding-100-0 clear">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<h4>커뮤니티</h4>
				
							    <div id="layoutReply" style="padding-top:30px;border-top: 1px solid #cccccc;"></div>
							</div>
							<c:if test="${not empty sessionScope.member}">
								<div class="roberto-contact-form col-md-12 mt-20" style="border-top: 1px solid #cccccc;padding-top: 20px;">
					                <h2>글 남기기</h2>
					
					                <div class="row">
					                    <div class="col-12">
					                    	<div class="box_star">
					                    		<div class="title">
					                    			<span>평점 : </span>
					                    		</div>
					                    		<div class="star">
					                    			<a href="#">★</a> 
													<a href="#">★</a> 
													<a href="#">★</a> 
													<a href="#">★</a> 
													<a href="#">★</a>
					                    		</div>
					                    	</div>
					                        <textarea name="content" class="form-control mb-30" placeholder="내용을 입력해주세요."></textarea>
										</div>
					                    <div class="col-12 text-right">
											<button type="button" class="btn_addReply btn roberto-btn btn-3 mt-15">등록하기</button>
					                    </div>
									</div>
					            </div>
				            </c:if>
						</div>
						<!-- //row -->
					</div>
				</div>
				<!-- //커뮤니티 -->
            </div>

            <div class="col-12 col-sm-8 col-md-6 col-lg-4">
                <div class="roberto-sidebar-area pl-md-4">
                    <!-- Recent Post -->
                    <div class="single-widget-area mb-100">
                        <h4 class="widget-title mb-30">추천 지역</h4>

                        <div id="recommendLocation_layout"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>