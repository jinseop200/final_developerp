<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.table-approval-line-stamp th{
border:1px solid #ccc; 
text-align:center;
padding:3px;
}
.table-approval-line-stamp td{
border:1px solid #ccc;
}
.table-approval-line-content th{
border:1px solid #ccc; 
padding:3px;
}
.table-approval-line-content td{
border:1px solid #ccc;
}
</style>
	<form action="${pageContext.request.contextPath}/document/updateDocument.do" name="documentEnrollFrm"  method="post" >
	<input type="hidden" value="${memberLoggedIn.empName}" id="empName" name="empName" />
    <input type="hidden" value="${list.docNo}" id="docNo" name="docNo" />
    <input type="hidden" value="${memberLoggedIn.email}" id="email" name="email" />
    	<table style="margin: 0px auto; width: 800px; position: static; left: auto; top: auto;">
    		<tbody>
    			<tr>
    				<td >
    					<table cellspacing="0" cellpadding="0" width="100%" border="0" id="trTitle">
    						<tbody>
    							<tr>
    								<td>
    									<p style="FONT-SIZE: 25px; FONT-WEIGHT: bold; TEXT-ALIGN: center">
    										<span style="">
    											<span class="ecount4750" style="font-size:40px; BORDER-BOTTOM: gray 1px solid; border-top:1px solid gray">
    												${list.docType}
    											</span>
    										</span>
    									</p>
    								<table cellspacing="0" cellpadding="0" width="100%" border="0" class="documentDetail header">
    									<tbody>
    										<tr>
    											<td style="HEIGHT: 18px; TEXT-ALIGN: right">
	    											<div style="display:inline-block;margin-top:-4px;padding-top:4px;">
	    												<table class="table table-approval-line-stamp" style="min-width:150px;" >
	    													<tbody>
	    														<tr>
	    															<th rowspan="2" style="color:#ccc;">결<br><br><br>재</th>
	    															 <c:forEach items="${docLine}" var="d" varStatus="vs">
	    															 	<c:if test="${d.nextWriter!=null}">
	    																	<th style="color:black;">${d.nextWriter}</th>
	    																</c:if>
	    															</c:forEach>
	    														</tr>
	    														<tr class="stamp-area">
	    															 <c:forEach items="${docLine}" var="d" varStatus="vs">
											                        	<c:if test="${d.returnYn=='Y' && d.nextWriter!=null}">
											                    			<td>&nbsp;</td>
											                        	</c:if>
											                        	<c:if test="${d.returnYn=='N' && d.nextWriter!=null}">
											                        		<td><img src="${pageContext.request.contextPath }/resources/images/documentCheck.png" alt="체크" width="35px" height="35px" /></td>
											                        	</c:if>
											                    	</c:forEach>
	    														</tr>
	    													</tbody>
	    												</table> 
	    											</div> 
	    										</td>
	    									</tr>
	    								</tbody>
	    							</table>
    								<table cellspacing="0" cellpadding="0" width="800px" border="0" class="documentDetail content">
    									<tbody>
    										<tr>
    											<td>
	    											<div style="display:inline-block; margin-top:-4px; padding-top:4px;">
	    												<table class="table table-approval-line-content" >
	    													<tbody>
		    													<tr>
			    													<td style="width:75px; text-align:center; ">소속</td>
			    													<td style="width:320px; text-align:center; color:black;">${dept_title.DEPT_TITLE}</td>
			    													<td style="width:85px; text-align:center; ">직위</td>
			    													<td style="width:320px; text-align:center; color:black;">${job_name.JOB_NAME}</td>
		    													</tr>
		    													<tr>
			    													<td style="width:75px; text-align:center;">성명</td>
			    													<td style="width:320px; text-align:center; color:black;">${memberLoggedIn.empName}</td>
		    														<c:if test="${list.docType=='휴가신청서'}">
				    													<td style="width:85px; text-align:center;">휴가기간</td>
				    													<td style="width:320px; text-align:center; color:black; font-size:14px;">${list.startDate}~${list.endDate}</td>
		    														</c:if>
		    														<c:if test="${list.docType!='휴가신청서'}">
				    													<td style="width:85px; text-align:center;">작성일자</td>
				    													<td style="width:320px; text-align:center; color:black;">${list.regDate }</td>
		    														</c:if>
		    													</tr>
		    													<tr>
		    														<td colspan="4" style="text-align:center; color:gray;">
		    															아래의 사유로 "${list.docType}"을 제출하오니 허락하여 주시기 바랍니다.
		    															<br>	
		    															<br />
		    															<div style="text-align:left; color:black;">
		    																${list.docContent}
		    															</div>
		    															<br />
		    															<br />
		    															<br />
		    															<br />
		    															<br />
		    															<br />
		    															${list.regDate }
		    															
		    														</td>
		    													</tr>
	    													</tbody>
	    												</table> 
	    											</div> 
	    										</td>
	    									</tr>
	    								</tbody>
	    							</table>
	    						</td>
	    					</tr>
	    				</tbody>
	    			</table>
	    		</td>
	    	</tr>  
		</tbody>
	</table>
	<div class="modal-footer">
                    <c:forEach items="${docLine}" var="d" varStatus="vs">
						<c:if test="${(memberLoggedIn.empName == d.nextWriter) and (d.returnYn == 'Y') and (prevWriter.returnYn=='N')}">
		        			<button type="submit" id="FrmBtn" name="submitApprove" value="1" class="btn btn-primary">결재</button>
		        			<button type="submit" id="FrmBtn" name="submitApprove" value="0" class="btn btn-primary">반려</button>
	        			</c:if>
						<c:if test="${(memberLoggedIn.empName == d.nextWriter) and (d.returnYn == 'N')}">
		        			<button id="FrmBtn" type="button" name="submitApprove" value="1" class="btn btn-primary">결재완료됨</button>
	        			</c:if>
        			</c:forEach>
						<c:if test="${(memberLoggedIn.empName == nextWriter.nextWriter) and (prevWriter.returnYn == 'Y')}">
		        			<button id="FrmBtn" type="button" name="submitApprove" value="1" class="btn btn-primary">결재진행중</button>
	        			</c:if>
            		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        		</div>    

