<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    
    <!-- Css -->
    <link rel="stylesheet" href="<%=cp%>/resources/css/common.css" media="all" />

    <!-- Javascript -->
    <script src="<%=cp%>/resources/js/lib/jquery-1.12.4.min.js"></script>
	<script src="<%=cp%>/resources/js/lib/jquery-migrate-1.4.1.min.js"></script>
    <script src="<%=cp%>/resources/js/lib/jquery-ui-1.12.1.min.js"></script>
    
    <script src="<%=cp%>/resources/js/lib/util-jquery.js"></script>
    <script src="<%=cp%>/resources/js/lib/util.js"></script>
    

 <script type="text/javascript">
   var echeck=0;
   
   function deleteSubmit(){
	   var f=document.updateForm;
	  if(confirm("WAYOU를 탈퇴 하시겠습니까?")==true){
	    	f.action="<%=cp%>/myPage/delete1";
	    	f.submit();
	  }
   }
   
   function back(){
	   var f=document.updateForm;
	    	f.action="<%=cp%>/myPage/main";
	    	f.submit();
	  }
   
   
   function securityCheck(){
		var f=document.updateForm;
		var content;
		
		content=f.security.value;
		if(!content){
			alert("인증번호를 작성하세요");
			f.security.focus();
			return;
		}
		
		if(content!=f.securityNum.value){
			alert("인증번호를 다시 확인해주세요");
			f.security.focus();
			return;
		}
		
		alert("인증성공");
		echeck=1;
   }
    
   function sendEmail(){
	   var f=document.updateForm;
	   var email=f.userEmail.value;
	   var url="<%=cp%>/member/emailCheck";
	   if(!/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(email)){
		   alert("이메일 주소를 작성해주세요");
		   f.userEmail.focus();
		   return;
	   }
	   var data="email="+email;
	   $.ajax({
		  url:url,
		  data:data,
		  dataType:"JSON",
		  success:function(data){
			  var result=data.result;
			  if(result=="false")
				  alert("이메일 전송 실패");
			  f.securityNum.value=data.securityNum;
			  alert("인증 번호가 담긴 이메일을 보냈습니다.");
		  },beforeSend:function(e){
			  e.setRequestHeader("AJAX",true);
		  },error:function(e){
			  if(e.status==403){
				alert("메일 전송 실패");
				return;
			  }
			  console.log(e.responseText);
		  }
	   });
   }
 
   function updateSubmit(){
    	var f=document.updateForm;
    	var content;
    	
    	content=f.userPwd.value;
    	content=content.trim();
    	if(!content){
    		alert("비밀번호를 입력하세요");
    		f.userPwd
    		return;
    	}
    	
		if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(content)) { 
    		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자를 포함해야합니다");
    		f.userPwd.focus();
    		return;
    	}
    	
    	if(content!=f.userPwdCheck.value){
    		alert("패스워드가 일치하지 않습니다");
    		f.userPwdCheck.focus();
    		return;
    	}
    	
    	content=f.userEmail.value;
    	if(!content){
    		alert("이메일을 작성해주세요");
    		f.userEmail.focus();
    		return;
    	}
    	
    	content=f.security.value;
    	if(!content){
    		alert("인증번호를 작성하세요");
    		f.security.focus();
    		return;
    	}
    	
    	if(echeck==0){
    		alert("인증번호를 확인해주세요");
    		f.security.focus();
    		return;
    	}
    	
    	content=f.userTel.value;
    	content = content.trim();
    	if(!/^[0-9]+$/.test(content)){
    		alert("전화번호는 -없이 작성해주세요");
    		f.userTel.focus();
    		return;
    	}
    	
    	content = f.postCode.value;
    	content = content.trim();
    	    if(!content) {
    	        alert("우편 번호를 입력하세요. ");
    	        f.postCode.focus();
    	        return;
    	    }
    	
    	if(f.userAddr1.value.length==0 && f.userAddr2.value.length==0){
    	        alert("도로명 또는 지번 주소를 입력하세요. ");
    	        f.userAddr1.focus();
    	        return;
    	}
    	
    	content = f.etc.value;
    	content = content.trim();
    	    if(!content) {
    	        alert("상세 주소를 입력하세요. ");
    	        f.etc.focus();
    	        return;
    	    }
 
    	if(f.userAddr1.value.length==0){
    		f.userAddr1.value="-";
    	}
    	
    	if(f.userAddr2.value.length==0){
    		f.userAddr2.value="-";
    	}
    	
    	f.action="<%=cp%>/myPage/update";
    	f.submit();
    	echeck=0;
    }

   
   function myForm_Postcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {

	            var roadAddr = data.roadAddress; 
	            var extraRoadAddr = ''; 

	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }

	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }

	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }

	            document.getElementById('postCode').value = data.zonecode;
	            document.getElementById("userAddr1").value = roadAddr;
	            document.getElementById("userAddr2").value = data.jibunAddress;

	        }
	    }).open();
	}
