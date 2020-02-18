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
#requiredAmount span {
	color:red;
}
#myModal{
	z-index: 1060;
}

.jo-table tbody tr:hover td{
	cursor : auto;
	background-color:#ccc;
}

</style>

		
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">원재료 구매계획</h1>
<div class="form-row">
	<div class="col-lg-20 mb-3 rowResize">
		 <label for="productName">제품별 소요량-재고량 조회</label>&emsp;<br>
	     <input type="text" id="productName" name="productName" class="form-control bg-light small" placeholder="갤럭시" aria-label="Search" aria-describedby="basic-addon2" readonly="readonly">
	     <input type="hidden" id="productNo" name="productNo" />
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
<div class="modal" tabindex="-1" role="dialog" id="purchasePlan-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title controll-title"></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body epl-body">
            <!-- <p>Modal body text goes here.</p> -->
        </div>
        <div class="modal-body insertPP-body">
            <!-- <p>Modal body text goes here.</p> -->
        </div>
        </div>
    </div>
</div>


	<br />
	 <!-- DataTales Example -->
     <div class="card shadow mb-4" style="clear:both;">
       <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">구매계획 조회결과</h6>
       </div>
       <div class="card-body">
         <div class="table-responsive">
           <table class="table table-bordered jo-table" id="dataTable" width="100%" cellspacing="0">
             <thead>
               <tr>
                 <th>원재료코드</th>
                 <th>원재료명</th>
                 <th>소요량</th>
                 <th>재고량</th>
                 <th id="requiredAmount"><span>필요구매량</span></th>
               </tr>
             </thead>
             <tbody>
             	<c:if test="${beforeSearch eq '1' }">
	             	<c:forEach items="${firstPL }" var="r" varStatus="vs">
	               <tr>
	                 <td>${r.rmNo}</td>
	                 <td>${r.rmName}</td>
	                 <td>${r.requiredQ }</td>
	                 <td>${r.rmStock }</td>
	                 <td style="<c:if test='${r.requiredQ - r.rmStock > 0 }'>color:red;</c:if>">${r.requiredQ - r.rmStock }</td>
	               </tr>
	             	</c:forEach>
             	</c:if>
             	<c:if test="${afterSearch eq '2' }">
	             	<c:forEach items="${endProductList eq '2' }" var="r" varStatus="vs">
	               <tr>
	                 <td>${r.rmNo}</td>
	                 <td>${r.rmName}</td>
	                 <td>${r.requiredQ }</td>
	                 <td>${r.rmStock }</td>
	                 <td style="<c:if test='${r.requiredQ - r.rmStock > 0 }'>color:red;</c:if>">${r.requiredQ - r.rmStock }</td>
	               </tr>
	             	</c:forEach>
             	</c:if>
             </tbody>
           </table>
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
	var firstPL = ${firstPL};
	
	var rmName_=[];
	var required_=[];
	var rmStock_=[];
	
	for(let i in firstPL){
		var c = firstPL[i];
		console.log("test4="+c);
		rmName_.push(c.rmName);
		required_.push(c.requiredQ);
		rmStock_.push(c.rmStock);
		
	console.log("민병준test="+rmName_);
	}
	
	//그래프 설정
	//line
	var ctxL = document.getElementById("lineChart").getContext('2d');
	var myLineChart = new Chart(ctxL, {
	type: 'line',
	data: {
	labels: rmName_,
	// ${labels}
	datasets: [{
	label: "소요량",
	data: required_,
	//${data}
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
	data: rmStock_,
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

	
//제품조회 모달
$(".searchProduct-btn").click(function(){
	 $(".epl-body").css('display','block');
	 $(".insertPP-body").css('display','none');
	 
	 $('.epl-body').load("${pageContext.request.contextPath}/productplan/endProductList.do",function(){
	        $('#purchasePlan-modal').modal({backdrop: 'static', keyboard: false});
	        $('#purchasePlan-modal').modal({show:true});
	        $(".modal-backdrop.in").css('opacity', 0.4);
	        $(".controll-title").html("제품 조회");
		});
	});
	
//필요수량 구매계획 모달
$(".jo-table tbody").on('dblclick', 'tr', function(){
	$(".insertPP-body").css('display','block');
	$(".epl-body").css('display','none');
	
	$(".insertPP-body").load("${pageContext.request.contextPath}/productplan/purchaseRequest.do",function(){
        $('#purchasePlan-modal').modal({backdrop: 'static', keyboard: false});
        $('#purchasePlan-modal').modal({show:true});
        $(".modal-backdrop.in").css('opacity', 0.4);
        $(".controll-title").html("구매계획 등록");
	});
});

	
</script>	

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>







<jsp:include page="/WEB-INF/views/common/footer.jsp"/>