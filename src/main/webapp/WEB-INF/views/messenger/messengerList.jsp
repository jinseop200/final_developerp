<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
table.table th, table.table td {text-align: center;}
.messenger-list-table tbody tr:hover td{
	cursor : pointer;
	background-color:#ccc;
}
.message-list-table tbody tr td{
	text-align:center;
}
.modal-content{
	width:550px;
	height:665px; 
}
.nav-link{
	cursor:pointer;
}
.pageBar{
	cursor:pointer;
}
.col-md-6 .mb-3 .col-md-6 .mb-3 .mb-4{
	width:350px !important;
}
.form-control {
    display:inline;
}
</style>
<div class="form-row" style="width:750px">
                    <div class="col-md-6 mb-3 col-md-6 mb-3">
                        <label for="insertSender">검색</label>&nbsp;&nbsp;
                        <input type="text" id="insertSender" style="width:290px;" name="insertSender" class="form-control bg-light small" required  aria-label="Search" aria-describedby="basic-addon2">
                    </div>
                    <div class="col-md-6 mb-3">
                        <button class="btn btn-primary messenger" type="button">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                </div>
<table class="table">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">회원아이디</th>
      <th scope="col">메세지</th>
      <th scope="col">안읽은 메세지수</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${recentList }" var="m" varStatus="vs">
    <tr chatNo='<c:out value="${m.CHATID}.${m.EMAIL}"/>'>  <%-- el의 문자열 더하기 연산대신 jstl out태그 사용 --%>
      <th scope="row">${vs.count}</th>
      <td><a href="javascript:goChat('${m.CHATID}')">${m.EMAIL}</a></td>
      <td>${m.MSG }</td>
      <td><span class="badge badge-light">${m.CNT }</span></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
			<%--searhMessengerList  modal --%>
			<div class="modal" tabindex="-1" role="dialog" id="searhMessengerList">
			  <div class="modal-dialog" role="document">
			      <div class="modal-content">
			      <div class="modal-header">
			          <h5 class="modal-title control-title-searhMessengerList" id="searhMessengerList"> </h5>
			      </div>
			      <div class="modal-body controll-modal-body-searhMessengerList">
			      </div>
			      <div class="modal-footer">
			          <button type="button" class="btn btn-primary searhMessengerList-end">닫기</button>
			      </div>
			      </div>
			  </div>
			</div>
			<%--messengerChat modal --%>
			<div class="modal" tabindex="-1" role="dialog" id="messengerChat">
			  <div class="modal-dialog" role="document">
			      <div class="modal-content">
			      <div class="modal-header">
			          <h5 class="modal-title control-title-messengerChat" id="messengerChat"> </h5>
			      </div>
			      <div class="modal-body controll-modal-body-messengerChat">
			      </div>
			      <div class="modal-footer">
			          <button type="button" class="btn btn-primary messengerChat-end">닫기</button>
			      </div>
			      </div>
			  </div>
			</div>
			
<script>
$(()=>{
	$(".btn-primary.messenger").click(function(){
		 $('.controll-modal-body-searhMessengerList').load("${pageContext.request.contextPath}/messenger/messengerSelectList.do",function(){
	        $('#searhMessengerList').modal({backdrop: 'static', keyboard: false});
	        $('#searhMessengerList').modal({show:true});
	        $(".modal-backdrop.in").css('opacity', 0.4);
	       	$(".control-title-searhMessengerList").html("");
	        $(".control-title-searhMessengerList").html("회원리스트");
		});
	       
	});
	$(".messengerChat-end").click(function(){
		$("#messengerChat").modal('hide');
	})
	$(".searhMessengerList-end").click(function(){
		$("#searhMessengerList").modal('hide');
	})
	
});


function goChat(chatId){
	console.log(chatId);
	$('.controll-modal-body-messengerChat').load("${pageContext.request.contextPath}/messenger/"+chatId+"/messengerChat.do/",function(){
        $('#messengerChat').modal({backdrop: 'static', keyboard: false});
        $('#messengerChat').modal({show:true});
        $(".modal-backdrop.in").css('opacity', 0.4);
       	$(".control-title-messengerChat").html("");
        $(".control-title-messengerChat").html("채팅방");
	});
};
function lastCheck() {
    let data = {
        chatId : "${chatId}",
        email : "${memberLoggedIn.email}",
        time : new Date().getTime()
    }
    stompClient.send('<c:url value="/lastCheck" />', {}, JSON.stringify(data));
}


</script>
