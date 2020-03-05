<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%Date now = new Date(); 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <!-- Custom styles for this page -->
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<!-- Page Heading -->

			     <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="type">게시판 </label>&nbsp;&nbsp;&nbsp;&nbsp;
                    <tr>
						<td>
							<select name="boardType" id="boardType" required>
								<option value="" selected disabled >타입</option>
									<c:forEach items="${board}" var="b">
										<option value="${b.boardNo}">${b.boardName}</option>
									</c:forEach>
							</select>
						</td>
					</tr>
                    </div>
                </div>

          <!-- DataTales Example -->
          <div class="card shadow mb-4" style="clear:both;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">조회 결과</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered board-list-table" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>                    
                      <th>No</th>
                      <th>제목</th>
                      <th>작성자</th>
                      
                      <th>작성일자</th>
                      <th>타입</th>
                      <th>보기</th>
                    </tr>
                  </thead>
                  <tbody >
                  <tbody>
                	<c:forEach items="${boardlist }" var="l" varStatus="vs">
	                    <tr class="getTr">
	                      <td id="${l.docNo}">${vs.count}</td>
	                      <td>${l.regDate }</td>
	                      <td>${l.docTitle }</td>
	                      <td>${l.docType }</td>
	                      <td>${l.docWriter}</td>
	                      <td>${l.docLastapproval}</td>
	                      <td>${l.docStatus}</td>
	                      <td><a href="#" />보기</td>
	                    </tr>
                  	</c:forEach>
                  </tbody>
                  
                  </tbody>
                </table>
              </div>
            </div>
          </div>
           <button class="btn btn-primary" type="button" id="board-insert-button">신규 </button>
          
  <!--insertBoard Modal -->
<div class="modal" tabindex="-1" role="dialog" id="boardAddModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header boardAddModal">
            <h5 class="modal-title controll-title"></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body controll-modal-body boardAddModal">
            <!-- <p>Modal body text goes here.</p> -->
        </div>
        
        </div>
    </div>
</div>

 <!-- detailView Modal -->
<div class="modal" tabindex="-1" role="dialog" id="boardDetailView">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title controll-title"></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body controll-modal-body boardDetailView">
            <!-- <p>Modal body text goes here.</p> -->
        </div>
        <div class="modal-footer">
            		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        		</div>  
        </div>
    </div>
</div>

<%--boardLastApproval modal --%>
<div class="modal" tabindex="-1" role="dialog" id="searchBoard">
  <div class="modal-dialog" role="document">
      <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title search-title" id="searchModalTitle"> </h5>
      </div>
      <div class="modal-body searchModalBody">
          <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-primary searchModal-end">닫기</button>
      </div>
      </div>
  </div>
</div>
  
<script>

/* $(".btn-primary").click(function(){
var boardNo= $(this).closest("tr").children().eq(0).html(); */
$(()=>{
	$('.controll-modal-body.boardDetailView').load("${pageContext.request.contextPath}/board/boardDetailView.do?categoryNo=${categoryNo}",function(){
        $('#boardDetailView').modal({backdrop: 'static', keyboard: false});
        $('#boardDetailView').modal({show:true});
        $(".modal-backdrop.in").css('opacity', 0.4);
        $(".controll-title").html("");
        $(".controll-title").html("상세보기");
	});
	$.ajax({
		url:"${pageContext.request.contextPath}/board/boardAllList.do",
		dataType:"json",
		success:data=>{
			console.log(data);
			$(".board-list-table tbody").children().remove();
			var list = data.list;
			for(var i in list){
				let p = list[i];
				$(".board-list-table tbody").append("<tr class='getBo'><td>"+(Number(i))+"</td><td>"+p.CATEGORY_TITLE+"</td><td>"+p.CATEGORY_WRITER+"</td><td hidden>"+p.CATEGORY_COMMENT+"</td><td>"+p.CATEGORY_DAY+"</td><td>"+p.BOARD_NAME+"</td><td><a href='#' onclick='detailBoard("+p.CATEGORY_NO+");'>보기</a></td></tr>");
			}
		},
		error : (jqxhr, textStatus, errorThrown)=>{
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
	function detailBoard(){
		console.log("!23123124124214");
		var tr = $(this).parent().parent();
		var td = tr.children();
		console.log(tr);
		
		var tdCategoryNo = td.eq(0).attr("id");
		console.log(tdCategoryNo);
		console.log(tdCategoryNo);
		$('.controll-modal-body.boardDetailView').load("${pageContext.request.contextPath}/board/boardDetailView.do?categoryNo="+tdCategoryNo,function(){
	        $('#boardDetailView').modal({backdrop: 'static', keyboard: false});
	        $('#boardDetailView').modal({show:true});
	        $(".modal-backdrop.in").css('opacity', 0.4);
	        $(".controll-title").html("");
	        $(".controll-title").html("상세보기");
		});
		
	};
});
$("#board-insert-button").click(function(){
 $('.controll-modal-body').load("${pageContext.request.contextPath}/board/insertBoardForm.do",function(){
        $('#boardAddModal').modal({backdrop: 'static', keyboard: false});
        $('#boardAddModal').modal({show:true});
        $(".modal-backdrop.in").css('opacity', 0.4);
        $(".controll-title").html("");
        $(".controll-title").html("게시판 작성");
	});
});

$("#boardType").change(function(){
	var boardNo = $("#boardType").val();
	console.log(boardNo);
	if(boardNo==0) {
		url_ = "${pageContext.request.contextPath}/board/boardAllList.do";
	}
	else {
		url_="${pageContext.request.contextPath}/board/boardClubList.do?boardNo="+boardNo;
	}
		$.ajax({
			url:url_,
			dataType:"json",
			success:data=>{
				console.log(data);
				var list = data.list;
				$(".board-list-table tbody").children().remove();
				for(var i in list){
					let p = list[i];
					$(".board-list-table tbody").append("<tr class='getBo'><td>"+(Number(i))+"</td><td>"+p.CATEGORY_TITLE+"</td><td>"+p.CATEGORY_WRITER+"</td><td hidden>"+p.CATEGORY_COMMENT+"</td><td>"+p.CATEGORY_DAY+"</td><td>"+p.BOARD_NAME+"</td><td><a href='#' onclick=detailBoard("+p.CATEGORY_NO+");>보기</a></td></tr>");
				}
			},
			error : (jqxhr, textStatus, errorThrown)=>{
				console.log(jqxhr, textStatus, errorThrown);
			}
		});
});

function detailBoard(tdCategoryNo){	
	$('.controll-modal-body.boardDetailView').load("${pageContext.request.contextPath}/board/boardDetailView.do?categoryNo="+tdCategoryNo,function(){
        $('#boardDetailView').modal({backdrop: 'static', keyboard: false});
        $('#boardDetailView').modal({show:true});
        $(".modal-backdrop.in").css('opacity', 0.4);
        $(".controll-title").html("");
        $(".controll-title").html("상세보기");
	});
	
};

</script>
<style>
#myModal{
	z-index: 1060;
}

</style>


  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>