<%@page import="com.dev.erp.common.util.Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<body>
     <table class="table table-bordered document-list-table" id="dataTable" width="100%" cellspacing="0">
       <thead>
         <tr>
           <th>No</th>
           <th>이름</th>
           <th>부서</th>
           <th>직급</th>
         </tr>
       </thead>
       <tbody>
       </tbody>
     </table>
     <div class="pageBar"></div>
<%--      ${pageBar} --%>
</body>

<style>
.document-list-table tbody tr:hover td{
	cursor : auto;
	background-color:#ccc;
}

</style>

<script>
$(()=>{
	morePage(0);
});


$(".document-list-table tbody").on('dblclick','tr',function(){
	var value = $(this).children().eq(1).html();
	console.log(value);
	$("#searchDocument").modal('hide');
});


function morePage(a){
	console.log("a==="+a);
	var url_="";
	if(a==0) {
		url_ = "${pageContext.request.contextPath}/document/documentListPage.do?cPage=1";
	}
	else {
		url_="${pageContext.request.contextPath}/document/"+a;
	}
	
	$.ajax({
		url : url_,
		dataType : "json",
		success : data => {
			var list = data.list;
			$(".document-list-table tbody").children().remove();
			for(var i in list ) {
				let p = list[i];
				console.log(p);	
				$(".document-list-table tbody").append("<tr><td>"+p.emp_id+"</td><td>"+p.emp_name+"</td><td>"+p.dept_title+"</td><td>"+p.job_name+"</td></tr>");
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