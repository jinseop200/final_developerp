<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Custom styles for this page -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


<!-- table start -->
<div class="card shadow mb-4">
<div class="card-header py-3">
  <h6 class="m-0 font-weight-bold text-primary">품목등록 리스트</h6>
</div>
<div class="card-body">
  <div class="table-responsive">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
      <thead>
        <tr>
          <th>품목코드</th>
          <th>품목명</th>
        </tr>
      </thead>
	  <tbody>
      	<c:forEach items="${storageList}" var="s" varStatus="vs">
	        <tr class="getTr">
	          <td><a href="#" >${s.STORE_NO}</a></td>
	          <td>${s.STORE_NAME}</td>
	        </tr>
        </c:forEach>
      </tbody>
</table>
</div>
</div>
</div>







<!-- Page level plugins -->
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>