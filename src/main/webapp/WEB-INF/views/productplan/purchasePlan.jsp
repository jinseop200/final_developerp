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
  #graph{
  	width: 90%;
  	height:70%;
  	margin: 0 auto;
  }
  
  </style>
  <style>
.form-control {
    display: inline;
}
.rowResize{
	display: block;
    margin: 0 auto;
    text-align: center;
}
input[type=number]{
    text-align: center;
    width: auto;
}
</style>
		
<!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">원재료 구매계획</h1>
          <div class="form-row">
			<div class="col-lg-20 mb-3 rowResize">
				 <label for="productName">제품별 소요량-재고량 조회</label>&emsp;<br>
			     <input type="number" id="productName" name="productName" class="form-control bg-light small" placeholder="제 품 명" aria-label="Search" aria-describedby="basic-addon2" readonly="readonly">
			     <button class="btn btn-primary searchProduct-btn" type="button" value="productName">
				 <i class="fas fa-search fa-sm"></i>
				 </button>
			</div>
		 </div>
          <br />
          <div id="graph">
			  <canvas id="lineChart"></canvas>
          </div>
          
          
  <!-- Modal -->
<div class="modal" tabindex="-1" role="dialog" id="searchProduct">
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
<style>
#myModal{
	z-index: 1060;
}
</style>  
<script>
//제품조회 모달
$(".searchProduct-btn").click(function(){
	 $('.controll-modal-body').load("${pageContext.request.contextPath}/productplan/endProductList.do",function(){
	        $('#searchProduct').modal({backdrop: 'static', keyboard: false});
	        $('#searchProduct').modal({show:true});
	        $(".modal-backdrop.in").css('opacity', 0.4);
	        $(".controll-title").html("제품 조회");
		});
	});
	
</script>	

<!-- 그래프 자바스크립트 -->
<script>
//line
var ctxL = document.getElementById("lineChart").getContext('2d');
var myLineChart = new Chart(ctxL, {
type: 'line',
data: {
labels: ["January", "February", "March", "April", "May", "June", "July"],
datasets: [{
label: "소요량",
data: [65, 59, 80, 81, 56, 55, 40],
backgroundColor: [
'rgba(105, 0, 132, .2)',
],
borderColor: [
'rgba(200, 99, 132, .7)',
],
borderWidth: 2
},
{
label: "재고량",
data: [28, 48, 40, 19, 86, 27, 100],
backgroundColor: [
'rgba(0, 137, 132, .2)',
],
borderColor: [
'rgba(0, 10, 130, .7)',
],
borderWidth: 2
}
]
},
options: {
responsive: true
}
});
</script>
<!-- Page level plugins -->
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>