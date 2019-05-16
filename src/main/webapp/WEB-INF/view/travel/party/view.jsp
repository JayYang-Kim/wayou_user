<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
	function sendJoinParty() {
		var url = "<%=cp%>/travel/party/joinParty";
		var query = "userIdx=${sessionScope.member.userIdx}&partyCode=${dto.partyCode}&memo=" + $("textarea[name=message]").val();
		
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,success:function(data) {
				if(data.msg == "false") {
					alert("이미 파티를 신청하셨습니다.");
					$("textarea[name=message]").val("");
				} else if(data.state == "false") {
					alert("파티 신청에 실패했습니다.");
					$("textarea[name=message]").val("");
				} else if(data.state == "true") {
					alert("파티 신청에 성공했습니다.");
					listJoinParty(1);
					$("textarea[name=message]").val("");
				}
			}
		    ,beforeSend:function(e) {
		    	e.setRequestHeader("AJAX", true);
		    }
		    ,error:function(e) {
		    	if(e.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	}
		    	console.log(e.responseText);
		    }
		});
	}
	
	// 전역 변수
	var pageNo = 1;
	var	totalPage = 1;
	
	$(function(){
		listJoinParty(1);
	});
	
	function listJoinParty(page) {
		var url = "<%=cp%>/travel/party/listJoinParty";
		var query = "partyCode=${dto.partyCode}&page=" + page; 
		
		$.ajax({
			type:"get"
			,url:url
			,data:query
			,success:function(data) {
				printJoinParty(data);
			}
		    ,beforeSend:function(e) {
		    	<%--e.setRequestHeader("AJAX", true);--%>
		    }
		    ,error:function(e) {
		    	<%-- if(e.status==403) {
		    		location.href="<%=cp%>/member/login";
		    		return;
		    	} --%>
		    	console.log(e.responseText);
		    }
		});	
	}
	
	function printJoinParty(data) {		
		$("#listJoinParty").html(data);
		
		totalPage = $("#total_page").val();
		var dataCount = $("#dataCount").val();
		var page = $("#page").val();
		
		// 페이지 번호 숨김, 표시 처리
		if(pageNo >= totalPage) {
			$(".moreLayout").hide();
		} else {
			$(".moreLayout").show();
		}
	}
	
	function morePage() {
		if(pageNo < totalPage) {
			++pageNo;
			listPage(pageNo);
		} else {
			$(".moreLayout").hide();
		}
	}
	
	$(function(){
		var partyCode = ${dto.partyCode};
		
		$("body").on("click", "#joinParty_accept", function(){
			var url = "<%=cp%>/travel/party/joinParty/accept";
			var userIdx = $("#userIdx").val();
			var query = "partyCode=" + partyCode + "&userIdx=" + userIdx;
			
			alert(query);
			
			$.ajax({
				type:"post"
				,url:url
				,data:query
				,dataType:"json"
				,success:function(data) {
					if(data.msg == "true") {
						alert("참가신청 참가 성공했습니다.");
						listJoinParty(1);
					} else {
						alert("참가신청 참가 실패했습니다.");
					}
				}
			    ,beforeSend:function(e) {
			    	e.setRequestHeader("AJAX", true);
			    }
			    ,error:function(e) {
			    	if(e.status==403) {
			    		location.href="<%=cp%>/member/login";
			    		return;
			    	}
			    	console.log(e.responseText);
			    }
			});
		});
		
		$("body").on("click", "#joinParty_refuse", function(){
			var url = "<%=cp%>/travel/party/joinParty/refuse";
			var userIdx = $("#userIdx").val();
			var query = "partyCode=" + partyCode + "&userIdx=" + userIdx;
	
			$.ajax({
				type:"post"
				,url:url
				,data:query
				,dataType:"json"
				,success:function(data) {
					if(data.msg == "true") {
						alert("참가신청 거절 성공했습니다.");
						listJoinParty(1);
					} else {
						alert("참가신청 거절 실패했습니다.");
					}
				}
			    ,beforeSend:function(e) {
			    	e.setRequestHeader("AJAX", true);
			    }
			    ,error:function(e) {
			    	if(e.status==403) {
			    		location.href="<%=cp%>/member/login";
			    		return;
			    	}
			    	console.log(e.responseText);
			    }
			});
		});
		
		$("body").on("click", "#joinParty_delete", function(){
			var url = "<%=cp%>/travel/party/joinParty/delete";
			var userIdx = $("#userIdx").val();
			var query = "partyCode=" + partyCode + "&userIdx=" + userIdx;
	
			$.ajax({
				type:"post"
				,url:url
				,data:query
				,dataType:"json"
				,success:function(data) {
					if(data.msg == "true") {
						alert("참가신청 나가기 성공했습니다.");
						listJoinParty(1);
					} else {
						alert("참가신청 나가기 실패했습니다.");
					}
				}
			    ,beforeSend:function(e) {
			    	e.setRequestHeader("AJAX", true);
			    }
			    ,error:function(e) {
			    	if(e.status==403) {
			    		location.href="<%=cp%>/member/login";
			    		return;
			    	}
			    	console.log(e.responseText);
			    }
			});
		});
	});
