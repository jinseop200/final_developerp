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
          <h1 class="h3 mb-2 text-gray-800">부적합 관리</h1>
           <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="float:right;">
            <div class="input-group" style="margin:30px;" >
              <div class="input-group-append">
                <button class="btn btn-primary" type="button" id="quality-search-button">
                	  부적합 상세 검색하기&nbsp;&nbsp;&nbsp; <i class="fas fa-search fa-sm"></i>
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
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered quality-table" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>부적합 관리 번호</th>
                      <th>Lot번호</th>
                      <th>창고번호</th>
                      <th>제품군</th>
                      <th>작성일자</th>
                    </tr>
                  </thead>
                  <tbody>
                	<c:forEach items="${list }" var="l">
	                    <tr value="${l.qualityNo }">
	                      <td>${l.qualityNo }</td>
	                      <td>${l.lotNo }</td>
	                      <td>${l.storeNo }</td>
	                      <td>${l.type }</td>
	                      <td>${l.regDate }</td>
	                    </tr>
                  	</c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
  <!-- Modal -->
<div class="modal" tabindex="-1" role="dialog" id="myModal">
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
$(".quality-table tbody tr").click(function(){
// 	console.log($(this).children().eq(0).html());
// 	alert($(this).children().eq(0).html());
	var quality_no = $(this).children().eq(0).html();
	
// 	var url = "${pageContext.request.contextPath}/quality/insertQualityForm.do";
// 	var title = "login";
// 	var spec = "left=350px, top=200px, width=600px, height=400px";
	
// 	open(url, title, spec);
	 $('.controll-modal-body').load("${pageContext.request.contextPath}/quality/updateQualityForm.do?quality_no="+quality_no,function(){
	        $('#myModal').modal({backdrop: 'static', keyboard: false});
	        $('#myModal').modal({show:true});
	        $(".modal-backdrop.in").css('opacity', 0.4);
	        $(".controll-title").html("");
	        $(".controll-title").html("부적합 정보 수정");
		});
});
$("#quality-search-button").click(function(){
    $('.controll-modal-body').load("${pageContext.request.contextPath}/quality/qualitySearch.do",function(){
        $('#myModal').modal({backdrop: 'static', keyboard: false});
        $('#myModal').modal({show:true});
        $(".modal-backdrop.in").css('opacity', 0.4);
        
        $(".controll-title").html("");
        $(".controll-title").html("부적합 상세조회");
        
    });
});
$("#quality-insert-button").click(function(){
 $('.controll-modal-body').load("${pageContext.request.contextPath}/quality/insertQualityForm.do",function(){
        $('#myModal').modal({backdrop: 'static', keyboard: false});
        $('#myModal').modal({show:true});
        $(".modal-backdrop.in").css('opacity', 0.4);
        $(".controll-title").html("");
        $(".controll-title").html("부적합 등록");
	});
});
</script>
<style>
#myModal{
	z-index: 1060;
}
.quality-table tbody tr td:hover{
	cursor:pointer;
}
</style>


  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>