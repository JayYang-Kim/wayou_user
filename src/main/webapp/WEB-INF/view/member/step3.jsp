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
	.layer .content{display:inline-block;width: 510px; height:345px;padding: 40px;background:#fff;border-radius: 40px;vertical-align:middle; border:1px solid efefef; margin-top:150px;}
	.layer .blank{display:inline-block;width:0;height:100%;vertical-align:middle}
	
    </style>
    
 <script type="text/javascript">
   function step3Submit(){
    	var f =document.joinForm;
    	var content;
    	
    	
    	content=f.userName.value;
    	content = content.trim();
    	if(!/^[가-힣]{2,4}$/.test(content)){
    		alert("성함을 띄어쓰기 없이 한글로 입력하세요");
    		f.userName.focus();
    		return;
    	}
    	
    	content=f.userTel.value;
    	content = content.trim();
    	if(!/^[0-9]+$/.test(content)){
    		alert("전화번호는 -없이 작성해주세요");
    		f.userTel.focus();
    		return;
    	}
    	
    	content = f.userBirth.value;
        content = content.trim();
    	    if(!content || !isValidDateFormat(content)) {
    	        alert("생년월일를 입력하세요[YYYY-MM-DD]. ");
    	        f.userBirth.focus();
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
    	
    	f.action="<%=cp%>/member/step3";
    	f.submit();
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
						<th scope="row"><b class="t_red">*</b> 성함 (Name)</th>
						<td colspan="2">
							<input type="text" id="userName" name="userName" style="width:200px" placeholder="한글로 입력하세요" value="${user.userName}"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 전화번호 (Tel)</th>
						<td colspan="2">
							<input type="text" id="userTel" name="userTel" style="width:200px" placeholder=" - 없이 숫자만 입력하세요" value="${user.userTel}"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 생년월일 (Birth)</th>
						<td colspan="2">
							<input type="text" id="userBirth" name="userBirth" style="width:200px" placeholder="YYYY-MM-DD" value="${user.userBirth}"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><b class="t_red">*</b> 주소 (Address)</th>
				 		<td colspan="2">
					 		<input type="text" id="postCode" name="postCode" placeholder="우편번호" style="margin-bottom:5px" value="${user.postCode}">
							<button type="button" onclick="myForm_Postcode()" class='button btn_yellow' style="margin-bottom:5px">주소 검색</button>
							<input type="text" id="userAddr1" name="userAddr1" placeholder="도로명 주소" style="margin-bottom:5px; width:330px" value="${user.userAddr1}"><br>
							<input type="text" id="userAddr2" name="userAddr2" placeholder="지번주소" style="margin-bottom:5px; width:330px" value="${user.userAddr2}"><br>
							<input type="text" id="etc" name="etc" placeholder="상세주소를 입력해주세요" 	style="margin-bottom:5px; width:330px" value="${user.etc}">
						</td>
			 		</tr>	
			</table> 
				<div class="btn_wrap view_btn" style="margin-top:10px">
					<button type='button' class='button btn_yellow' onclick="location.href='<%=cp%>/member/step1';">이전 단계</button>
					<button type='button' class='button btn_yellow' onclick="step3Submit()">가입 신청</button>
				</div>

  			</form>
  		</div>
  </div>
  <div class="blank"></div>
</body>
</html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>