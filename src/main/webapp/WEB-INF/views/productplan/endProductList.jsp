<%@page import="com.dev.erp.common.util.Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품조회(modal-body)</title>

<style>
.endProduct-table tbody tr:hover td{
	cursor : auto;
	background-color:#ccc;
}

</style>
</head>
<body>
     <table class="table table-bordered endProduct-table" id="dataTable" width="100%" cellspacing="0">
       <thead>
         <tr>
           <th>No.</th>
           <th>제품관리번호</th>
           <th>제품명</th>
         </tr>
       </thead>
       <tbody>
       </tbody>
     </table>
     <div class="pageBar">
<%--      ${pageBar} --%>
     </div>
</body>

<script>
$(()=>{
	
	
	morePage(0);

});

function morePage(a){
	var plan = "${plan}";
	console.log("plan4="+plan);
	
	console.log("a==="+a);
	var url_="";
	if(a==0) {
		url_ = "${pageContext.request.contextPath}/productplan/endProductListPage.do?plan="+plan+"&cPage=1";
	}
	else {
		url_="${pageContext.request.contextPath}/productplan/"+a;
	}
	console.log("url="+url_);
	
	$.ajax({
		url : url_,
		dataType : "json",
		contentType: "application/json; charset=utf-8",
		success : data => {
			var list = data.list;
			$(".endProduct-table tbody").children().remove();
			for(var i in list) {
				let l = list[i];
				console.log("list="+l);	
				$(".endProduct-table tbody").append("<tr><td>"+(Number(i)+(data.cPage-1)*10+1)+"</td><td>"+l.plNo+"</td><td>"+l.productName+"</td><tr>");
			}
			$(".pageBar").html(data.pageBar);
			$("span.page-link").attr('onclick',"morePage(this.id)");
		},
		error:(x,s,e)=>{
			console.log("ajax요청실패",x,s,e);
		}
		
	});
	
}


$(".endProduct-table tbody").on('dblclick','tr',function(){
	
	var no = $(this).children().eq(1).html(); //선택 행 값 담기
	var name = $(this).children().eq(2).html(); //선택 행 값 담기
	
	$("#productNo").val(no); //hidden(제품번호)
	$("#productName").val(name); //input창에 뿌려주기
	
	$("#lineChart").remove();
	$("#graph").append("<canvas id='lineChart'></canvas>");
	
	if("${plan}" == "purchase"){
		
		$("#purchasePlan-modal").modal('hide');
		var productNo = $("#productNo").val();
		$.ajax({
			url : "${pageContext.request.contextPath}/productplan/showChartByProduct.do?productNo="+productNo,
			contentType :"application/json; charset=utf-8",
			dataType : "json",
			success : data=>{
				var graphData_ = data.graphData;
				console.log(data);
				
				var rmName = [];
				var required = [];
				var rmStock = [];
				
				for(let i in graphData_ ) {
					
					var p = graphData_[i];
					
					rmName.push(p.rmName);
					required.push(p.requiredQ);
					rmStock.push(p.rmStock);
					
				}
				console.log(data.graphData);
				createGraph(rmName, required, rmStock);
			},
			error : (x,s,e)=>{
				console.log("ajax요청실패",x,s,e);
			}
		});
	}
	
	if("${plan}" == "product"){
		
		$("#searchProduction").modal('hide');
		var productNo = $("#productNo").val();
		$.ajax({
			url : "${pageContext.request.contextPath}/productplan/showBarChart.do?productNo="+productNo,
			contentType :"application/json; charset=utf-8",
			dataType : "json",
			success : data=>{
				var barData_ = data.barData;
				console.log(barData_);
				
				var month = [];
				var output = [];
				
				for(let i in barData_){
					
					var mp = barData_[i];
					month.push(mp.month+"월");
					output.push(mp.output);
				}
				
				createBarChart(month, output);
			},
			error : (x,s,e)=>{
				console.log("ajax요청실패",x,s,e);
			}
		});
	}
	
		
});
function createBarChart(month, output){
	
	//그래프 자바스크립트
	//bar
	var ctxB = document.getElementById("barChart").getContext('2d');
	var myBarChart = new Chart(ctxB, {
	type: 'bar',
	data: {
	labels: month,
	datasets: [{
	label: '월별 생산량',
	data: output,
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
}

function createGraph(rmName, required, rmStock){
	
	//line
	var ctxL = document.getElementById("lineChart").getContext('2d');
	var myLineChart = new Chart(ctxL, {
	type: 'line',
	data: {
	labels: rmName,
	// ${labels}
	datasets: [{
	label: "소요량",
	data: required,
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
	data: rmStock,
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
}

</script>

</html>