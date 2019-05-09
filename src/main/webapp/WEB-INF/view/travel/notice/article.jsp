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
	.fileBox {
		paddig:20px 5px;
		border-bottom: 1px solid #e5e5e5;
		margin-bottom:20px;
		
	}
	.fileBox h6{
		margin-bottom:15px;
		color: gray;
	}
	.fileBox a{
		padding-left:25px;
	}
</style>


<div class="breadcrumb-area bg-img bg-overlay jarallax"
	style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcrumb-content text-center">
					<h2 class="page-title">공지</h2>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="roberto-news-area section-padding-100-0">
	<div class="container">
		<div class="col-12 lg-9 mb-40" style="font-size: 16px;">
			<div class="event_title">
				<h3>${notice.subject}</h3>
				<p>${notice.created}</p>
			</div>
				<img src="<%=cp%>/resources/images/bg-img/1.jpg" style="height: 300px; width: 100%;">			
			<div class="event_content">
				<p>${notice.content}</p>
			</div>
			<div class="fileBox">
				<h6>첨부파일 목록</h6>
				<c:forEach var="file" items="${notice.files}" varStatus="status">
				      <a href="<%=cp%>/notice/download?fileNum=${file.fileCode}">${status.count}. ${file.originalFilename}</a>
			          <%-- (<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte) --%>
				</c:forEach>
			</div>
			
			<div align="center">
				<button class="btn btn-gray" onclick="location.href='<%=cp%>/travel/notice/list?${query}';">목록으로</button>
			</div>
		</div>
	</div>
</div>

<script>
	
</script>