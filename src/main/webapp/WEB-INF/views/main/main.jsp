<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

 <button id="enrollButton">관리자회원가입 하기</button>
 <button id="enrollButton">회원정보변경</button>

 
 <script>

 $("#enrollButton").click(function(){
		location.href = "${pageContext.request.contextPath}/member/memberEnroll.do";
	});
 
 </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
