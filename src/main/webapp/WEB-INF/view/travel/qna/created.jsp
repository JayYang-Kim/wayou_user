<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
	.btnSpace {
		text-align: center;
	}
	.btnSpace .btn{
		margin:5px 5px;
		height: 40px;
		min-width: 50px;
		width: 140px;
	}
</style>
<script type="text/javascript">
function sendOk() {
	var f=document.QnABoardForm;
	
	var str=f.subject.value;
	
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
	
	f.action="<%=cp%>/travel/qna/${mode}";
	
	f.submit();
}

</script>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax"
	style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcrumb-content text-center">
					<h2 class="page-title">문의하기</h2>
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
				<h3>| 문의 사항 작성</h3>
				<form name="QnABoardForm" method="post"> 
			  <table style="width: 100%; margin: 20px auto 0px; min-height: 500px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject}">
			      </td>
			  </tr>
			
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			      <td style="padding-left:10px;"> 
			           ${sessionScope.member.userName}
			      </td>
			  </tr>
			
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" rows="12" class="boxTA" style="width: 95%; height: 400px;">${dto.content}</textarea>
			      </td>
			  </tr>
			  </table>
			
			  <div style="width: 100%; margin: 20px auto; border-spacing: 0px;" class="btnSpace">
			        <button type="button" class="btn roberto-btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn roberto-btn">다시입력</button>
			        <button type="button" class="btn roberto-btn" onclick="javascript:location.href='<%=cp%>/travel/contact';">${mode=='update'?'수정취소':'등록취소'}</button>
			        
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="qnaCode" value="${dto.qnaCode}">
			        	 <input type="hidden" name="page" value="${page}">
			        </c:if>
			  </div>
			</form>
			</div>	
		</div>
	</div>
</div>
<!-- Blog Area End -->