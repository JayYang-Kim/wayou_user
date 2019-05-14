<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	$(".qnaArticle").hide();
	
	$(".qnaSubject").on("click", function(){
		var tr = $(this).closest("tr").next(".qnaArticle");
		var isHidden = $(this).closest("tr").next(".qnaArticle").is(":hidden");
		var $this = $(this).closest("tr");
		if(isHidden) {
			var qnaCode=$(this).attr("data-Num");
			var url = "<%=cp%>/ticket/qna/hitCount";
			var query="qnaCode="+qnaCode;
			$.ajax({
				type:"post"
				,url:url
				,data:query
				,dataType:"JSON"
				,success:function(data) {
					if(data.msg=="true"){
						var hitCount = data.hitCount;
						$this.children("td:nth-child(6)").html(hitCount);
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
			$(".qnaArticle").hide();
			tr.show();
		} else {
			tr.hide();
		}
	});
	
	//글수정
	$("body").on("click", ".btn_update", function(){
		var qnaCode = $(this).attr("data-qnaCode");
		
		var url="<%=cp%>/ticket/qna/update?qnaCode=" + qnaCode + "&page=${page}";
		location.href=url;
	});
	
	//글삭제
	$("body").on("click", ".btn_delete", function(){
		var qnaCode = $(this).attr("data-qnaCode");
		
		if(confirm("게시물을 삭제하시겠습니까?")){
		
		var url="<%=cp%>/ticket/qna/delete?qnaCode="+qnaCode+"&page=${page}";
		location.href=url;
		}
	});
	
});

function searchList() {
	var f = document.searchForm;
	f.submit();
}
</script>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/travel/main/top02.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-end">
            <div class="col-12">
                <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                	<h2 class="page-title">문의사항</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->

<!-- Blog Area Start -->
<div class="roberto-news-area section-padding-100-0">
	<div class="container">
		<form name="search_form" action="<%=cp%>/travel/party" method="post">
			<div class="row justify-content-center box_search mb40">
				<div class="col-12 col-sm-3 col-lg-2">
					<select name="searchKey">
						<option value="all"
							${searchKey == 'all' ? "selected='selected'" : ""}>제목 +
							내용</option>
						<option value="subject"
							${searchKey == 'subject' ? "selected='selected'" : ""}>제목</option>
						<option value="content"
							${searchKey == 'content' ? "selected='selected'" : ""}>내용</option>
						<option value="created"
							${searchKey == 'startDate' ? "selected='selected'" : ""}>문의일자</option>
					</select>
				</div>
				<div class="col-12 col-sm-9 col-lg-8">
					<input type="text" name="searchValue" class="form-control"
						value="${searchValue}" placeholder="검색어를 입력해주세요." />
				</div>
				<div class="col-12 col-lg-2">
					<button type="button" class="btn roberto-btn"
						onclick="sendSearch()">검색</button>
				</div>
			</div>
		</form>
		<div class="row justify-content-center">
			<div class="col-12 col-lg-12">
				<button type="button" class="btn roberto-btn" id="btn_createQna" onclick="javascript:location.href='<%=cp%>/travel/contact/created'">문의사항 작성</button>
				<table class=tb style="font-size: 15px;margin-top:20px;"> 
					<tr align="center" bgcolor="#eeeeee" height="40"
						style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
						<th width="60" style="color: #787878;">번호</th>
						<th width="100" style="color: #787878;">답변상태</th>
						<th style="color: #787878;">제목</th>
						<th width="100" style="color: #787878;">작성자</th>
						<th width="120" style="color: #787878;">작성일</th>
						<th width="60" style="color: #787878;">조회수</th>

					</tr>
					<c:forEach var="dto" items="${list}">
						<tr align="center" bgcolor="#ffffff" height="40"
							style="border-bottom: 1px solid #cccccc;">
							<td>${dto.listNum}</td>
							<c:if test="${dto.answerCount == 0 }">
								<td style="color: #787878;">검토중</td>
							</c:if>
							<c:if test="${dto.answerCount != 0 }">
								<td style="color: #1cc3b2;">답변완료</td>
							</c:if>
							<td class="qnaSubject" data-Num='${dto.qnaCode}'
								style="cursor: pointer;">${dto.subject}</td>
							<td>${dto.userName}</td>
							<td>${dto.created}</td>
							<td>${dto.hitCount}</td>
						</tr>
						<tr class="qnaArticle" style="background-color: #F6F6F6">
							<td colspan="6" style="text-align: left !important;">
								<div style="margin: 30px 10px 25px 40px;">
									<div style="margin-bottom: 30px;">
										<span style="display: inline-block; font-weight: bold;">Q.&nbsp;&nbsp;</span>${dto.content}
									</div>
									<div align="right" style="margin-right: 30px;">

										<c:if
											test="${sessionScope.member.userIdx == dto.userIdx && empty dto.answerContent}">
											<button type="button" class="btn_classic btn_update"
												style="margin-right: 7px; border-radius: 3px;"
												data-qnaCode='${dto.qnaCode}'>수정</button>
											<%-- 	<button type="button" class="btn_classic" style="margin-right:7px; border-radius: 3px;" onclick="updateBoard('${dto.qnaCode}')">수정</button> --%>
										</c:if>
										<!-- 삭제 - admin 권한추가해야함 -->
										<c:if
											test="${sessionScope.member.userIdx == dto.userIdx && empty dto.answerContent}">
											<button type="button" class="btn_classic btn_delete"
												style="border-radius: 3px;" data-qnaCode='${dto.qnaCode}'>삭제</button>
										</c:if>
									</div>
									<c:if test="${dto.answerCount != 0}">
										<div>
											<span
												style="display: inline-block; font-weight: bold; color: #1cc3b2;">A.&nbsp;&nbsp;</span>${dto.answerContent}
											<p style="color: #1cc3b2; font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												${dto.answerCreated}</p>
										</div>
									</c:if>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>

				<c:if test="${empty list}">
					<div class="t_center mt40 mb40">
						<span class="f14 exbold">등록된 문의사항이 없습니다.</span>
					</div>
				</c:if>

				<!-- Pagination -->
				<nav class="roberto-pagination mb-100" style="margin-top:20px; text-align: center;">${paging}</nav>
			</div>
		</div>
	</div>
</div>
<!-- Blog Area End -->