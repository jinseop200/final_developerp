<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>

 <button id="enrollButton">관리자회원가입 하기</button>
 
 
 <script>
 $("#enrollButton").click(function(){
		location.href = "${pageContext.request.contextPath}/member/memberEnroll.do";
	});
 </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