</script>
    
    
    
</head>

<body>
<div class="row">
<div class="col-3"></div>
 <div class="col-6" style="margin-top:20px; margin-bottom:30px;">
  	<div style="padding-bottom:20px">
  	<h1>회원 정보 (수정 / 탈퇴)</h1>
  		</div>
  		<div style="font-size:14px;">&nbsp;<b class="t_blue">*</b>표시된 사항은 수정이 제한됩니다.</div>
  		<form name="updateForm" method="POST">
			<table class="table left_tbl form_tbl">
				<colgroup>
					<col style="width:30%" />
					<col style="width:45%" />
					<col />
				</colgroup>
					<tr>
						<th scope="row"><b class="t_blue">*</b> 성함 (Name)</th>
						<td colspan="2">
							<input type="hidden" id="userIdx" name="userIdx"  readonly="readonly" value="${dto.userIdx}"/>
							<input type="text" id="userName" name="userName"  readonly="readonly" value="${dto.userName}"/>
						</td>
					</tr>	
					<tr>
						<th scope="row"><b class="t_blue">*</b> 아이디 (ID)</th>
						<td colspan="2">
							<input  name="userId" type="text" value="${dto.userId}" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_blue">*</b> 생년월일 (Birth)</th>
						<td colspan="2">
							<input type="text" id="userBirth" name="userBirth"  readonly="readonly" value="${dto.userBirth}"/>
						</td>
					</tr>					
					<tr>
						<th scope="row"><b class="t_red">*</b> 변경할 비밀번호<br>(Password)</th>
						<td colspan="2" style="padding-top: 18px;">
							<input name="userPwd" type="password" placeholder="PASSWORD">
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 비밀번호 확인<br>(Password Check)</th>
						<td colspan="2"  style="padding-top: 18px;">
							<input name="userPwdCheck" type="password" placeholder="PASSWORD">
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 이메일(Email)</th>
						<td>
							<input name="userEmail" type="text" placeholder=" 메일 주소를 정확히 입력해주세요 "  value="${dto.userEmail}">
						</td>
						<td style="text-align:center">
							<button type="button" onclick="sendEmail()" class='button btn_yellow'>메일 확인</button>
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 인증번호<br>(Security Number)</th>
						<td style="padding-top: 18px;">
							<input  name="security" type="text">
						</td>
						<td style="text-align:center; padding-top: 18px;">
							<button type="button" onclick="securityCheck()" class='button btn_yellow'>인증 확인</button>
 		 					<input  name="securityNum" type="hidden">
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 전화번호 (Tel)</th>
						<td colspan="2">
							<input type="text" id="userTel" name="userTel"  placeholder=" - 없이 숫자만 입력하세요" value="${dto.userTel}"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 주소 (Address)</th>
				 		<td colspan="2">
					 		<input type="text" id="postCode" name="postCode" placeholder="우편번호" style="margin-bottom:5px" value="${dto.postCode}">
							<button type="button" onclick="myForm_Postcode()" class='button btn_yellow' style="margin-bottom:5px">주소 검색</button>
							<input type="text" id="userAddr1" name="userAddr1" placeholder="도로명 주소" style="margin-bottom:5px; width:330px" value="${dto.userAddr1}"><br>
							<input type="text" id="userAddr2" name="userAddr2" placeholder="지번주소" style="margin-bottom:5px; width:330px" value="${dto.userAddr2}"><br>
							<input type="text" id="etc" name="etc" placeholder="상세주소를 입력해주세요" 	style="margin-bottom:5px; width:330px" value="${dto.etc}">
						</td>
			 		</tr>
			</table> 
				<div class="btn_wrap view_btn" style="margin-top:20px">
					<button type='button' class='button btn_yellow' onclick="updateSubmit()" style="margin-right:5px;">수정</button>
					<button type='button' class='button btn_red' onclick="deleteSubmit()">탈퇴</button>
				</div>

  			</form>
  		</div>
 <div class="col-3"></div>
 </div>
</body>
</html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>