</form>          
      <!-- search-container start -->
<!--       <div id="insert-container"> -->
<%--           <form class="needs-validation" action="${pageContext.request.contextPath}/document/updateDocument.do"  --%>
<!--           		name="documentEnrollFrm" method="post"> -->
<!--                 <div class="form-row"> -->
<!--                     <div class="col-md-6 mb-3"> -->
<!--                     <label for="documentDate">일  자</label>&nbsp;&nbsp;&nbsp;&nbsp; -->
<%-- 	                <input type="text" id="documentDate" value="${list.regDate}" readonly name="documentDate" class="form-control bg-light small" aria-label="Search" aria-describedby="basic-addon2"> --%>
<!--                     </div> -->
<!--                 </div>    -->
<!--                 <div class="form-row"> -->
<!-- 	                <div class="col-md-6 mb-3"> -->
<!-- 	                	<label for="documentTitle">제  목</label>&nbsp;&nbsp;&nbsp;&nbsp; -->
<%-- 	                    <input type="text" id="documentTitle" value="${list.docTitle}" readonly name="documentTitle" class="form-control bg-light small" aria-label="Search" aria-describedby="basic-addon2"> --%>
<!-- 	                </div>  -->
<!--                 </div> -->
<!--                 <div class="form-row nextApproval"> -->
<!--                         <label for="docLastapproval">결재자</label>&nbsp;&nbsp;&nbsp;&nbsp; -->
<%--                         <c:forEach items="${docLine}" var="d" varStatus="vs"> --%>
<%--                         	<c:if test="${d.returnYn=='Y' && d.nextWriter!=null}"> --%>
<%--                         	<input type="text" id="docLastapproval" value="${d.nextWriter}" style="border:1px solid red" readonly name="docLastapproval" class="form-control bg-light small nextWriter" aria-label="Search" aria-describedby="basic-addon2"> --%>
<!--                     		&nbsp;&nbsp;&nbsp;&nbsp; -->
<%--                         	</c:if> --%>
<%--                         	<c:if test="${d.returnYn=='N' && d.nextWriter!=null}"> --%>
<%--                         	<input type="text" id="docLastapproval" value="${d.nextWriter}" style="border:2px solid #00c500" readonly name="docLastapproval" class="form-control bg-light small nextWriter" aria-label="Search" aria-describedby="basic-addon2"> --%>
<!--                     		&nbsp;&nbsp;&nbsp;&nbsp; -->
<%--                         	</c:if> --%>
<%--                     	</c:forEach> --%>
<!--                 </div> -->
                
<!--                 <div class="form-row"> -->
<!--                     <div class="col-md-6 mb-3"> -->
<!--                         <label for="type">구  분 </label>&nbsp;&nbsp;&nbsp;&nbsp; -->
<%--                         <input type="text" id="docType" value="${list.docType}" readonly name="docType" class="form-control bg-light small" aria-label="Search" aria-describedby="basic-addon2"> --%>
					
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="form-row"> -->
<!--                     <div class="col-md-6 mb-3"> -->
<!--                         <label for="storeNo">내  용</label>&nbsp;&nbsp;&nbsp;&nbsp;<br /> -->
<%--                         <textarea class="form-control quality-comment" placeholder="${list.docContent}" readonly name="documentContent" cols="80" rows="5" aria-label="With textarea"></textarea>	 --%>
<!--                     </div> -->
<!--                 </div> -->
<!-- 				<div class="modal-footer"> -->
<%--                     <c:forEach items="${docLine}" var="d" varStatus="vs"> --%>
<%-- 						<c:if test="${(memberLoggedIn.empName == d.nextWriter) and (d.returnYn == 'Y') and (prevWriter.returnYn=='N')}"> --%>
<!-- 		        			<button type="submit" id="FrmBtn" name="submitApprove" value="1" class="btn btn-primary">결재</button> -->
<!-- 		        			<button type="submit" id="FrmBtn" name="submitApprove" value="0" class="btn btn-primary">반려</button> -->
<%-- 	        			</c:if> --%>
<%-- 						<c:if test="${(memberLoggedIn.empName == d.nextWriter) and (d.returnYn == 'N')}"> --%>
<!-- 		        			<button id="FrmBtn" type="button" name="submitApprove" value="1" class="btn btn-primary">결재완료됨</button> -->
<%-- 	        			</c:if> --%>
<%--         			</c:forEach> --%>
<%-- 						<c:if test="${(memberLoggedIn.empName == nextWriter.nextWriter) and (prevWriter.returnYn == 'Y')}"> --%>
<!-- 		        			<button id="FrmBtn" type="button" name="submitApprove" value="1" class="btn btn-primary">결재진행중</button> -->
<%-- 	        			</c:if> --%>
<!--             		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button> -->
<!--         		</div>        -->
<!--             </form> -->
<!--       </div> -->
         


<style>
#insert-container {
    width:660px;
}
.modal-content{
	width:900px;
	height:100% !important; 
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
.nextWriter{width:100px !important;}
.nextApproval{padding-bottom:15px;}
.modal.modal-center {
  text-align: center;
}

  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle; 
}


</style>
<script>
	$(()=>{
		var docLastapproval = $("#docLastapproval").val();
	});

</script>
