<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>쪽지 작성</title>
</head>
<body>
      <!-- search-container start -->
      <div id="insert-message-container">
          <form class="needs-validation" action="${pageContext.request.contextPath}/message/insertMessage.do" 
          		name="documentEnrollFrm" method="post">
          		<div>
          		<input type="hidden" value="${memberLoggedIn.empName}" id="empName" name="empName" />
          		</div>
                <div class="form-row" style="width:750px">
                    <div class="col-md-6 mb-3 col-md-6 mb-3">
                        <label for="insertSender">받는 사람</label>&nbsp;&nbsp;
                        <input type="text" id="insertSender" style="width:150px;" name="insertSender" class="form-control bg-light small" required  aria-label="Search" aria-describedby="basic-addon2">
                    </div>
                    <div class="col-md-6 mb-3">
                        <button class="btn btn-primary searchDocument message" type="button">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                </div>
                <div class="form-row">
                &nbsp;
	                	<label for="meTitle" style="padding-top:5px;">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>&nbsp;&nbsp;&nbsp;
	                    <input type="text" id="meTitle" name="meTitle" style="width:480px;" class="form-control bg-light small" required aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <br />
                <div class="form-row message">
                    <div class="col-md-6 mb-3">
                        <label for="storeNo">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</label><br />
                        <textarea class="form-control message-comment" required name="messageContent" cols="80" rows="5" aria-label="With textarea"></textarea>	
                    </div>
                </div>
				<div class="modal-footer ">
        			<button type="submit" id="FrmBtn" name="submit" class="btn btn-primary">전송</button>
            		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        		</div>       
            </form>
      </div>
         


<style>
.col-md-6 .mb-3 .col-md-6 .mb-3 .mb-4{
	width:350px !important;
}
.controll-modal-body.document{
  width: 60%;
}
#insert-message-container {
    width:580px;
    height:560px;
}
.modal-content{
	width:600px;
	height:600px; 
}
#formGroupExampleInput {
    width: 70%;
}
.form-control {
    display:inline;
    width: 60%;
}
.message-comment {
	width:200%;
	height:90% !important;
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
#accordionSidebar{
	background-image : linear-gradient(180deg,#00475d 10%,#0a0f29 100%) !important;
}
.form-row.message{
	height:330px;
}

</style>
<script>  


  $(()=>{
	  
	  
	  $(".searchDocument.message").click(function(){
	    	 $('.controll-modal-body-searhMessageList').load("${pageContext.request.contextPath}/message/messageSelectList.do",function(){
	 	        $('#searhMessageList').modal({backdrop: 'static', keyboard: false});
	 	        $('#searhMessageList').modal({show:true});
	 	        $(".modal-backdrop.in").css('opacity', 0.4);
	 	       	$(".control-title-searhMessageList").html("");
	 	        $(".control-title-searhMessageList").html("회원리스트");
	 		});
	            
	    });
	  
	  $(".searchModal-end").click(function(){
	    	$('#searhMessageList').modal("hide");
	    }); 
	  
})
  
</script>
</body>
</html>