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
<title>Insert title here</title>
</head>

<body>
<div class="card shadow mb-4">
<div class="card-header py-3">
  <h6 class="m-0 font-weight-bold text-primary"></h6>
</div>
<div class="card-body">
<div class="table-responsive">
  	<!-- <div class="input-group-append">
		<input type="text" id="myInput" class="form-control" placeholder="Search..." aria-label="Search..." aria-describedby="basic-addon2">
    	<i class="fas fa-search fa-lg"></i>
  	</div> -->
     <table class="table table-bordered quality-specify-table" id="dataTable2" width="100%" cellspacing="0">
       <thead>
         <tr>
           <th>No</th>
		   <c:if test="${searchType == 'accountNo'}">
           <th>거래처번호</th>
           <th>거래처명</th>
           </c:if>
           <c:if test="${searchType == 'ptNo'}">
           <th>품목번호</th>
           <th>품목명</th>
           </c:if>
           <c:if test="${searchType == 'rawMaterial'}">
           <th>품목번호</th>
           <th>품목명</th>
           </c:if>
         </tr>
       </thead>
       <tbody id="tbodyList">
       </tbody>
     </table>
     </div>
     </div>
     <input type="hidden" id="trNum" value="nulla"/>
</div>
     <div class="pageBar"></div>
<%--      ${pageBar} --%>
</body>

<style>
.quality-specify-table tbody tr:hover td{
	cursor : auto;
	background-color:#ccc;
}
.fa-lg {
    font-size: 1.53333em;
    line-height: 1.45em;
    vertical-align: 0.2333em;
    padding-left: 11px;
}
</style>

<script>
$(()=>{
	//console.log("${searchType}");
	morePage(0);
	
	//input search
	$("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#tbodyList tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	
	
	
	
});


$(".quality-specify-table tbody").on('dblclick','tr',function(){
	var value = $(this).children().eq(1).html();
	var value2 = $(this).children().eq(2).html();
	var trNum = $("#trNum").val();
	//console.log(trNum);
	//console.log(value);
	
	if(trNum != "nulla"){
		$(".table-editable tr").eq(trNum).find("td").eq(1).text(value);
		$(".table-editable tr").eq(trNum).find("td").eq(2).text(value2);
		//console.log($(".table-editable tr").eq(trNum));
		//console.log("eq0",$(".table-editable tr").eq(0));
		//console.log($(".table-editable tr").eq(trNum).find("td").eq(2));
		
	}
	
	$("#${searchType}").val(value);
	$("#mySearchModal").modal('hide');
});


function morePage(a){
	//console.log("a==="+a);
	var searchType = "${searchType}";
	var url_="";
	if(a==0) {
		url_ = "${pageContext.request.contextPath}/enrollment/searchSpecifyPage.do?searchType=${searchType}&cPage=1";
	}
	else {
		url_="${pageContext.request.contextPath}/enrollment/"+a;
	}
	//console.log("url="+url_);
	$.ajax({
		url : url_,
		dataType : "json",
		success : data => {
			var speclist = data.speclist;
			$(".quality-specify-table tbody").children().remove();
			for(var i in speclist ) {
				let p = speclist[i];
				//console.log(p);	
				$(".quality-specify-table tbody").append("<tr><td>"+(Number(i)+(data.cPage-1)*5+1)+"</td><td>"+p.content2+"</td><td>"+p.content+"</td><tr>");
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