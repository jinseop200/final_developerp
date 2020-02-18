<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div>
	<ul class="list-group list-group-flush" id="data">
	<c:forEach items="${chatList}" var="m" varStatus="vs">
		<c:if test="${memberLoggedIn.email == m.email }">
			<li class="list-group-item right email">${m.email}</li>
			<li class="list-group-item right msg">${m.msg }</li>
		</c:if>
		<c:if test="${memberLoggedIn.email != m.email }">
			<li class="list-group-item left email">${m.email }</li>
			<li class="list-group-item left msg">${m.msg }</li>
		</c:if>
	</c:forEach>	
	</ul>
</div>

<style>
.list-group-item.right{
	width:250px;
	right:-51%;
	overflow:hidden;
	word-wrap:break-word;
}
.list-group-item.right.email{	
	text-align:right;
	border-bottom:0;
	padding-left:0;
	color:black;
}
.list-group-item.right.msg{
	padding-top:0;
	border:0;
	text-align:right;
	width:250px;
}
.list-group-item.left{
width:250px;
overflow:hidden;
word-wrap:break-word;
}
.list-group-item.left.email{	
	text-align:left;
	border-bottom:0;
	color:black;
}
.list-group-item.left.msg{
padding-top:0;
	border:0;
	text-align:left;
	width:250px;
}
.controll-modal-body-messengerChat{
	width:100%;
	height:600px;
	overflow-y:auto;
}
</style>
<script type="text/javascript">
//웹소켓 선언
//1.최초 웹소켓 생성 url: /stomp
var socket = new SockJS('<c:url value="/messenger" />');
console.log(socket);
var stompClient = Stomp.over(socket);

stompClient.connect({}, function(frame) {
	console.log('connected stomp over sockjs');
	console.log(frame);
	
	//사용자 확인
	
	// subscribe message
	stompClient.subscribe('/chat/${chatId}', function(message) {
		var email = "${memberLoggedIn.email}";
		console.log("receive from /chat/${chatId} :", message);
		let messsageBody = JSON.parse(message.body);
		if(email==messsageBody.email){
			$("#data").append("<li class=\"list-group-item right email\" >"+messsageBody.email+ "</li>");
			$("#data").append("<li class=\"list-group-item right msg\" >"+messsageBody.msg+ "</li>");
		}else{
			$("#data").append("<li class=\"list-group-item left email\" >"+messsageBody.email+ "</li>");
			$("#data").append("<li class=\"list-group-item left msg\" >"+messsageBody.msg+ "</li>");
		}
		let $msgContainer = $(".controll-modal-body-messengerChat");
		$msgContainer.scrollTop($msgContainer.prop('scrollHeight'));
	});

});
$(document).ready(function() {
	
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('');
		$('#message').focus();
	});
	$("#message").keydown(function(key) {
		if (key.keyCode == 13) {// 엔터
			sendMessage();
			$('#message').val('')
			$('#message').focus();
		}
	});

	//window focus이벤트핸들러 등록
	$(window).on("focus", function() {
		console.log("focus");
		lastCheck();
	});
	let $msgContainer = $(".controll-modal-body-messengerChat");
	$msgContainer.scrollTop($msgContainer.prop('scrollHeight'));


});


function sendMessage() {

	let data = {
		chatId : "${chatId}",
		email : "${memberLoggedIn.email}",
		msg : $("#message").val(),
		time : new Date().getTime(),
		type: "MESSAGE"
	}

	stompClient.send('<c:url value="/chat/${chatId}" />', {}, JSON.stringify(data));
}
function lastCheck() {
    let data = {
        chatId : "${chatId}",
        email : "${memberLoggedIn.email}",
        time : new Date().getTime()
    }
    stompClient.send('<c:url value="/lastCheck" />', {}, JSON.stringify(data));
}

</script>
