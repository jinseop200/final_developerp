<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
</jsp:include>
<style>
.steps {
	text-align: center;
	margin-top: 30px;
}

.btn {
	height: 33px;
	font-size: 13px;
	display: inline-block;
}

.action {
	background: black;
}

.table-box {
	margin: 0 auto;
	padding: 100px 50px;
	text-align: center;
}

table {
	margin: 0 auto;
	border-collapse: separate;
	border-spacing: 50px 10px;
}

#table2 {
	margin: 0 auto;
}

.form-control {
	border-radius: 5px;
	border: 1px solid lightgray;
}

span {
	color: red;
}

.input-text {
	width: 350px;
}

#enroll-btn {
	float: right;
	background: black;
}

#button-group {
	padding: 0px 50px;
}

#button-group .step {
	margin-top: 0px;
}
.td-warn{
	font-size: 14px;
    color: rgba(221, 30, 47, 1)
}
</style>
<script>
<%--onload function--%>
$(()=>{
	var regExpId = /^[a-zA-Z0-9]{4,12}$/;
	var regExpPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
	var regExpName = /^[가-힣]{2,4}$/;
	var regExpEmail = /\w+@\w+\.\w+/;
	var regExpPhone = /^01[0179][0-9]{7,8}$/;
	

<%--아이디 중복검사 이후 아이디를 변경한 경우--%>
<%--change이벤트는 blur할 경우, 값변경 내역을 감지한다.--%>
$("#email").change(function(){
	$("#emailValid").val(0);
});
	

$("#password").keyup(function(event){
	var password = document.getElementById("password");
	
	if($("#password").val() == ""){
		$(".pwValidateWarning").html('비밀번호를 입력해 주시기 바랍니다.');
		$("#password").attr("style","border-bottom: 2px solid red");
	}
	if(!regExpPw.test(password.value)){
 		$(".pwValidateWarning").html('8~20자의 영문, 숫자, 특수기호를 입력해주세요.');
		$("#password").attr("style","border-bottom: 2px solid red");
	}
	else{
		$("#password").attr("style","border-bottom: 2px solid green");
		$(".pwValidateWarning").html('');
	}
});

$("#memberName").keyup(function(event){
	var memberName = document.getElementById("memberName");
	
	if($("#memberName").val() == ""){
		$(".nameValidateWarning").html('이름을 입력해 주시기 바랍니다.');
		$("#memberName").attr("style","border-bottom: 2px solid red");
	}
	if(!regExpName.test(memberName.value)){
		$(".nameValidateWarning").html('2~4자의 한글을 입력해 주시기 바랍니다.');
		$("#memberName").attr("style","border-bottom: 2px solid red");
	}
	else{
		$("#memberName").attr("style","border-bottom: 2px solid green");
		$(".nameValidateWarning").html('');
	}
});	

$("#email").keyup(function(event){
	var email = document.getElementById("email");
	
	if($("#email").val() == ""){
		$(".emailValidateWarning").html('이메일을 입력해 주시기 바랍니다.');
		$("#email").attr("style","border-bottom: 2px solid red");
	}
	if(!regExpEmail.test(email.value)){
		$(".emailValidateWarning").html('이메일 형식이 올바르지 않습니다.');
		$("#email").attr("style","border-bottom: 2px solid red");
	}
	else{
		$("#email").attr("style","border-bottom: 2px solid green");
		$(".emailValidateWarning").html('');
	}
});

$("#phone").keyup(function(event){
	var phone = document.getElementById("phone");
	
	if($("#phone").val() == ""){
		$(".phoneValidateWarning").html('전화번호를 입력해 주시기 바랍니다.');
		$("#phone").attr("style","border-bottom: 2px solid red");
	}
	if(!regExpPhone.test(phone.value)){
		$(".phoneValidateWarning").html('10~11자의 숫자를 입력해주세요.( - 없이 입력) ');
		$("#phone").attr("style","border-bottom: 2px solid red");
	}
	else{
		$("#phone").attr("style","border-bottom: 2px solid green");
		$(".phoneValidateWarning").html('');
	}
});	

$("#ssn1").keyup(function(event){
	var ssn1 = document.getElementById("ssn1");
	var ssn2 = document.getElementById("ssn2");
	
	if(($("#ssn1").val() == "")||$("#ssn2").val()==""){
		$(".ssn1ValidateWarning").html('주민번호를 기입해 주시기 바랍니다.');
		$("#ssn1").attr("style","border-bottom: 2px solid red");
	}
	if((isValidDate2(ssn1.value)==false)||(isValidDate2(ssn2.value)==false)){
		$(".ssn1ValidateWarning").html('주민번호형식이 올바르지 않습니다.');
		$("#ssn1").attr("style","border-bottom: 2px solid red");
	}
	else{
		$("#ssn1").attr("style","border-bottom: 2px solid green");
		$(".ssn1ValidateWarning").html('');
	}
});	



})

