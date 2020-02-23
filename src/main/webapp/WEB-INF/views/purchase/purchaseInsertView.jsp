<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- Custom styles for this page -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
  
	<h1 class="h3 mb-2 text-gray-800">구매 입력</h1>
	
	<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="float:right;">
		<div class="input-group" style="margin:30px;">
		
			<div class="input-group-append">
				<button class="btn btn-primary" type="button" id="purchaseInsert_button">
					  구매 등록하기 
				</button> &nbsp;&nbsp;&nbsp;&nbsp;
				
				<button class="btn btn-primary" type="button" id="purchaseUpdate_button">
					  구매 수정하기 
				</button> &nbsp;&nbsp;&nbsp;&nbsp;
				
				<button class="btn btn-primary" type="button" id="purchaseDelete_button">
					  구매 삭제하기 &nbsp;&nbsp;&nbsp;
				</button> 
			</div>
		</div>
	</form>
	
	<br />
	
	<!-- DataTales Example -->
	
	<div class="card shadow mb-4" style="clear:both;">
		<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">조회 결과</h6>
	</div>
	  
	
	  <div class="card-body" style='font-size: 14px'>
	    <div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			  <thead>
			    <tr>
			     <th>원재료 번호</th>
			     <th>거래처 등록번호</th>
			     <th>구매 요청일</th>
			     <th>필요수량</th>
			    </tr>
			  </thead>
			  
			  
			  <tbody>
		      	<c:forEach items="${purchaseInsertList}" var="purchaseInsertList" varStatus="vs">
			        <tr>
			          <td>${purchaseInsertList.RM_NO}</td>
			          <td>${purchaseInsertList.VENDOR_NO}</td>
			          <td>${purchaseInsertList.PURCHASE_DATE}</td>
			          <td>${purchaseInsertList.PURCHASE_AMOUNT}</td>
			        </tr>
		        </c:forEach>
			  </tbody>
			  
			</table>
	    </div>
	  </div>
	</div>
	          
	          
	<!-- Modal -->
	<div class="modal" tabindex="-1" role="dialog" id="rmModal">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
		        <div class="modal-header">
		            <h5 class="modal-title controll-title"></h5>
		            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		            <span aria-hidden="true">&times;</span>
		            </button>
		        </div>
		        <div class="modal-body controll-modal-body">
		            <!-- <p>Modal body text goes here.</p> -->
		        </div>
	        </div>
	    </div>
	</div>
	

	<script>
	
		$("#purchaseInsert_button").click(function(){
		 $('.controll-modal-body').load("${pageContext.request.contextPath}/purchase/modalPurchaseInsert.do",function(){
		        $('#rmModal').modal({backdrop: 'static', keyboard: false});
		        $('#rmModal').modal({show:true});
		        $(".modal-backdrop.in").css('opacity', 0.4);
		        $(".controll-title").html("");
		        $(".controll-title").html("구매 정보 등록");
			});
		});
		
		$("#purchaseUpdate_button").click(function(){
		 $('.controll-modal-body').load("${pageContext.request.contextPath}/purchase/modalPurchaseUpdate.do",function(){
		        $('#rmModal').modal({backdrop: 'static', keyboard: false});
		        $('#rmModal').modal({show:true});
		        $(".modal-backdrop.in").css('opacity', 0.4);
		        $(".controll-title").html("");
		        $(".controll-title").html("구매 정보 수정");
			});
		});
		
		$("#purchaseDelete_button").click(function(){
			 $('.controll-modal-body').load("${pageContext.request.contextPath}/purchase/modalPurchaseDelete.do",function(){
			        $('#rmModal').modal({backdrop: 'static', keyboard: false});
			        $('#rmModal').modal({show:true});
			        $(".modal-backdrop.in").css('opacity', 0.4);
			        $(".controll-title").html("");
			        $(".controll-title").html("구매 정보 삭제");
				});
			});
	</script>


<style>
#rmModal{
	z-index: 1060;
}
</style>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>






