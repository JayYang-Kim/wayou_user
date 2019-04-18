<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">

function ajaxJSON(url, query, mode) {
	
	$.ajax({
		type:"post",
		url:url,
		data:query,
		dataType:"json",
		success:function(data) {
			if(data.state=="true"){
				location.href="<%=cp%>/hotel/hqna/list";				
			}else{
				alert("실패했습니다.");
				$("input[name=subject]").val("");
				$("textarea[name=content]").val("");
			}
		},
		error:function(e) {
			console.log(e.toString);
		}
	});
}


function sendHqna(mode) {
	var f=document.boardForm;

	if(! f.subject.value) {
		f.subject.focus();
		return;
	}
	
	if(! f.content.value) {
		f.content.focus();
		return;
	}
	
	if(mode=="created") {
		key="all"
		value="";
		pageNo=1;
	}
	
	var url="<%=cp%>/hotel/hqna/"+mode;
	var query = $("form[name=boardForm]").serialize();
	
	ajaxJSON(url, query, mode);
}



</script>


			<form name="boardForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject }">
			      </td>
			  </tr>
			
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			      <td style="padding-left:10px;"> 
			          ${sessionScope.member.userName }
			      </td>
			  </tr>
			
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" rows="12" class="boxTA" style="width: 95%;">${dto.content}</textarea>
			      </td>
			  </tr>
			  

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn" onclick="sendHqna('${mode}');">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="listPage2(pageNo)">${mode=='update'?'수정취소':'등록취소'}</button>
			  
					  <c:if test="${mode=='update'}">
					         	 <input type="hidden" name="qnaCode" value="${dto.qnaCode}">
					        	 <input type="hidden" name="page" value="${page}">
					  </c:if>
			      </td>
			    </tr>
			  </table>
			</form>