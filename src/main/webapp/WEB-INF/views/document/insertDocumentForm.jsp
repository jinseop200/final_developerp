<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>기안서 작성</title>
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
          <form class="needs-validation" action="${pageContext.request.contextPath}/document/enrollDocument.do" 
          		name="documentEnrollFrm" method="post">
          		<div>
          		<input type="hidden" value="${memberLoggedIn.empName}" id="empName" name="empName" />
          		</div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                    <label for="datepicker">일  자</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" id="documentDate" name="documentDate" class="form-control datepicker occuredDate">
                    </div>
                </div>   
                <div class="form-row">
	                <div class="col-md-6 mb-3">
	                	<label for="documentTitle">제  목</label>&nbsp;&nbsp;&nbsp;&nbsp;
	                    <input type="text" id="documentTitle" name="documentTitle" class="form-control bg-light small" required aria-label="Search" aria-describedby="basic-addon2">
	                </div> 
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="docLastapproval">결재자</label>&nbsp;&nbsp;
                        <input type="text" id="docLastapproval" name="docLastapproval" class="form-control bg-light small" required  aria-label="Search" aria-describedby="basic-addon2">
                        <button class="btn btn-primary searchDocument" type="button">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="documentMiddle">참조자 &nbsp; </label>&nbsp;&nbsp;
                        <input type="text" id="documentMiddle" name="documentMiddle" class="form-control bg-light small" required  aria-label="Search" aria-describedby="basic-addon2">
                        <button class="btn btn-primary searchDocument" type="button">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="type">구  분 </label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <tr>
						<td>
							<select name="documentType" id="documentType" required>
								<option value="" selected disabled >구분</option>
									<c:forEach items="${docTypeList}" var="d">
										<option value="${d.DOC_TYPE}">${d.DOC_TYPE}</option>
									</c:forEach>
							</select>
						</td>
					</tr>
					
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="storeNo">내  용</label>&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        <textarea class="form-control quality-comment" required name="documentContent" cols="80" rows="5" aria-label="With textarea"></textarea>	
                    </div>
                </div>
				<div class="modal-footer">
        			<button type="submit" id="FrmBtn" name="submit" class="btn btn-primary">전송</button>
            		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        		</div>       
            </form>
      </div>
         


<style>
.modal-body{
 height: 500px;
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
	width:200%;
	height:300%;
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
#searchDocument {
	z-index:1080;
}

</style>
<script>  

  $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
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
 
            //input을 datepicker로 선언
            $(".occuredDate").datepicker();           
            //From의 초기값을 오늘 날짜로 설정
            $('.occuredDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        });
  $(()=>{
	  $(".searchDocument").click(function(){
	    	var title = $(this).siblings().html();
	    	$("#searchModalTitle").html(title);
	    	 $('.searchModalBody').load("${pageContext.request.contextPath}/document/documentSelectList.do",function(){
	 	        $('#searchDocument').modal({backdrop: 'static', keyboard: false});
	 	        $('#searchDocument').modal({show:true});
	 	        $(".modal-backdrop.in").css('opacity', 0.4);
	 		});
	            
	    });
	  
	  $(".searchModal-end").click(function(){
	    	$('#searchDocument').modal("hide");
	    }); 
	  
})
  
</script>
</body>
</html>