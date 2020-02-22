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
  
 <%--  <!-- Font Awesome 그래프용 mdb 설정-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Google Fonts Roboto -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/css_mdb/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/css_mdb/mdb.min.css"> --%>
  
<style>
#graph{
	width: 90%;
	height:70%;
	margin: 0 auto;
}
#productionStatus{
    display: inline-block;
    width: 25%;
    border-style: ridge;
    margin-left: 90px;
    font-size: unset;
    position: relative;
    top: 100px;
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
input[type=text]{
    text-align: center;
    width: auto;

}
#myModal{
	z-index: 1060;
}
</style>

		
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">생산현황 및 생산계획</h1>
<!-- 생산현황 테이블 -->
<div id="productionStatus">
	<h4>생산 현황</h4>
	<table id="stausTable" width="100%" >
	  <thead>
	    <tr>
	      <th>완제품계획</th>
	      <th>완제품실적</th>
	      <th>달성율</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<tr class="table-info">
	  		<td>${epPlan }</td>
	  		<td>${epResult }</td>
	  		<td>${attainment }%</td>
	  	</tr>
	  </tbody>
	</table>
</div>
<div id="monthlyProduction" >
	<div class="form-row">
		<div class="col-lg-20 mb-3 rowResize">
			 <label for="productName">제품별 월별 생산계획 조회</label>&emsp;<br>
		     <input type="text" id="productName" name="productName" class="form-control bg-light small" placeholder="제 품 명" aria-label="Search" aria-describedby="basic-addon2" readonly="readonly">
		     <input type="hidden" id="productNo" name="productNo" />
		     <button class="btn btn-primary searchProduct-btn" type="button" value="productName">
			 	<i class="fas fa-search fa-sm"></i>
			 </button>
		</div>
	</div>
	
	<br />
	<div id="graph">
		<canvas id="barChart"></canvas>
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
</div>
 



<!-- jQuery -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/js_mdb/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/js_mdb/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/js_mdb/bootstrap.min.js"></script> --%>
<!-- MDB core JavaScript (그래프 점)-->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/js_mdb/mdb.min.js"></script>
<script>
$(()=>{
	
});
	//그래프 자바스크립트
	//bar
	var ctxB = document.getElementById("barChart").getContext('2d');
	var myBarChart = new Chart(ctxB, {
	type: 'bar',
	data: {
	labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	datasets: [{
	label: '월별 생산량',
	data: [12, 19, 3, 5, 2, 3],
	backgroundColor: [
	'rgba(255, 99, 132, 0.2)',
	'rgba(54, 162, 235, 0.2)',
	'rgba(255, 206, 86, 0.2)',
	'rgba(75, 192, 192, 0.2)',
	'rgba(153, 102, 255, 0.2)',
	'rgba(255, 159, 64, 0.2)'
	],
	borderColor: [
	'rgba(255,99,132,1)',
	'rgba(54, 162, 235, 1)',
	'rgba(255, 206, 86, 1)',
	'rgba(75, 192, 192, 1)',
	'rgba(153, 102, 255, 1)',
	'rgba(255, 159, 64, 1)'
	],
	borderWidth: 1
	}]
	},
	options: {
	scales: {
	yAxes: [{
	ticks: {
	beginAtZero: true
	}
	}]
	}
	}
	});

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

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>







<jsp:include page="/WEB-INF/views/common/footer.jsp"/>