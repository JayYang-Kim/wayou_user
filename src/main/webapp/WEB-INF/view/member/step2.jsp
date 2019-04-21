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
    

    <style type="text/css">
    .layer{position:absolute;top:0;left:0;width:100%;height:100%;text-align:center; background:#f5f6f7}
	.layer .content{display:inline-block;width: 510px; height:550px;padding: 40px;background:#fff;border-radius: 40px;vertical-align:middle; border:1px solid efefef; margin-top:50px;}
	.layer .blank{display:inline-block;width:0;height:100%;vertical-align:middle}
	
    </style>
    
 <script type="text/javascript">
   var icheck=0;
   var echeck=0;
   
   function idCheck(){
	   var url="<%=cp%>/member/idCheck";
	   var f=document.joinForm;
	   var userId=f.userId.value;
	   if(!/^[A-za-z]/g.test(userId) || userId.length==0){
		   alert("아이디를 작성해주세요");
		   f.userId.focus();
		   return;
	   }
	   var data="userId="+userId;
	   $.ajax({
		  type:"GET",
		  url:url,
		  data:data,
		  dataType:"JSON",
		  success:function(data){
			  var result=data.result;
			  if(result==1){
					alert("해당 아이디는 이미 존재합니다.");
					f.userId.focus();
					return;
			  } else if(result==0){
			  alert("중복 검사 완료");
			  icheck=1;
			  }
		  }, beforeSend:function(e){
			  e.setRequestHeader("AJAX",true);
		  }, error:function(e){
				if(e.status==403){
					location.href="<%=cp%>/member/join";
					return;
				} console.log(e.responseText);
		  }
	   });
   }
   
   function securityCheck(){
		 var f=document.joinForm;
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
	   var f=document.joinForm;
	   var email=f.userEmail.value;
	   var url="<%=cp%>/member/emailCheck";
	   if(!/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test(email)){
		   alert("이메일 주소를 작성해주세요");
		   f.userEmail.focus();
		   return;
	   }
	   var data="email="+email;
	   $.ajax({
		  type:"GET",
		  url:url,
		  data:data,
		  dataType:"JSON",
		  success:function(data){
			  var result=data.result;
			  if(result=="false")
				  alert("이메일 전송 실패");
			  f.securityNum.value=data.securityNum;
			  alert("인증 번호가 남긴 이메일을 보냈습니다.");
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
 
   function submit(){
    	var f =document.joinForm;
    	var content;
    	
    	content=f.userId.val();
    	content = content.trim();
    	if(!content){
    		alert("이름을 입력하세요");
    		f.userId.focus();
    		return;
    	}
    	
    	content=f.userPwd.val();
    	content=content.trim();
    	if(!content){
    		alert("비밀번호를 입력하세요");
    		f.userPwd
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
    	
    	content=f.userEmail.value
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
    	
    	content=f.usertel.value;
    	if(!/^[0-9]+$/.test(content)){
    		alert("전화번호는 -없이 작성해주세요");
    		f.tel.focus();
    		return;
    	}
    	
    	content = f.userBirth.value;
        content = content.trim();
    	    if(!content || !isValidDateFormat(content)) {
    	        alert("생년월일를 입력하세요[YYYY-MM-DD]. ");
    	        f.adminBirth.focus();
    	        return;
    	    }
    	
    	content = f.postCode.value;
    	content = content.trim();
    	    if(!content) {
    	        alert("우편 번호를 입력하세요. ");
    	        f.postCode.focus();
    	        return;
    	    }
    	content = f.userAddr1.value;
    	content = content.trim();
    	    if(!content) {
    	        alert("도로명 주소를 입력하세요. ");
    	        f.address1.focus();
    	        return;
    	    }
    	content = f.userAddr2.value;
    	content = content.trim();
    	    if(!content) {
    	        alert("지번 주소를 입력하세요. ");
    	        f.address2.focus();
    	        return;
    	    }
    	content = f.etc.value;
    	content = content.trim();
    	    if(!content) {
    	        alert("상세 주소를 입력하세요. ");
    	        f.etc.focus();
    	        return;
    	    }
    	
    	if(icheck==0){
    		alert("아이디 중복 확인해주세요");
    		f.security.focus();
    		return;
    	}
    	
    	if(echeck==0){
    		alert("인증번호를 확인해주세요");
    		f.security.focus();
    		return;
    	}
    	
    	f.action="<%=cp%>/member/complete";
    	f.submit;
    	icheck=0;
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
<div class="layer">
  <div class="content">
  	<div style="padding-bottom:20px">
  	<h1>회원가입</h1>
  		</div>
  		<form name="joinForm" method="POST">
			<table class="table left_tbl form_tbl">
				<colgroup>
					<col style="width:30%" />
					<col style="width:50%" />
					<col />
				</colgroup>			
					<tr>
						<th scope="row"><b class="t_red">*</b> 아이디 (ID)</th>
						<td>
							<input  name="userId" type="text">
						</td>
						<td style="text-align:center">
							<button id="idconfirm" name="idconfirm" onclick="idCheck()" type='button' class='button btn_yellow'>중복 검사</button>
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 비밀번호(Password)</th>
						<td colspan="2">
							<input name="userPwd" type="password" placeholder="PASSWORD">
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 비밀번호 확인<br>(Password Check)</th>
						<td colspan="2">
							<input name="userPwdCheck" type="password" placeholder="PASSWORD">
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 이메일(Email)</th>
						<td>
							<input name="userEmail" type="text" placeholder=" 메일 주소를 정확히 입력해주세요 " style="width:200px">
						</td>
						<td style="text-align:center">
							<button type="button" onclick="sendEmail()" class='button btn_yellow'>메일 확인</button>
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 인증번호<br>(Security Number)</th>
						<td>
							<input  name="security" type="text">
						</td>
						<td style="text-align:center">
							<button type="button" onclick="securityCheck()" class='button btn_yellow'>인증 확인</button>
 		 					<input  name="securityNum" type="hidden">
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 전화번호 (Tel)</th>
						<td colspan="2">
							<input type="text" id="userTel" name="userTel" style="width:200px" placeholder=" - 없이 숫자만 입력하세요" />
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 생년월일 (Birth)</th>
						<td colspan="2">
							<input type="text" id="userBirth" name="userBirth" style="width:200px" placeholder=" - 없이 숫자만 입력하세요" />
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 주소 (Address)</th>
				 		<td colspan="2">
					 		<input type="text" id="postCode" placeholder="우편번호" style="margin-bottom:5px">
							<button type="button" onclick="myForm_Postcode()" class='button btn_yellow' style="margin-bottom:5px">주소 검색</button>
							<input type="text" id="userAddr1" name="userAddr1" placeholder="도로명 주소" style="margin-bottom:5px; width:330px"><br>
							<input type="text" id="userAddr2" name="userAddr2" placeholder="지번주소" style="margin-bottom:5px; width:330px"><br>
							<input type="text" id="etc" name="etc" placeholder="상세주소를 입력해주세요" 	style="margin-bottom:5px; width:330px">
						</td>
			 		</tr>	
			</table> 
				<div class="btn_wrap view_btn">
					<button type='button' class='button btn_yellow' onclick="submit()">완료</button>
				</div>

  			</form>
  		</div>
  </div>
  <div class="blank"></div>
</body>
</html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>