<%@page import="com.dev.erp.common.util.Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<body>
<div class="form-row" id="msgTypeRadioBtns">
	<div class="form-check">
	  <input type="radio" class="form-check-input" id="messageGroupExample1" name="messageRadios" value="3" checked>
	  <label class="form-check-label" for="messageGroupExample1">전체</label>&nbsp;&nbsp;&nbsp;
	</div>
	
	<!-- Group of material radios - option 2 -->
	<div class="form-check">
	  <input type="radio" class="form-check-input" id="messageGroupExample2" name="messageRadios" value="2">
	  <label class="form-check-label" for="messageGroupExample2">미확인</label>&nbsp;&nbsp;&nbsp;
	</div>
	
	<!-- Group of material radios - option 3 -->
	<div class="form-check">
	  <input type="radio" class="form-check-input" id="messageGroupExample3" name="messageRadios" value="1">
	  <label class="form-check-label" for="materialGroupExample3">확인</label>
	</div>
	<div  class="form-check" style="padding-left:222px;">
	  <input type="radio" class="form-check-input" id="messageGroupExample4" name="messageRadios" value="4">
	  <label class="form-check-label" for="materialGroupExample4">보낸쪽지함</label>
	
	</div>
</div>
<div style="text-align:right; padding-top:5px">
	<button class="btn btn-primary" type="button" id="message-insert-button">신규 </button>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <table class="table table-bordered message-list-table" id="dataTable" width="100%" cellspacing="0">
       <thead>
         <tr>
           <th>No</th>
           <th>제목</th>
           <th>보낸사람</th>
           <th>보낸날짜</th>
           <th>상태</th>
         </tr>
       </thead>
	   <tbody>
	   </tbody>
     </table>
     <div class="pageBar"></div>
<%--      ${pageBar} --%>
</body>

<style>
.message-list-table tbody tr:hover td{
	cursor : auto;
	background-color:#ccc;
}

</style>

<script>
$(()=>{
	messagePage(0);
	
});


$(".message-list-table tbody").on('dblclick','tr',function(){
	var value = $(this).children().eq(1).html();
	var messageValue= $(this).attr("id");
	console.log(value);
	console.log(messageValue);
	var docApproval = $("[name=docLastapproval]").val();
	var docApproval1 = $("[name=docLastapproval1]").val();
	var docApproval2 = $("[name=docLastapproval2]").val();
	var docApproval3 = $("[name=docLastapproval3]").val();
	if( docApproval==""){
		$("[name=docLastapproval]").val(value);
		
	}else if(docApproval1==""){
		$("[name=docLastapproval1]").val(value);
	}else if(docApproval2==""){
		$("[name=docLastapproval2]").val(value);
	}else if(docApproval3==""){
		$("[name=docLastapproval3]").val(value);
	}
	$("#searchDocument").modal('hide');
});


function messagePage(a){
	$(".meHide").hide();
	console.log("a==="+a);
	var url_="";
	var empName="${memberLoggedIn.empName}";
	if(a==0) {
		url_ = "${pageContext.request.contextPath}/message/messageListPage.do?cPage=1&empName=${memberLoggedIn.empName}";
	}
	else {
		url_="${pageContext.request.contextPath}/message/"+a;
	}
	
	
	$.ajax({
		url : url_,
		dataType : "json",
		success : data => {
			var list = data.list;
			console.log(empName);
			$(".message-list-table tbody").children().remove();
			for(var i in list ) {
				let m = list[i];
				var readYn ="";
				if(m.readYn=="y"){
					readYn="확인";
				}else{
					readYn="미확인";
				}
				console.log(m);	
				if(m.sender == empName || m.reciever == empName){
					$(".message-list-table tbody").append("<tr id='"+m.meNo+"'><td>"+(Number(i)+(data.cPage-1)*7+1)+"</td><td>"+m.meTitle+"</td><td>"+m.sender+"</td><td>"+m.regDate+"</td><td>"+readYn+"</td></tr>");
				}else if(m==null && (m.sender!=empName || m.reciever!=empName)){
					$(".message-list-table tbody").append("<tr><td colspan='5' style='text-align:center;'>조회된 쪽지가 없습니다.</td></tr>");
				}
			}
			$(".pageBar").html(data.pageBar);
			$("span.page-link").attr('onclick',"messagePage(this.id)");
		},
		error:(x,s,e)=>{
			console.log("ajax요청실패",x,s,e);
		}
		
	});
	
}

$("#message-insert-button").click(function(){
 $('.controll-modal-body-insertMessage').load("${pageContext.request.contextPath}/message/insertMessageForm.do",function(){
        $('#insertMessage').modal({backdrop: 'static', keyboard: false});
        $('#insertMessage').modal({show:true});
        $(".modal-backdrop.in").css('opacity', 0.4);
	});
});




</script>

</html>