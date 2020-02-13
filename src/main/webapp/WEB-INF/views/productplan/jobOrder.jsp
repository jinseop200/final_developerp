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

		
<!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">작업 지시서</h1>
           <div class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="float:right;">
            <div class="input-group" style="margin:30px;" >
              <div class="input-group-append">
                <button class="btn btn-primary" type="button" id="insert-btn">
                	  신규 등록 
                </button> &nbsp;&nbsp;&nbsp;&nbsp;
                <button class="btn btn-primary" type="button" id="update-btn">
                	  수정 
                </button> &nbsp;&nbsp;&nbsp;&nbsp;
                <button class="btn btn-primary" type="button" id="delete-btn">
                	  삭제
                </button> &nbsp;&nbsp;&nbsp;&nbsp;
              </div>
            </div>
          </div>
          <br />

          <!-- DataTales Example -->
          <div class="card shadow mb-4" style="clear:both;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">조회 결과</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th></th>
                      <th>작업지시번호</th>
                      <th>납품처</th>
                      <th>납기일</th>
                      <th>담당자</th>
                      <th>제품명</th>
                      <th>지시수량</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${joList }" var="jo" varStatus="vs">
                    <tr>
                      <td>
						<input type="checkbox" name="chkbox" id="chkbox" onclick="oneCheckbox(this);"/>
                      </td>
                      <td>${jo.joNo}</td>
                      <td>${jo.customer }</td>
                      <td>${jo.dueDate }</td>
                      <td>${jo.manager }</td>
                      <td>${jo.productName }</td>
                      <td>${jo.orderQuantity}</td>
                    </tr>
                  	</c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
  <!-- Modal -->
<div class="modal" tabindex="-1" role="dialog" id="joModal">
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


//작업지시시서 등록
$("#insert-btn").click(function(){
 $('.controll-modal-body').load("${pageContext.request.contextPath}/productplan/insertJobOrder.do",function(){
        $('#joModal').modal({backdrop: 'static', keyboard: false});
        $('#joModal').modal({show:true});
        $(".modal-backdrop.in").css('opacity', 0.4);
        $(".controll-title").html("작업지시서 등록");
	});
});

//체크박스 하나만 선택
function oneCheckbox(a){
    var obj = document.getElementsByName("chkbox");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != a){
            obj[i].checked = false;
        }
    }
}

//작업지시서 수정
$("#update-btn").click(function(){
 $('.controll-modal-body').load("${pageContext.request.contextPath}/productplan/updateJobOrder.do",function(){
        $('#joModal').modal({backdrop: 'static', keyboard: false});
        $('#joModal').modal({show:true});
        $(".modal-backdrop.in").css('opacity', 0.4);
        $(".controll-title").html("작업지시서 등록");
	});
});

 
//작업지시서 삭제
$("#delete-btn").click(function(){
	if($('table input:checkbox:checked').length == 0){
		alert("삭제할 항목을 선택해 주세요.");
		return;
	}
		
	if(!confirm("정말 삭제하시겠습니까?")) return;
	var joNo = $("table input:checkbox:checked").parent().next().text();
	location.href ="${pageContext.request.contextPath}/productplan/deleteOneJo.do?joNo="+joNo;
});
	
</script>
<style>
#myModal{
	z-index: 1060;
}
</style>
<!-- Page level plugins -->
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>