<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <table class="table table-bordered quality-specify-table" id="dataTable" width="100%" cellspacing="0">
       <thead>
         <tr>
           <th>부적합 관리 번호</th>
           <th>내용</th>
         </tr>
       </thead>
       <tbody>
  		<c:forEach items="${speclist }" var="l" varStatus="vs">	
          <tr>
            <td>${vs.count }</td>
            <td>${l.content }</td>
          </tr>
        </c:forEach>
       </tbody>
     </table>
</body>

<style>
.quality-specify-table tbody tr:hover td{
	cursor : auto;
	background-color:#ccc;
}

</style>

</html>