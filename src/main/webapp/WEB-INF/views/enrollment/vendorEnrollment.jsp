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

<style>
#search-container {
    width: 200%;
    height: 210px;
}
#formGroupExampleInput {
    width: 70%;
}
.form-control {
    display:inline;
    width: 60%;
}
.btn-primary{
    background-color:#777;
    border-color: #777;

}.btn-primary:hover{
    background-color:#777;
    border-color: #777;
}
#FrmBtn{
    float:right;
}

@media (min-width: 576px){
	.modal-dialog {
	    max-width: 1000px!important;
	    margin: 1.75rem auto;
	}
}
.modal-content{
    width: 610px;
    margin: 0 auto;
}
.table-responsive{
	overflow: hidden;
}
</style>
<script>
	function vendorValidate(){
		var regExpNumber = /[^0-9]/g;

	    //거래처 번호
		var $vendorNo = $("#vendorNo");
		if($vendorNo.val().trim().length == 0){
	        alert("거래처 번호를 입력하세요.");
	        $vendorNo.focus();
			return false;
		}
	    //거래처명
		var $vendorName = $("#vendorName");
		if($vendorName.val().trim().length == 0){
	        alert("거래처명을 입력하세요.");
	        $vendorName.focus();
			return false;
		}
	    //incharge
		var $incharge = $("#incharge");
		if($incharge.val().trim().length == 0){
	        alert("담당자명을 입력하세요.");
	        $incharge.focus();
			return false;
		}
		//거래처 전화번호
		var $vendorPhone = $("#vendorPhone");
		if($vendorPhone.val().trim().length == 0){
	        alert("거래처 전화번호를 입력하세요.");
	        $vendorPhone.focus();
			return false;
	    }
	    if(regExpNumber.test($vendorPhone.val())){
	        alert("거래처 전화번호는 숫자만 입력가능합니다.");
	        $vendorPhone.val('');
	        $vendorPhone.focus();
			return false;
	    }
		return true;
	}
	

</script>

<!-- table start -->
<div class="card shadow mb-4">
<div class="card-header py-3">
  <h6 class="m-0 font-weight-bold text-primary">거래처 목록</h6>
</div>
<div class="card-body">
  <div class="table-responsive">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
      <thead>
        <tr>
          <th>거래처 번호</th>
          <th>거래처명</th>
          <th>담당자명</th>
          <th>거래처 전화번호</th>
        </tr>
      </thead>
      <tbody>
      	<c:forEach items="${vendorList}" var="v" varStatus="vs">
	        <tr>
	          <td>${v.VENDOR_NO}</td>
	          <td>${v.VENDOR_NAME}</td>
	          <td>${v.INCHARGE}</td>
	          <td>${v.VENDOR_PHONE}</td>
	        </tr>
        </c:forEach>
    </tbody>
</table>
</div>
</div>
</div>




<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-success openBtn" data-toggle="modal" data-target="#myModal">거래처 등록</button>

<!-- Modal -->
<div class="modal" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <form class="needs-validation"
         action="${pageContext.request.contextPath}/enrollment/addVendor.do"
         method="POST">
        <div class="modal-header">
            <h5 class="modal-title">거래처 등록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <!-- search-container start -->
      <div id="search-container">
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="userId">거래처번호 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" id="vendorNo" name="vendorNo" class="form-control bg-light small" placeholder="거래처번호" aria-label="Search" aria-describedby="basic-addon2">
                        <button class="btn btn-primary" type="button">중복확인</button>
                    </div>
                </div>
                <div class="form-row">
	               <div class="col-md-6 mb-3">
	                   <label for="vendor">거래처명 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                   <input type="text" id="vendorName" name="vendorName" class="form-control bg-light small" placeholder="거래처명" aria-label="Search" aria-describedby="basic-addon2">
	                </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="productName">담당자명 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" id="incharge" name="incharge" class="form-control bg-light small" placeholder="담당자명" aria-label="Search" aria-describedby="basic-addon2">
                    </div>
                </div>
                <div class="form-row">
	                <div class="col-md-6 mb-3">
	                    <label for="rmName">거래처 전화번호</label>&nbsp;&nbsp;&nbsp;
	                    <input type="number" id="vendorPhone" name="vendorPhone" class="form-control bg-lightsmall" placeholder="거래처 전화번호" aria-label="Search" aria-describedby="basic-addon2">
	                </div>
                </div>
                
      </div>
        </div>
        <div class="modal-footer">
        	<button type="submit" id="FrmBtn" class="btn btn-primary" onclick="return vendorValidate();">저장</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
        </form>
        </div>
    </div>
</div>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>