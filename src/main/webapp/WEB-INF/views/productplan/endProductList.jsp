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
.quality-specify-table tbody tr:hover td{
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
     <div class="pageBar"></div>
<%--      ${pageBar} --%>
</body>

<script>
$(()=>{
	morePage(0);
});


$(".endProduct-table tbody").on('dblclick','tr',function(){
	var value = $(this).children().eq(1).html(); //선택 행 값 담기
	console.log(value);
	$("#productName").val(value); //input창에 뿌려주기
	$("#searchProduct").modal('hide');
});


function morePage(a){
	console.log("a==="+a);
	var url_="";
	if(a==0) {
		url_ = "${pageContext.request.contextPath}/productplan/endProductListPage.do?cPage=1";
	}
	else {
		url_="${pageContext.request.contextPath}/productplan/"+a;
	}
	console.log("url="+url_);
	
	$.ajax({
		url : url_,
		dataType : "json",
		success : data => {
			var epl = data.endProductList;
			$(".endProduct-table tbody").children().remove();
			for(var i in epl) {
				let ep = epl[i];
				console.log("Ep="+ep);	
				$(".endProduct-table tbody").append("<tr><td>"+(Number(i)+(data.cPage-1)*5+1)+"</td><td>"+ep.PL_NO+"</td><td>"+ep.PRODUCT_NAME+"</td><tr>");
			}
			$(".pageBar").html(data.pageBar);
			$("span.page-link").attr('onclick',"morePage(this.id)");
		},
		error:(x,s,e)=>{
			console.log("ajax요청실패",x,s,e);
		}
		
	});
	
}



</script>

</html>