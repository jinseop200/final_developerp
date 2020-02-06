<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:requestEncoding value="utf-8"/>
<%String content = (String)request.getAttribute("content");
String date = (String)request.getAttribute("date");
Date now = new Date(); 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
String today=sdf.format(now);

%>

<script>

function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

function attend(date,email){
	location.href = "${pageContext.request.contextPath}/attend/attendant.do?date="+date+"&email="+email;
}
function leave(date,email){
	location.href = "${pageContext.request.contextPath}/attend/leave.do?date="+date+"&email="+email;
}
</script>
	
<body onload="printClock()">
	<div style="border:1px solid #dedede; width:600px; height:250px; line-height:250px; color:#666;font-size:100px; text-align:center;" id="clock">
	</div>
	<button type="button" 
				class="btn btn-outline-success btn-block"
				onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">
				
			<table>
				<tr>
					<td>이메일주소<span>*</span></td>
					<td>
						<input class="form-control input-text" type="email"
						name="email" id="email" value=${memberLoggedIn.email} />
					</td>			
				</tr>		
				<tr>
					<td>성명<span>*</span></td>
					<td><input class="form-control input-text" type="text"
						name="emp_name" id="emp_name" value=${memberLoggedIn.empName} /></td>
				</tr>				
				<tr>
					<td>부서명<span>*</span></td>
					<td>
						<input class="form-control input-text" type="text"
						name="dept_code" id="dept_code" value=${memberLoggedIn.deptCode} />
					</td>
				</tr>
				<tr>					
					<td>부서명<span>*</span></td>
					<td>
						<input class="form-control input-text" type="text"
						name="job_code" id="job_code" value=${memberLoggedIn.jobCode} />
					</td>
					</td>
				</tr>				
				<tr>
					<td>전화번호<span>*</span></td>
					<td>
						<input type="text" class="form-control input-text"
						name="phone" id="phone" value="${memberLoggedIn.phone}"/>
					</td>
				</tr>
			</table>
		<%if(today.equals(date)){%>
					<button type="button" class="attend-button" onclick='attend("${date}","${memberLoggedIn.email}")'>출근</button>
					<button type="button" class="attend-button" onclick='leave("${date}","${memberLoggedIn.email}")'>퇴근</button>
					<%} %>
<%-- 					</c:if>	 --%>
				
			



