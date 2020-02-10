<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부적합 정보 수정하기</title>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
	  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath }/resources/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath }/resources/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/demo/chart-pie-demo.js"></script>
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
      <!-- search-container start -->
      <div id="insert-container">
          <form class="needs-validation" id="insectionQualityFrm" name="insectionQualityFrm" action="${pageContext.request.contextPath }/quality/insectionQualityFormEnd.do" method="post">
                         
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                    <label for="datepicker">검사일</label>&nbsp;&nbsp;&nbsp;
                    <input type="text" name="regDate" class="form-control updateQuality-datepicker" value="${insectionContent.ENROLL_DATE}" required readonly>
                    </div>
                </div>              
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="lotNo">로트번호 </label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" id="lotNo" name="lotNo" class="form-control bg-light small" value="${insectionContent.LOT_NO}" aria-label="Search" aria-describedby="basic-addon2" readOnly>
                        
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="productName">제 품 명 &nbsp; </label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" id="productName"  class="form-control bg-light small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" value="${insectionContent.PRODUCT_NAME}"  readOnly>
                        
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="type">제품타입 </label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" id="type" name="type" class="form-control bg-light small" value="${insectionContent.TYPE}" aria-label="Search" aria-describedby="basic-addon2" required>
                     	<button class="btn btn-primary searchSpec" type="button" value="type">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="storeNo">창고이름 </label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" id="storeNo" name="storeNo" class="form-control bg-light small" value="${insectionContent.STORE_NAME}" aria-label="Search" aria-describedby="basic-addon2" required>
                        <button class="btn btn-primary searchSpec" type="button" value="storeNo">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="spec">기 준 값 &nbsp; </label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span id="spec">${insectionContent.SPEC}</span>&nbsp;±&nbsp;<span id="tol">${insectionContent.TOL}</span>
<%--                         <input type="Number" class="form-control bg-light small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" name="spec" value="${insectionContent.SPEC}" readOnly>± --%>
<%--                         <input type="number" class="form-control bg-light small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" name="spec" value="${insectionContent.TOL}" readOnly> --%>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="measurement">실 측정치 </label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" id="measurement" name="measurement" class="form-control bg-light small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" required>
                        <input type="hidden" value="N" name="qualityYN" id="qualityYN"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="qualityComment">부적합 내용</label>&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        <textarea class="form-control quality-comment" cols="80" rows="5" aria-label="With textarea" name="qualityComment" readOnly></textarea>	
                    </div>
                </div>
              
            </form>
            <div class="form-row">
            	<div class="col-md-6 mb-3">
            	</div>
                <div class="col-md-6 mb-3">
	              <button id="FrmBtn" class="btn btn-primary insection-end-button">취소</button> &nbsp;&nbsp;&nbsp;
	              <button id="FrmBtn" class="btn btn-primary insection-excute-button">등록</button> 
                </div>
            </div>
      </div>
      
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
    

  </div>

<style>
.modal-body{
 height: 480px;
}
#searchModal {
  width: 60%;
  height: 150px;
}
#insert-container {
    width:660px;
    height: 150px;
}
.modal-content{
	width:700px;
}
#formGroupExampleInput {
    width: 70%;
}
.form-control {
    display:inline;
    width: 60%;
}
.quality-comment {
	width:190%;
}
#insert-container .btn-primary{
    background-color:#777;
    border-color: #777;

}
#insert-container .btn-primary:hover{
    background-color:#777;
    border-color: #777;
}
#insert-container #FrmBtn{
    float:right;
    margin-right: 5px;
}
#accordionSidebar{
	background-image : linear-gradient(180deg,#00475d 10%,#0a0f29 100%) !important;
}

</style>
<script>    
  $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yyyy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "${pageContext.request.contextPath}/resources/images/calendar.png" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });
//  			alert("${year}-${month}-${day}");
            //input을 datepicker로 선언
//             $(".updateQuality-datepicker").datepicker();           
            //From의 초기값을 오늘 날짜로 설정
//             $('.updateQuality-datepicker').datepicker('setDate', "${year}-${month}-${day}"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
//             datepicker.Value = new DateTime("${year}", "${month}", "${day}");  


            $(".insection-end-button").click(function(){
            	
            	$('#InsectionModal').modal("hide");
            });
            $(".insection-excute-button").click(function(){
            		var bool = confirm("변경된 값으로 검사를 완료하시겠습니까?");
            		
            		if(bool) {
            			$("#insectionQualityFrm").submit();
            		}
            	
            });
        });
  
$("#measurement").keyup(function(){
	
	var measurement = $("#measurement").val();
	var spec = Number($("#spec").text());
	var tol = Number($("#tol").text());
	var upperLimit = spec + (spec*tol);
	var lowerLimit = spec - (spec*tol);
	
	if(measurement<lowerLimit||measurement>upperLimit) {
		$(".quality-comment").removeAttr("readonly");
		$("#measurement").css("border-bottom","3px solid red");
		$("#qualityYN").val('N');
	}
	else {
		$(".quality-comment").attr("readonly",true);
		$("#measurement").css("border-bottom","3px solid springgreen");
		$("#qualityYN").val('Y');
	}
});
$(".searchSpec").click(function(){
	var title = $(this).siblings().html();
	$("#searchModalTitle").html(title);
	var searchType = $(this).val();
	console.log(searchType);
	 $('.searchModalBody').load("${pageContext.request.contextPath}/quality/searchSpecify.do?searchType="+searchType,function(){
	        $('#mySearchModal').modal({backdrop: 'static', keyboard: false});
	        $('#mySearchModal').modal({show:true});
	        $(".modal-backdrop.in").css('opacity', 0.4);
		});
});
$(".searchModal-end").click(function(){
	$('#mySearchModal').modal("hide");
});


</script>
</body>
</html>