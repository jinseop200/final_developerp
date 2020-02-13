<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Custom styles for this page -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
</head>
<body>
      <!-- search-container start -->
      <div id="search-container">
				<div class="form-row">
					<div class="col-lg-20 mb-3 rowResize">
					     <label for="productInfo">생산품목 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 					     <input type="text" id="productInfo" name="productInfo" class="form-control bg-light small" placeholder="생산품목" aria-label="Search" aria-describedby="basic-addon2" readonly="readonly">
					     <br />
					     <label for="productCode">생산품목코드 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 					     <input type="text" id="productCode" name="productCode" class="form-control bg-light small" placeholder="생산품목코드" aria-label="Search" aria-describedby="basic-addon2" readonly="readonly">
					</div>
				</div>
				<!-- Editable table -->
				<div class="card">
				  <div class="card-body">
				    <div id="table" class="table-editable">
				      <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i
				            class="fas fa-plus fa-2x" aria-hidden="true"></i></a></span>
				      <table class="table table-bordered table-responsive-md table-striped text-center" id="edTable">
				        <thead>
				          <tr>
				            <th class="text-center">No</th>
				            <th class="text-center">품목코드</th>
				            <th class="text-center">품목명</th>
				            <th class="text-center">수량</th>
				            <!-- <th class="text-center">Sort</th> -->
				            <th class="text-center">Remove</th>
				          </tr>
				        </thead>
				        <tbody class="BOMTbody">
				          <tr>
				            <td class="pt-3-half pNo" contenteditable="false"></td>
				            <td class="pt-3-half pCode tdPtCode" contenteditable="true"></td>
				            <td class="pt-3-half pName" contenteditable="false"></td>
				            <td class="pt-3-half pCount" contenteditable="true"></td>
				            <!-- <td class="pt-3-half">
				              <span class="table-up"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-up"
				                    aria-hidden="true"></i></a></span>
				              <span class="table-down"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-down"
				                    aria-hidden="true"></i></a></span>
				            </td> -->
				            <td>
				              <span class="table-remove"><button type="button"
				                  class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
				            </td>
				          </tr>
				          <!-- This is our clonable table line
				          <tr>
				            <td class="pt-3-half" contenteditable="true">Guerra Cortez</td>
				            <td class="pt-3-half" contenteditable="true">45</td>
				            <td class="pt-3-half" contenteditable="true">Insectus</td>
				            <td class="pt-3-half" contenteditable="true">USA</td>
				            <td class="pt-3-half" contenteditable="true">San Francisco</td>
				            <td class="pt-3-half">
				              <span class="table-up"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-up"
				                    aria-hidden="true"></i></a></span>
				              <span class="table-down"><a href="#!" class="indigo-text"><i class="fas fa-long-arrow-alt-down"
				                    aria-hidden="true"></i></a></span>
				            </td>
				            <td>
				              <span class="table-remove"><button type="button"
				                  class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
				            </td>
				          </tr>
				          -->
				        </tbody>
				      </table>
				    </div>
				  </div>
				</div>
				<!-- Editable table -->
				
				<hr class="hrSize"/>
            	<div class="form-row col-lg-20 col-lg-push-9 btns">
                </div>
	              <button type="button" id="FrmBtn" class="btn btn-primary addBOM-submit" >저장</button> 
	              <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
           </div>
           
      </div>
      
<%--Search modal --%>
<div class="modal" tabindex="-1" role="dialog" id="mySearchModal">
  <div class="modal-dialog" role="document">
      <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title search-title" id="searchModalTitle"> </h5>
      </div>
      <div class="modal-body searchModalBody">
          <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-primary searchModal-end">끝</button>
      </div>
      </div>
  </div>
</div>



<style>
#searchModal {
  width: 60%;
  height: 150px;
}
#search-container {
    width: 100%;
}
.modal-content{
	width:800px;
	height: 100%;
}
#formGroupExampleInput {
    width: 70%;
}
.form-control {
    display: inline;
    width: 20%;
}
#search-container .btn-primary{
    background-color:#777;
    border-color: #777;

}
#search-container .btn-primary:hover{
    background-color:#777;
    border-color: #777;
}
#search-container #FrmBtn{
    float:right;
    margin-right: 5px;
}
#mySearchModal {
	z-index:1080;
}
.btns{
	padding-left: 389px;
}
.rowResize{
	width: 100%;
}
.hrSize{
    width: 549px;
    padding: 0;
    margin-left: -17px;
}
.updateModalBody{
    height: 130px;
}
.scResize{
	height: 110px;
}
/* #edTable {
    counter-reset: rowNumber;
}

#edTable tr td:first-child::before {
	counter-increment: rowNumber;
    content: counter(rowNumber);
    min-width: 1em;
    margin-right: 0.5em;
} */
</style>
<script>    

