<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부적합 정보 입력하기</title>


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
.ctm{
	width: 400px;
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

</style>
</head>
<body>
	<!-- search-container start -->
    <div id="insert-container">
        <form class="needs-validation" novalidate>	
	        <div class="form-row">
	            <div class="col-md-6 mb-3">
	            <label for="datepicker">발생일자</label>&emsp;
	            <input type="text" id="" class="form-control datepicker">
	            </div>
	            <div class="col-md-6 mb-3">
	            <label for="datepicker">납기일자</label>&emsp;
	            <input type="text" id="" class="form-control datepicker">
	            </div>
	        </div>        
	        <div class="form-row">
	            <div class="col-md-6 mb-3">
	                <label for="lotNo">납품처</label>&emsp;&emsp;
	                <input type="text" id="vendor" name="vendor" class="form-control bg-light small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
	                <button class="btn btn-primary searchSpec" type="button" id="ctmList" data-toggle="modal" data-target="#exampleModal">
	                
	                    <i class="fas fa-search fa-sm"></i>
	                </button>
	                
	            </div>
	            <div class="col-md-6 mb-3">
	                <label for="lotNo">담당자 </label>&emsp;&emsp;
	                <input type="text" id="vendor" name="vendor" class="form-control bg-light small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
	                <button class="btn btn-primary searchSpec" type="button">
	                    <i class="fas fa-search fa-sm"></i>
	                </button>
	            </div>
	        </div>
	        <div class="form-row">
	            <div class="col-md-6 mb-3">
	                <label for="type">제품명 </label>&emsp;&emsp;
	                <input type="text" id="vendor" name="productName" class="form-control bg-light small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
	                <button class="btn btn-primary searchSpec" type="button">
	                    <i class="fas fa-search fa-sm"></i>
	                </button>
	            </div>
	            <div class="col-md-6 mb-3">
	                <label for="storeNo">지시수량 </label>&emsp;
	                <input type="text" id="vendor" name="storeName" class="form-control bg-light small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
	                <button class="btn btn-primary searchSpec" type="button">
	                    <i class="fas fa-search fa-sm"></i>
	                </button>
	            </div>
	        </div>
	        
	        <div class="form-row">
	            <div class="col-md-6 mb-3">
	                <label for="storeNo">지시 내용</label><br />
	                <textarea class="form-control quality-comment" cols="100" rows="5" aria-label="With textarea"></textarea>	
	            </div>
	        </div>
	        <div class="form-row">
	        	<div class="col-md-6 mb-3">
	        	</div>
	            <div class="col-md-6 mb-3">
	           <button id="FrmBtn" class="btn btn-primary" type="submit">취소</button>
	           <button id="FrmBtn" class="btn btn-primary" type="submit">등록</button>
	            </div>
	        </div>
     	</form>
    </div>
    
    <!-- Modal -->
	<!-- 납품처 리스트 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-center" role="document">
	    <div class="modal-content ctm">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">납품처 검색</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="form-group">
	            <label for="recipient-name" class="col-form-label">Recipient:</label>
	            <input type="text" class="form-control" id="recipient-name">
	          </div>
	          <div class="form-group">
	            <label for="message-text" class="col-form-label">Message:</label>
	            <textarea class="form-control" id="message-text"></textarea>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Send message</button>
	      </div>
	    </div>
	  </div>
	</div>


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
		$(".datepicker").datepicker();           
		//From의 초기값을 오늘 날짜로 설정
		$('.datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		
		
				
	});
	</script>
</body>
</html>