</script>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/travel/main/top02.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-end">
            <div class="col-12">
                <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                	<h2 class="page-title">여행 동료 모으기</h2>
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
            <div class="col-12">
            	<!-- Title -->
            	<div class="blog-details-title">
            		<h3>${dto.subject}</h3>
            	</div>
                <!-- Blog Details Text -->
                <div class="blog-details-text">
                    <p>${dto.content}</p>
                </div>

                <!-- Post Author Area -->
                <div class="post-author-area d-flex align-items-center justify-content-between mb-50">
                	<div class="w100p">
                		<div>
                			<c:if test="${not empty preReadParty}">
                				<a href="<%=cp%>/travel/party/view?${query}&partyCode=${preReadParty.partyCode}" class="btn btn-white roberto-btn">이전</a>
                			</c:if>
                			<c:if test="${not empty nextReadParty}">
                				<a href="<%=cp%>/travel/party/view?${query}&partyCode=${nextReadParty.partyCode}" class="btn btn-white roberto-btn">다음</a>
                			</c:if>
                			<c:if test="${sessionScope.member.userIdx != dto.userIdx}">                    		
                    			<a href="<%=cp%>/travel/party?${query}" class="btn roberto-btn f_right">목록</a>
                    		</c:if>
                    		<c:if test="${sessionScope.member.userIdx == dto.userIdx}">                    		
                    			<a href="<%=cp%>/travel/party/update?${query}&partyCode=${dto.partyCode}" class="btn roberto-btn f_right">수정</a>
                    			<a href="<%=cp%>/travel/party/delete?${query}&partyCode=${dto.partyCode}" class="btn roberto-btn f_right mr10">삭제</a>
                    		</c:if>
                		</div>
                	</div>
                </div>

                <!-- Comments Area -->
                <div class="comment_area mb-50 clearfix">
                    <h2>참가신청 : <span>${dto.partyPeopleCount}</span> <span class="pl5 pr5">/</span> <span>${dto.max}</span></h2>
					
					<c:if test="${dto.partyPeopleCount == 0}">
						<div class="box_partyPeople">
							<span>등록된 참가신청 이력이 없습니다.</span>
						</div>
					</c:if>
					<c:if test="${dto.partyPeopleCount != 0}">
	                    <ol id="listJoinParty"></ol>
                    </c:if>
                </div>
                <div class="moreLayout blind" style="text-align: right; height: 50px;">
					<span onclick="morePage()" style="cursor:pointer">더보기</span>
				</div>

                <!-- Leave A Reply -->
                <c:if test="${not empty sessionScope.member && sessionScope.member.userIdx != dto.userIdx && dto.partyPeopleCount < dto.max}">
                <div class="roberto-contact-form mt-80 mb-100">
                    <h2>참가 신청하기</h2>

                    <!-- Form -->
                    <form>
                        <div class="row">
                            <div class="col-12">
                                <textarea name="message" class="form-control mb-30" placeholder="내용을 입력해주세요."></textarea>
                            </div>
                            <div class="col-12 text-right">
                                <button type="button" class="btn roberto-btn btn-3 mt-15" onclick="sendJoinParty()">신청하기</button>
                            </div>
                        </div>
                    </form>
                </div>
                </c:if>    
                <!-- 채팅 -->
                <!-- <div class="mt20 mb20" style="height:500px">
					<iframe src="http://211.238.142.187:3001" width="500" height="500" frameborder="0"></iframe>
                </div> -->
            </div>
        </div>
    </div>
</div>
<!-- Blog Area End -->