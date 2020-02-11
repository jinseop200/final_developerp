<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
window.onload = function () {

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		title:{
			text: "원재료",
			horizontalAlign: "left"
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			//innerRadius: 60,
			indexLabelFontSize: 17,
			indexLabel: "{label} - #percent%",
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: [
				{ y: 67, label: "Inbox" },
				{ y: 28, label: "Archives" },
				{ y: 10, label: "Labels" },
				{ y: 7, label: "Drafts"},
				{ y: 15, label: "Trash"},
				{ y: 6, label: "Spam"}
			]
		}]
	});
	chart.render();
	
	var chart2 = new CanvasJS.Chart("chartContainer2", {
		animationEnabled: true,
		title:{
			text: "생산 제품",
			horizontalAlign: "left"
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			//innerRadius: 60,
			indexLabelFontSize: 17,
			indexLabel: "{label} - #percent%",
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: [
				{ y: 67, label: "Inbox" },
				{ y: 28, label: "Archives" },
				{ y: 10, label: "Labels" },
				{ y: 7, label: "Drafts"},
				{ y: 15, label: "Trash"},
				{ y: 6, label: "Spam"}
			]
		}]
	});
	chart2.render();
}
</script>
<h1 class="h3 mb-2 text-gray-800">부적합 도넛 & 히스토그램</h1>
<button type="button" class="btn btn-outline-primary">기간으로 검색하기</button><br /><br />
<div class="doughnutCharContainer">
    <div id="chartContainer"  class="doughnut" style="height: 370px; width: 45%;"></div>&nbsp;&nbsp;&nbsp;
    <div id="chartContainer2" class="doughnut" style="height: 370px; width: 45%;"></div>
</div>
<style>
.doughnut{
	display: inline-block;
}
.doughnutCharContainer{
	text-align:center;
}
</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
