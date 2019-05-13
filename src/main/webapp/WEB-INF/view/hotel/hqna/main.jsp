<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">

$(function(){
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  // alert(e.target); // newly activated tab
		  // e.relatedTarget // previous active tab
		  var tab=$(this).attr("aria-controls");
		  var id=$("#tabContent"+tab);
		  
		  var url;
		  if(tab=="1") {
			  url="<%=cp%>/hotel/hqna/listTab1";
		  } else if(tab=="2") {
			  url="<%=cp%>/hotel/hqna/tab2";
		  }
		  
		  viewTabContent(id, url);
	});	
});

function viewTabContent(id, url) {
	$.post(url, {}, function(data){
		  id.html(data);
	  });
}


//전역변수
var pageNo = 1;
var key = "all";
var value = "";

function ajaxHTML(url, type, query, id) {//url에 query를갖고 처리한 data를 리턴한 jsp에 뿌려주고 해당 jsp의 html을 해당 id자리에 뿌려줌

	$.ajax({ 
		type:type
		,url:url
		,data:query
		,success:function(data){
			$("#"+id).html(data);
		
		}
		,beforeSend:function(e) {
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e) {
			if(e.status==403){  
				location.href="<%=cp%>/member/login";
				return;
			}
			console.log(e.responseText);
		}		
	});
}

function ajaxJSON(url, type, query, mode) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"JSON"
		,success:function(data){
			if(mode=="delete") {
				if(data.state=="false"){
					alert("삭제 권한이 없습니다.");
				}else{
					listPage(pageNo);
				}
			}
		}
		,beforeSend:function(e) {
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e) {
			if(e.status==403){  
				location.href="<%=cp%>/member/login";
				return;
			}
			console.log(e.responseText);
		}		
	});
}

function ajaxJSON2(url, query, mode) {
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"JSON"
		,success:function(data) {
			listPage(pageNo);
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

$(function () {
	listPage(1);
});

function listPage(page) {

	//페이징
	pageNo=page; //이렇게 페이지를 담아야 정확하게 몇페이지인지 볼수있음
	
	var id="tabContent1";
	var url="<%=cp%>/hotel/hqna/listTab1";
	var query="pageNo="+page;
	if(value!="") {
		query +="&key="+key+"&value="+encodeURIComponent(value);
	}
	
	ajaxHTML(url, "get", query, id);
}

function reloadHqna() {
	key=$("all")
	value="";
	
	listPage(1);
}

function sendHqna(mode) {
	alert(mode);
	var f=document.hqnaForm;
	
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
	var query=$("form[name=hqnaForm]").serialize();

	ajaxJSON2(url, query, mode);
}

function articleHqna(qnaCode) {
	var id="tabContent1";
	var url="<%=cp%>/hotel/hqna/article";
	var query="qnaCode="+qnaCode+"&pageNo="+pageNo;
	if(value!="") {
		query +="&key="+key+"&value="+encodeURIComponent(value);
	}

	ajaxHTML(url, "get", query, id);
}

function insertHqna() {
	var url="<%=cp%>/hotel/hqna/created";
	$("#tabContent1").load(url);
}

function updateHqna(qnaCode) {

	var url="<%=cp%>/hotel/hqna/update";
	var query="qnaCode="+qnaCode+"&pageNo="+pageNo;
	
	if( value !="") {
		query +="&key="+key+"&value="+encodeURIComponent(value);
	}
	
	ajaxHTML(url, "get", query, "tabContent1");
}

function deleteHqna(qnaCode) {
	if( !confirm("삭제하시겠습니까?")){
		return;
	}
	
	var url="<%=cp%>/hotel/hqna/delete";
	var query="qnaCode="+qnaCode;
	
	ajaxJSON(url, "post", query, "delete");
}

function serchList() {
	key=$("#key").val();
	value=$("#value").val();
	
	listPage(1);
}

</script>
	
<div style="margin: 30px auto; width:60%;">
	<div role="tabpanel">
	  <ul id="myTab" class="nav nav-tabs" role="tablist">
	      <li role="presentation"  class="active"><a href="#tabContent1" aria-controls="1" role="tab" data-toggle="tab">질&nbsp;문&nbsp;과&nbsp;답&nbsp;변</a></li>
	      <li role="presentation"><a href="#tabContent2" aria-controls="2" role="tab" data-toggle="tab">자&nbsp;주&nbsp;하&nbsp;는&nbsp;질&nbsp;문</a></li>
	  </ul>
	
	  <div class="tab-content">
	      <div role="tabpanel" class="tab-pane active" id="tabContent1"></div>
	      <div role="tabpanel" class="tab-pane" id="tabContent2"></div>
	      <div role="tabpanel" class="tab-pane" id="tabContent3"></div>
	  </div>
    </div>
</div>	
