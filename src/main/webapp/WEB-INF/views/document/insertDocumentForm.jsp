<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>기안서 작성</title>
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
                    <input type="date" id="documentDate" name="documentDate" required >
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
#accordionSidebar{
	background-image : linear-gradient(180deg,#00475d 10%,#0a0f29 100%) !important;
}

</style>
<script>  

  $(()=>{
	  var date = new Date();
	  var yyyy = date.getFullYear();
	  var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
	  var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	   
	  $("input[type=date]").val(yyyy+"-"+mm+"-"+dd);

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