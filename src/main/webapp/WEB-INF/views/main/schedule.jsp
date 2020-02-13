<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <!-- search-container start -->
      <div id="insert-container">
          <form class="needs-validation" action="${pageContext.request.contextPath}/document/enrollDocument.do" 
          		name="documentEnrollFrm" method="post">
          		<div>
          		<input type="hidden" value="${memberLoggedIn.email}" id="email" name="email" />
          		</div>
                <div class="form-row">
	                <div class="col-md-6 mb-3">
	                	<label for="documentTitle">제  목</label>&nbsp;&nbsp;&nbsp;&nbsp;
	                    <input type="text" id="title" name="title" class="form-control bg-light small" required aria-label="Search" aria-describedby="basic-addon2">
	                </div> 
                </div>
                <div class="form-row">
<!--                     <div class="col-md-6 mb-3" >                   -->
                    <label >일  자</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="input" id="startScheduleTime" name="startScheduleTime" value='${date}' class="form-control bg-light small"readonly style="width:120px;">
                    &nbsp;&nbsp;
                    <input type="time" name="startTime" id="startTime" class="form-control bg-light small" style="width:120px;">
                    &nbsp;&nbsp;~&nbsp;&nbsp;
                    <input type="date"id="endScheduleTime" name="endScheduleTime" class="form-control bg-light small"style="width:120px;">
                    &nbsp;&nbsp;
                    <input type="time" id="endTime" name="endTime" class="form-control bg-light small"style="width:120px;">                    
<!--                     </div> -->
                </div>   
      
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="type">구  분 </label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="checkbox">
                   
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="storeNo">내  용</label>&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        <textarea class="form-control document-comment" required name="content" cols="80" rows="5" aria-label="With textarea"></textarea>	
                    </div>
                </div>
				<div class="modal-footer">
        			<button type="submit" id="FrmBtn" name="submit" class="btn btn-primary">등록</button>
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
#insert-container {
    width:660px;
}
.modal-content{
	width:700px;
	height:100% !important; 
}
#formGroupExampleInput {
    width: 70%;
}
.form-control {
    display:inline;
    width: 60%;
}
.document-comment {
	width:200%;
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
