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
				if(data.state == "true") {
					alert("파티 신청에 성공했습니다..");
					$("textarea[name=message]").val("");
				} else {
					alert("파티 신청에 실패했습니다.");
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
</script>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="breadcrumb-content text-center">
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
                    			<a href="<%=cp%>/travel/party?${query}" class="btn roberto-btn f_right">수정</a>
                    			<a href="<%=cp%>/travel/party?${query}" class="btn roberto-btn f_right mr10">삭제</a>
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
	                    <ol>
	                        <!-- Single Comment Area -->
	                        <li class="single_comment_area">
	                            <!-- Comment Content -->
	                            <div class="comment-content d-flex">
	                                <!-- Comment Author -->
	                                <div class="comment-author">
	                                    <img src="<%=cp%>/resources/images/common/defaultImg.jpeg" alt="프로필 사진">
	                                </div>
	                                <!-- Comment Meta -->
	                                <div class="comment-meta">
	                                    <a href="#" class="post-date">27 Aug 2016</a>
	                                    <h5>Brandon Kelley</h5>
	                                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi.</p>
	                                    <c:if test="${sessionScope.member.userIdx == dto.userIdx}">
	                                    	<div class="mt10">
	                                    		<a href="#" class="like">수락</a>
		                                    	<a href="#" class="reply">거절</a>
	                                    	</div>
	                                    </c:if>
	                                    <%-- <c:if test="${sessionScope.member.userIdx != dto.userIdx}">
	                                    	<a href="#" class="like">수정</a>
		                                    <a href="#" class="reply">삭제</a>
	                                    </c:if> --%>
	                                </div>
	                            </div>
	                        </li>
	                    </ol>
                    </c:if>
                </div>

                <!-- Leave A Reply -->
                <c:if test="${not empty sessionScope.member && sessionScope.member.userIdx != dto.userIdx}">
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
            </div>
        </div>
    </div>
</div>
<!-- Blog Area End -->