<%--onload start--%>
$(()=>{	
	
	$(".searchModal-end").click(function(){
    	$('#mySearchModal').modal("hide");
    });
	
	$(".mdlCloseBtn").click(function(){
    	$('#updateProductNo').modal("hide");
    });
	
	var trNum = $(".BOMTbody tr").length;
	for(var i=1;i<=trNum;i++){
		$(".pNo").text(i);
	}
	
	 <%--editable table script--%>
	 const $tableID = $('#table');
	 const $BTN = $('#export-btn');
	 const $EXPORT = $('#export');
	
	 const newTr = `
	<tr class="hide">
	  <td class="pt-3-half pNo" contenteditable="false"></td>
      <td class="pt-3-half pCode tdPtCode" contenteditable="true"></td>
      <td class="pt-3-half pName" contenteditable="false"></td>
      <td class="pt-3-half pCount" contenteditable="true"></td>
	  <td>
	    <span class="table-remove"><button type="button" class="btn btn-danger btn-rounded btn-sm my-0 waves-effect waves-light">Remove</button></span>
	  </td>
	</tr>`;

	 $('.table-add').on('click', 'i', () => {
		 
	   const $clone = $tableID.find('tbody tr').last().clone(true).removeClass('hide table-line');

	   $tableID.find('table').append(newTr);
		
	   var trNum = $("#frmSubmit tr").length;
	   var firstNum = $("#frmSubmit tbody tr .pNo").text() * 1;
		for(var i=firstNum;i<=trNum;i++){
			$(".pNo").eq(i).text(i+1);
		}
	 });

	 $tableID.on('click', '.table-remove', function () {
	   $(this).parents('tr').detach();
	   
	   var trNum = $("#frmSubmit tr").length;
	   var firstNum = $("#frmSubmit tbody tr .pNo").text() * 1;
		for(var i=firstNum;i<=trNum;i++){
			$(".pNo").eq(i).text(i+1);
		}
	   
	 });

	 $tableID.on('click', '.table-up', function () {

	   const $row = $(this).parents('tr');

	   if ($row.index() === 1) {
	     return;
	   }

	   $row.prev().before($row.get(0));
	 });

	 $tableID.on('click', '.table-down', function () {

	   const $row = $(this).parents('tr');
	   $row.next().after($row.get(0));
	 });

	 // A few jQuery helpers for exporting only
	 jQuery.fn.pop = [].pop;
	 jQuery.fn.shift = [].shift;

	 $BTN.on('click', () => {

	   const $rows = $tableID.find('tr:not(:hidden)');
	   const headers = [];
	   const data = [];

	   // Get the headers (add special header logic here)
	   $($rows.shift()).find('th:not(:empty)').each(function () {

	     headers.push($(this).text().toLowerCase());
	   });

	   // Turn all existing rows into a loopable array
	   $rows.each(function () {
	     const $td = $(this).find('td');
	     const h = {};

	     // Use the headers from earlier to name our hash keys
	     headers.forEach((header, i) => {

	       h[header] = $td.eq(i).text();
	     });

	     data.push(h);
	   });

	   // Output the result
	   $EXPORT.text(JSON.stringify(data));
	 });
	 <%--editable table script end--%>
	
	
})
<%--onload end--%>

//button submit
$(document).off('click').on('click','#FrmBtn',function(){
	//$("#frmSubmit").submit();
	//var BOMTbody = $("#frmSubmit tr").text();
// 	var BOMTbody = new Array();
// 	BOMTbody = $("#frmSubmit tr");
// 	console.log("BOMTbody2", $("#frmSubmit tr").text());
// 	console.log(BOMTbody);
	
	var pNo = $(".pNo");
	var pNos = [];

	var pCode = $(".pCode");
	var pCodes = [];
	
	var pName = $(".pName");
	var pNames = [];
	
	var pCount = $(".pCount");
	var pCounts = [];
	
	var productCode = $("#productCode").val();
	
	for(var i=0;i<pName.length;i++) {
		pNames.push(pName.eq(i).text());
		pNos.push(pNo.eq(i).text());
		pCounts.push(pCount.eq(i).text());
		pCodes.push(pCode.eq(i).text());
	}
	var data_ = {"pNos":pNos,
				 "pCodes":pCodes,
				 "pNames":pNames,
				 "pCounts":pCounts,
				 "productCode":productCode
				 };
	console.log(data_);
 	$.ajax({
 		url: "${pageContext.request.contextPath}/production/addBOM.do",
 		data: data_,
 		async: false,
 		type : 'POST', 
// 		contentType : "application; charset=utf-8",
 		dataType: "json",
 		success: data => {
 			console.log(data);
 		},
 		error : (jqxhr, textStatus, errorThrown)=>{
 			console.log(jqxhr, textStatus, errorThrown);
 		}
 	});
})

$(function() {
    //폼닫기
    $(".search-end-button").click(function(){
    	$('#productAddModal').modal("hide");
    });
});
  
