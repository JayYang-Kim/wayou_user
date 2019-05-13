<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<section class="welcome-area">
   <div class="welcome-slides owl-carousel noImg">
       <!-- Single Welcome Slide -->
       <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/16.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/16.jpg">
           <!-- Welcome Content -->
           <div class="welcome-content h-100">
               <div class="container h-100">
                   <div class="row h-100 align-items-center">
                       <!-- Welcome Text -->
                       <div class="col-12">
                           <div class="welcome-text text-center">
                               <h6 data-animation="fadeInLeft" data-delay="200ms">Welcome To wayou</h6>
                               <h2 data-animation="fadeInLeft" data-delay="500ms">Hotel</h2>
                             
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
    </div>
</section>
<div class="roberto-news-area section-padding-100-0" >
        <div class="container" >
            <div class="row justify-content">
                <nav style="font-size: 20px; color: gray; line-height:2; padding-right: 150px;">
                <ul>
                    <li><a href="<%=cp%>/hotel/hevent/list">이&nbsp;벤&nbsp;트</a></li>
                    <li><a href="<%=cp%>/hotel/hnotice/list" class="active">공&nbsp;지&nbsp;사&nbsp;항</a></li>
                    <li><a href="<%=cp%>/hotel/hqna/main">문&nbsp;의&nbsp;사&nbsp;항</a></li>
                    <li><a href="<%=cp%>/hotel/hqna/main">F&nbsp;&nbsp;&&nbsp;&nbsp;Q</a></li>
                </ul>
            </nav>
                            <!-- Single Recent Post -->
                            <div class="single-recent-post d-flex">
                </div>
                <div class="col-12 col-lg-8" style="clear:both; float: right;" >
                    <!-- Single Blog Post Area -->
                    <div class="single-blog-post d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms" style="visibility: visible; width:80%; animation-delay: 100ms; animation-name: fadeInUp;">
                        <!-- Post Thumbnail -->
                        <div class="post-thumbnail" style="padding-right: 50px;">
                           <a href="#"><img src="<%=cp %>/resources/images/bg-img/24.jpg" alt=""></a>
                        </div>
                        <!-- Post Content -->
                        <c:forEach var="dto" items="${list}">
                        <div class="post-content">
                            <!-- Post Meta -->
                            <div class="post-meta">
                                <span class="post-tutorial">${dto.listNum} &nbsp;-&nbsp; Event&nbsp;/ &nbsp;${dto.created} </span>
                            
                            </div>
                            <!-- Post Title -->
                            <div style="cursor: pointer; font-size: 30px; margin-top: 20px;" href="<%=cp%>/hotel/hevent/article?eventNum=${dto.eventNum}" >${dto.subject}</div>
                            
                       		 <a style="cursor: pointer; margin: 50px 0px 0px 70px;"  href="<%=cp%>/hotel/hevent/article?eventNum=${dto.eventNum}" class="btn continue-btn">더보기<b> ${dto.isNew?'(진행중)':'(종료)'}</b></a>
                        </div>
                        	</c:forEach>
                    </div>
                <c:if test="${empty list}">
					<div class="t_center mt40 mb40">
						<span class="f14 exbold">등록된 이벤트가 없습니다.</span>
					</div>
				</c:if>
		<form name="search_form" action="<%=cp%>/hotel/hevent/list" method="post">
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
 <!-- Pagination -->
					<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
					   <tr height="35">
						<td align="center">
					        ${dadtaCount==0?"등록된 자료가 없습니다.": paging}
						</td>
					   </tr>
					</table>
                </div>
            </div>
        </div>
    </div>
    <script>
	function sendSearch(){
		if(!$("input[name=searchValue]").val()){
			location.href="<%=cp%>/hotel/hevent/list";
			return false;
		}
		var searchKey = $("select[name=searchKey]").val();
		var searchValue=$("input[name=searchValue]").val();
		$("input[name=searchValue]").val("");
		location.href="<%=cp%>/hotel/hevent/list?searchKey="+searchKey+"&searchValue="+encodeURIComponent(searchValue);
	}
</script>