<!DOCTYPE html>
<html lang="en" >
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap" rel="stylesheet">

<head>
  <meta charset="UTF-8">
  
  <title>DevelopERP</title>

</head>


<body>
<!-- 타이핑 타이틀 모션 부분 -->
<div id = "typing">
	<br /><br />
	<span id="animate" style="font-weight: 500; font-size: 70pt;"></span>
	<div id="bar"></div>
</div>

<!-- 로그인 부분 -->
<div class="login">
	<div class="container" id="container">
	
        <div class="form-container sign-up-container">
            <form action="#">
                <h1>회원가입</h1>
                <div class="social-container">
                    <a href="#" class="social"><img src="${pageContext.request.contextPath }/resources/images/btn_naver.gif" /></a>
                    <a href="#" class="social"><img src="${pageContext.request.contextPath }/resources/images/btn_kakao.gif" /></a>
                    <a href="#" class="social"><img src="${pageContext.request.contextPath }/resources/images/btn_facebook.gif" /></a>
                </div>
                <span>이메일로 회원가입하기</span>
                <input type="text" placeholder="Name" />
                <input type="email" placeholder="Email" />
                <input type="password" placeholder="Password" />
                <br />
                <button>회원가입 하기</button>
            </form>
        </div>
        
        <div class="form-container sign-in-container">
            <form action="#">
                <h1>로그인</h1>
                <div class="social-container">
                    <a href="#" class="social"><img src="${pageContext.request.contextPath }/resources/images/btn_naver.gif" /></a>
                    <a href="#" class="social"><img src="${pageContext.request.contextPath }/resources/images/btn_kakao.gif" /></a>
                    <a href="#" class="social"><img src="${pageContext.request.contextPath }/resources/images/btn_facebook.gif" /></a>
                </div>
                <span>계정으로 로그인하기</span>
                <input type="email" placeholder="Email" />
                <input type="password" placeholder="Password" />
                <a href="#">비밀번호를 잊으셨나요?</a>
                <br />
                <button id="loginButton">로그인 하기</button>
            </form>
        </div>
        
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                	<%-- 로고 이미지 삽입 --%>
                	<img src="${pageContext.request.contextPath }/resources/images/logo.jpg"  width=200px;/>
                    <br />
                    <h1>당신을 위한 ERP</h1>
                	<br />
                    <span>지금 바로 기업에 최적화된 </span>
                    <span>업무환경을 경험하세요!</span>
                    <br />
                    <button class="ghost" id="signIn">로그인 페이지</button>
                </div>
                <div class="overlay-panel overlay-right">
                	<%-- 로고 이미지 삽입 --%>
                	<img src="${pageContext.request.contextPath }/resources/images/logo.jpg"  width=200px;/>
                    <br />
                    <h1>당신을 위한 ERP</h1>
                	<br />
                    <span>지금 바로 기업에 최적화된 </span>
                    <span>업무환경을 경험하세요!</span>
                    <br />
                </div>
            </div>
        </div>
        
    </div>
</div>
<script  src="./script.js"></script>

<!-- footer 부분 -->
<footer>
	<p>&lt;Copyright 2020. <strong>LEFT123</strong>. All rights reserved.&gt;</p>
</footer>

</body>




<%-- JS 부분 --%>
<%-- 타이핑 타이틀 모션 부분 --%>
<script type="text/javascript">
window.onload = myMove;
document.addEventListener('visibilitychange', function(){
    clearInterval(i);
    clearInterval(j); 
    document.getElementById("bar").style.display = "block";
    myMove(); 
});

function myMove() {
  var text = document.getElementById("animate");
  var bar = document.getElementById("bar");
  var str = "DevelopERP";
  var pos = 0;
  var count = 0;
  bar.style.display = "block";
  
  function flash(duration) {
   j = window.setInterval(function() {
        bar.style.display = (bar.style.display == 'none' ? '' : 'none');
   }, 500);
   setTimeout(function() {
      clearInterval(j); 
      bar.style.display = "block";
   }, duration); 
  };
  
  i = window.setInterval(frame, 150);
  function erase() {
    clearInterval(j); 
    clearInterval(i);
    i = window.setInterval(frame, 50);
  }
  function frame() {
    if (pos < 10 || (pos >= 20 && pos < 31)) {
      count++;
      pos++; 
      text.innerHTML = str.substring(0, count);
      bar.style.left = (text.offsetWidth+15) + 'px';
    } else if(pos > 47 && pos <= 63) {
      count--;
      pos++; 
      text.innerHTML = str.substring(0, count);
      bar.style.left = (text.offsetWidth+15) + 'px';
    } else if (pos == 80) {
      clearInterval(i);
      pos = 0; 
      i = window.setInterval(frame, 150);
    } else if (pos == 47) {
      erase();
      pos++;
    } else if (pos == 6 || pos == 31) {
      flash(100);
      pos++;
    } else {
      pos++
    }
  }
}
$("#loginButton").click(function(){
	location.href = "${pageContext.request.contextPath}/main/main.do";
})
</script>

<%-- 로그인 부분 --%>
<script>
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () =>
container.classList.add('right-panel-active'));

signInButton.addEventListener('click', () =>
container.classList.remove('right-panel-active'));
</script>


</html>