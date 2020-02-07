<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>

$(()=>{
	$(".future_password").hide();
});

$("#password_Chk").keyup(function(event){
	var password_Chk = document.getElementById("password_Chk");
	
	if($("#password_Chk").val() == $("#password_Change").val()){
		$(".passwordChkValidateWarning").html('일치합니다');
		$(".passwordChkValidateWarning").attr("style","color:#00c500");
		$("#password_Chk").attr("style","border-bottom: 2px solid #00c500");
		$("#passwordValid").val(1);
	}
	else {
		$(".passwordChkValidateWarning").html('일치하지않습니다.');
		$(".passwordChkValidateWarning").attr("style","red");
		$("#password_Chk").attr("style","border-bottom: 2px solid red");
		$("#passwordValid").val(0);
	}
});	
$("#password_Change").keyup(function(event){
	
	if(($("#password_Chk").val() == $("#password_Change").val())&& $("#password_Chk").val()!=null){
		$(".passwordChkValidateWarning").html('일치합니다');
		$(".passwordChkValidateWarning").attr("style","color:#00c500");
		$("#password_Chk").attr("style","border-bottom: 2px solid #00c500");
		$("#passwordValid").val(1);
	}
	else if($("#password_Chk").val()!=null && ($("#password_Chk").val() != $("#password_Change").val())){
		$(".passwordChkValidateWarning").html('일치하지않습니다.');
		$(".passwordChkValidateWarning").attr("style","red");
		$("#password_Chk").attr("style","border-bottom: 2px solid red");
		$("#passwordValid").val(0);
	}
});	

function passwordCheck(){
	var password=$("#password").val().trim();
	var email=$("#email").val().trim();
	console.log(email);
	
	$.ajax({
		url: "${pageContext.request.contextPath}/member/memberPasswordCheck.do",
		data:{password:password, email:email},
		dataType: "json",
		success: data => {
			console.log(data);
			
			if(data.isUsable==true){
				$("#passwordValid").val(1);
				$(".current_password").hide();
				$(".future_password").show();
			}
			else {
				$(".passwordValidateWarning").html('비밀번호가 다릅니다.');
				$("#password").val("");
				$(".passwordValidateWarning").attr("style","red");
				$("#password").attr("style","border-bottom: 2px solid red");
				$("#passwordValid").val(0);
			}
		},
		error : (jqxhr, textStatus, errorThrown)=>{
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
}

function password_validate(){
	
	if($("#passwordValid").val() == 0){
		alert("비밀번호 확인해주세요.");
		return false;
	}
}


</script>
<style>

.btn {
	height: 33px;
	font-size: 13px;
	display: inline-block;
}

.action {
	background: black;
}

#enroll-btn {
	margin:0 auto;
}

#button-group {
	padding: 0px 50px;
}

#button-group .step {
	margin-top: 0px;
}

.td-warn{
	font-size: 14px;
    color: rgba(221, 30, 47, 1);
}
</style>
<body>

<div id="updatePassword-container">
		<form name="updatePwdFrm" onsubmit="return password_validate();" action="${pageContext.request.contextPath}/member/updatePasswordEnd.do" method="post" >
			<input type="hidden" value="${memberLoggedIn.email}" id="email" name="email"/>
			<table>
				<tr class="current_password">
					<td>현재 비밀번호</td>
					<td>
						<input type="password" name="password" id="password" />
					</td>
					<td class="current_password">
						<input type="button" class="btn btn-outline-secondary" onclick="passwordCheck();"
						id="btn-password-already" value="비밀번호 확인" />
						<input type="hidden" id="passwordValid" value="0"/>
					</td>
				</tr>
				<tr class="current_password">
					<td></td>
					<td class="passwordValidateWarning td-warn"></td>
					<td></td>
				</tr>
				<tr class="future_password">
					<td>변경할 비밀번호</td>
					<td>
						<input type="password" name="password_Change" id="password_Change" >
					</td>
				</tr>
				<tr class="future_password">
					<td>비밀번호 확인</td>
					<td>	
						<input type="password" id="password_Chk" name="password_Chk" ><br>
					</td>
				</tr>
				<tr class="future_password">
					<td></td>
					<td class="passwordChkValidateWarning td-warn"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan='2'>
						<input type="submit" value="변경" name="submit" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>