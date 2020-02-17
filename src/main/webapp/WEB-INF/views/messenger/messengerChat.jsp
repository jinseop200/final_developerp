<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div>
	<ul class="list-group list-group-flush" id="data">
	<c:forEach items="${chatList}" var="m">
		<li class="list-group-item">${m.email }: ${m.msg }</li>
	</c:forEach>	
	</ul>
</div>
<div class="input-group mb-3">
  <input type="text" id="message" class="form-control" placeholder="Message">
  <div class="input-group-append" style="padding: 0px;">
    <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('');
	});
	$("#message").keydown(function(key) {
		if (key.keyCode == 13) {// 엔터
			sendMessage();
			$('#message').val('')
		}
	});

	//window focus이벤트핸들러 등록
	$(window).on("focus", function() {
		console.log("focus");
		lastCheck();
	});
});

//웹소켓 선언
//1.최초 웹소켓 생성 url: /stomp
var socket = new SockJS('<c:url value="/messenger" />');
console.log(socket);
var stompClient = Stomp.over(socket);

stompClient.connect({}, function(frame) {
	console.log('connected stomp over sockjs');
	console.log(frame);
	
	//사용자 확인
	lastCheck();
	
	// subscribe message
	stompClient.subscribe('/chat/${chatId}', function(message) {
		console.log("receive from /chat/${chatId} :", message);
		let messsageBody = JSON.parse(message.body);
		$("#data").append("<li class=\"list-group-item\">"+messsageBody.email+" : "+messsageBody.msg+ "</li>");
	});

});

function sendMessage() {

	let data = {
		chatId : "${chatId}",
		email : "${memberLoggedIn.email}",
		msg : $("#message").val(),
		time : new Date().getTime(),
		type: "MESSAGE"
	}
	console.log("123123124"+data);

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