<%--회원가입 유효성검사함수(폼제출)--%>
function enrollValidate(){
	var memberName = document.getElementById("memberName");
	var email = document.getElementById("email");
	var phone = document.getElementById("phone");
	var ssn1 = document.getElementById("ssn1");
	var ssn2 = document.getElementById("ssn2");
	var $emailValid = $("#emailValid");
	
	<%--이름 유효성검사--%>
	if(!regExpTest(/^[가-힣]{2,4}$/, memberName, "이름은 2~4자의 한글만 사용 가능합니다.")){
        return false;
	}
    
	<%--주민번호 유효성검사--%>
    if(isValidDate(ssn1.value)==false){
    	return false;
    }
    if(isValidDate(ssn2.value)==false){
    	return false;
    }
    
    <%--이메일 유효성검사--%>
	if(!regExpTest(/\w+@\w+\.\w+/g, email, "이메일 형식이 올바르지 않습니다.")){
        return false;
	}
	<%--이메일 중복검사를 하지않았을경우--%>
	if($emailValid.val() == 0){
		alert("이메일 중복 검사 해주세요.");
		return false;
	}
	
    <%--전화번호 유효성검사--%>
	if(!regExpTest(/^01[0179][0-9]{7,8}$/, phone, "전화번호 형식이 올바르지 않습니다.")){
        return false;
	}

	return true;
}


<%--중복검사 ajax--%>
function emailDuplicatedCheck(){
	var regExpEmail = /\w+@\w+\.\w+/g;
	var email = document.getElementById("email");
	
	$.ajax({
		url: "<%=request.getContextPath()%>/member/memberEmailDuplicatedCheckServlet",
		type: "post",
		data: {email: $("#email").val()},
		dataType: "json",
		success: data => {
			console.log(data);
			
			if((data == 0) && (!$("#email").val() == "") && regExpEmail.test(email.value)){
				alert("사용가능한 이메일 입니다.");
				$("#email").attr("style","border-bottom: 2px solid #00c500");
				$("#emailValid").val(1);
				
			}
			/* if(($("#email").val() == "") || (!regExpEmail.test(email.value))){
				alert("이메일 형식이 올바르지 않습니다.");
				$("#email").attr("style","border-bottom: 2px solid red");
				$("#emailValid").val(0);
				
			} */
			else if(data ==1){
				alert("중복된 이메일 입니다.");
				$("#email").val("");
				$("#email").attr("style","border-bottom: 2px solid red");
				$("#emailValid").val(0);
			}
		},
		error : (jqxhr, textStatus, errorThrown)=>{
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
}


var regExp4 = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[01])$/;
var regExp5 = /^[1234]\d{6}$/;
if(!regExpTest(regExp4,ssn1,"숫자만 입력하세요."))
    return false;
if(!regExpTest(regExp5,ssn2,"숫자만 입력하세요."))
    return false;
if(!ssnCheck(ssn1.value,ssn2.value)){
    alert("올바른 주민번호가 아닙니다.");
    return false;
}



<%--유효성검사 함수--%>		
function regExpTest(regExp, el, msg){
	if(regExp.test(el.value)){
	    return true;
	}
	<%--적합한 문자열이 아닌 경우--%>
	alert(msg);
	el.value="";
	el.focus();
	return false;
}


</script>
<section>
	<div class="steps">
		<hr>
		<h2>
			<strong>신규 회원가입(개인정보 입력)</strong>
		</h2>
		<hr>
	</div>

	<form action="${pageContext.request.contextPath}/member/memberEnrollEnd.do" 
        	  name="memberEnrollFrm" 
        	  method="post" 
        	  onsubmit="return enrollValidate();" >
		<div class="table-box">
			<table>
				<tr>
					<td>이메일주소<span>*</span></td>
					<td>
						<input class="form-control input-text" type="email"
						name="email" id="email" placeholder="example@bluemoon.com" />
					</td>
					<td>
						<input type="button" class="btn btn-outline-secondary" onclick="emailDuplicatedCheck();"
						id="btn-email-already" value="중복확인" />
						<input type="hidden" id="emailValid" value="0"/>
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="emailValidateWarning td-warn"></td>
					<td></td>
				</tr>
				<tr>
					<td><input class="form-control input-text" type="hidden" 
						name="password" id="password" placeholder="비밀번호" value="1111" /></td>
				</tr>
				<tr>
					<td>성명<span>*</span></td>
					<td><input class="form-control input-text" type="text"
						name="memberName" id="memberName" placeholder="이름 입력" /></td>
				</tr>
				<tr>
					<td></td>
					<td class="nameValidateWarning td-warn"></td>
					<td></td>
				</tr>
				<tr>
					<td>부서명<span>*</span></td>
					<td>
						<select name="dept" id="dept" >
							<option value="" selected disabled>부서명</option>
							<c:forEach items="${dept}">
								<option value="${dept.id}" >${dept.title}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>				
				<tr>
					<td>직급명<span>*</span></td>
					<td>
						<select name="job" id="job" >
							<option value="" selected disabled>직급명</option>
							<c:forEach items="${job}">
								<option value="${job.code}" >${job.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>				
				<tr>
					<td></td>
				</tr>				
				<tr>
					<td>주민번호<span>*</span></td>
					<td><input class="form-control input-text" type="text"
						name="ssn1" id="ssn1" placeholder="ex)900101" />-
						<input class="form-control input-text" type="password"
						name="ssn2" id="ssn2" placeholder="ex)1234567" /></td>
				</tr>
				<tr>
					<td></td>
					<td class="ssn1ValidateWarning td-warn"></td>
					<td></td>
				</tr>
				
				<tr>
					<td>전화번호<span>*</span></td>
					<td>
						<input type="text" class="form-control input-text"
						name="phone" id="phone" placeholder=" (-)없이 입력" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="phoneValidateWarning td-warn"></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div id="button-group">
			<input type="submit" id="enroll-btn" class="step" value="가입하기">
		</div>
	</form>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>