<%-- 품목코드 수정 중복검사 ajax--%>
function productNoDuplicatedCheck(e){
	var productNo = e;
	console.log(productNo);
	
	$.ajax({
		url: "${pageContext.request.contextPath}/enrollment/productNoDuplicatedCheckForRawMaterial.do",
		data: {productNo : productNo},
		dataType: "json",
	 	async: false,
		contentType:"application/json;charset=UTF-8",
		success: data => {
			console.log(data);
			if(data.isUsable == true && data.productNo != ""){
				alert("사용가능한 품목코드 입니다.");
				//$("#vendorNo").attr("style","border-bottom: 2px solid #00c500");
				$("#updateProductNo #productNoCha").attr("style","border-bottom: 2px solid #00c500");
				//$("#vendorNoValid").val(1);
				$("#updateProductNo  #productNoUpdateValid").val(1);
			}
			if((data.isUsable == true || data.isUsable == false) && data.productNo == ""){
				alert("중복확인할 품목코드를 입력해 주세요.");
				//$("#vendorNo").val("");
				$("#productNoCha").val("");
				//$("#vendorNo").attr("style","border-bottom: 2px solid red");
				$("#vendorNoCha").attr("style","border-bottom: 2px solid red");
				//$("#vendorNoValid").val(0);
				$("#productNoUpdateValid").val(0);
			}
			else if(data.isUsable == false){
				alert("중복된 품목코드 입니다.");
				//$("#vendorNo").val("");
				$("#productNoCha").val("");
				//$("#vendorNo").attr("style","border-bottom: 2px solid red");
				$("#productNoCha").attr("style","border-bottom: 2px solid red");
				//$("#vendorNoValid").val(0);
				$("#productNoUpdateValid").val(0);
				
			}
			
		},
		error : (jqxhr, textStatus, errorThrown)=>{
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
}

function productNoUpdateValidate2(){
	var formData = $('#productNoUpdateFrm').serialize();
	console.log(formData);
	console.log($('#productNoCha').val());
	
	$.ajax({
        cache : false,
        url : "${pageContext.request.contextPath}/enrollment/updateProductNo.do",
        processData: false,
        type : 'POST', 
        data : formData,
        success : function(data) {
        	$('#productNo').val($('#productNoCha').val());
        	
        	$('#updateProductNo').modal('hide');
        },
        error : function(x,h,r, status) {
            alert(x,h,r + " : " + status);
        }
    }); // $.ajax */
}  
  
  <%--완제품 등록 유효성검사--%>
function addProductValidate(){
  	var regExpNumber = /[^0-9]/g;
  	var $productNoValid = $("#productNoValid");
  	
      //품목코드
  	var $productNo = $("#productNo");
  	if($productNo.val().trim().length == 0){
          alert("품목코드를 입력하세요.");
          $productNo.focus();
  		return false;
  	}
      //거래처등록번호
	var $accountNo = $("#accountNo");
  	if($accountNo.val().trim().length == 0){
          alert("거래처 등록번호를 입력하세요.");
          $accountNo.focus();
  		return false;
  	}
      //관리번호
  	var $ptNo = $("#ptNo");
  	if($ptNo.val().trim().length == 0){
          alert("관리번호를 입력하세요.");
          $ptNo.focus();
  		return false;
  	}
  	//품목명
  	var $productName = $("#productName");
  	if($productName.val().trim().length == 0){
          alert("품목명을 입력하세요.");
          $productName.focus();
  		return false;
      }
  	//구매소요일
  	var $delivery = $("#delivery");
  	if($delivery.val().trim().length == 0){
          alert("구매소요일을 입력하세요.");
          $delivery.focus();
  		return false;
      }
  	//입고단가
  	var $inPrice = $("#inPrice");
  	if($inPrice.val().trim().length == 0){
          alert("입고단가를 입력하세요.");
          $inPrice.focus();
  		return false;
      }  
  	//출고단가
  	var $outPrice = $("#outPrice");
  	if($outPrice.val().trim().length == 0){
          alert("출고단가를 입력하세요.");
          $outPrice.focus();
  		return false;
      }
 	//기준치
  	var $spec = $("#spec");
  	if($spec.val().trim().length == 0){
          alert("기준치를 입력하세요.");
          $spec.focus();
  		return false;
      }
  	//공차
  	var $tol = $("#tol");
  	if($tol.val().trim().length == 0){
          alert("공차를 입력하세요.");
          $tol.focus();
  		return false;
      }
  	
  	return true;
  }  
  

$(document).on('dblclick','.tdPtCode',function(){
	$("#searchModalTitle").html('품목코드 검색');
	var searchType = "rawMaterial";
	var clickedTd = $(this);
	var trNum = $(this).closest('tr').prevAll().length;
	
	if(trNum==0){
		trNum = 1;
	}
	
	console.log("this", clickedTd);
	console.log("trNum", trNum);
	console.log("prevAll", $(this).closest('tr').prevAll());
	
	 $('.searchModalBody').load("${pageContext.request.contextPath}/enrollment/searchSpecify.do?searchType="+searchType,function(){
	        $('#mySearchModal').modal({backdrop: 'static', keyboard: false});
	        $('#mySearchModal').modal({show:true});
	        $(".modal-backdrop.in").css('opacity', 0.4);
	        $("#mySearchModal #trNum").val(trNum);
	 })
			
})
  
</script>
</body>
</html>