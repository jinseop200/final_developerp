<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<body class="ng-scope">
    <main class="pg-restaurant ng-scope">
        <article class="contents">
    

								
													<!-- 댓글 부분 -->
											<div class="comment-editor">

												<textarea name="boarding" id="boarding" cols="80" rows="11"
													placeholder="맛집의 후기를 남겨주세요!"></textarea>
												<input type="submit" id="btn-insert"  value="등록" onclick="return insertComment();"/>
												<input type="hidden" name="rName" value="${memberLoggedIn.empName}" />
												<input type="hidden" name="location" value="<%=r.getLocation() %>" />
											</div>
										</div>
									</form>
								</section></br></br>
								<div id="photo-container" ></div>
								
								<section  class="comment-container" id="comment-update-container">
									<form
										name = "commentUpdateForm" 
										action="<%=request.getContextPath()%>/comment/commentUpdateEnd"
										method="POST" enctype="multipart/form-data">
								
													<!-- 댓글 부분 -->
											<div class="comment-editor">

												<textarea name="update-boarding" id="update-boarding" cols="80" rows="11"
													placeholder="맛집의 후기를 남겨주세요!"></textarea></br>
												<input type="submit" id="btn-update"  value="수정하기" onclick="return updateComment();"/>
												<input type="button" value="닫기" onclick="hideUpdate();" />
												<input type="hidden" name="boardRef" value="0"/>
												<input type="hidden" name="rName" value="<%=r.getrName() %>" />
												<input type="hidden" name="location" value="<%=r.getLocation() %>" />
											</div>
										</div>
									</form>
								</section></br></br>

<script>
$(()=>{
	console.log("<%=thisRname%>");
	
	$.ajax({
		url : "<%=request.getContextPath()%>/comment/commentList",
		data: {rName:"<%=thisRname%>"},
		dataType : "json",
		success: data=>{
			for(let i  in data){
				let html = "";
				let c = data[i];
				var renamedFileName="";
				if(c.renamedFileName != "") {renamedFileName = c.renamedFileName;}else{renamedFileName = "eats.jpg"}
				var gradestar = "";
				var gradecontent = "";
				
				
				if(i<3) {
					html += "<div class='comment_box'>"					
				}
				else {
					html += "<div class='comment_box hidden'>"
				}
				html += "<div class= 'comment_imgbox'>" 
					+ 		"<img src='<%=request.getContextPath()%>/images/" + renamedFileName + "'/>" 
					+ 	"</div>"
					
					+ 	"<div class='comment_contentbox'>" 
					
					+		"<span class='cid'> [" +  c.id + "] 님의 댓글"+ "</span>" +"<span class='cdate'> 댓글 날짜: " + c.bDate + "</span>" + "</br>"
					+		"<img class='commentstar' src='<%=request.getContextPath()%>/images/" + gradestar + "'/></br>"

					+		"<div class='cboarding'>"  + c.boarding +  "</div>" + "</br></br></br>";
				if("<%=userLoginId%>"==c.id||"<%=userLoginId%>"=="admin"){
					html += "<input type='button' value='수정하기' onclick='updateBoard(this)'>"
						+		"<input class='deleteComment' type='button' value='삭제하기' onclick='deleteBoard(this)'>"
				}		
				html +=		"<form name='boardDelFrm' action='<%=request.getContextPath()%>/comment/commentDelete' method='post'>"
				    +			"<input type='hidden' name='boardNo' value='"+ c.boardNo + "'/>"
				    +			"<input type='hidden' name='renamedFileName' value='" + c.renamedFileName+ "' />"
			    	+		"</form>"
			    	
					+ 	"</div>" 	
					
					+ "</div>";
					
					
					
				$("#photo-container").append(html);
				$("#boardNo").val(c.boardNo);
				console.log(renamedFileName);
			}
			
			if(data.length>3) {
				$("#photo-container").append("<div><button id='moreReview' onclick='moreReview()'>더보기</button></div></br></br>");
			}
		
		},
		error: (a,b,c)=>{
			console.log(a,b,c);
		}
		
	});
	
});

function updateBoard(a){
 	var $commentbox = $(a).parents().parents().eq(0);
 	var $commentContainer = $("#comment-update-container");
 	$commentContainer.css("display","block");
 	
 	
 	$commentbox.after($commentContainer);
	
 	var boardRef = $(a).next().next().children('[name=boardNo]').val();
	
 	$("[name=boardRef]").val(boardRef);
 	
 	return;
}

function hideUpdate(){
	var $commentContainer = $("#comment-update-container");
	$commentContainer.css("display","none")
}


function deleteBoard(a){
 if(!confirm('이 댓글을 삭제하시겠습니까?')) return;
 var boardNo = $(a).parents().find("[name=boardNo]").val();
 location.href = "<%=request.getContextPath()%>/comment/commentDelete?rName="+"<%=thisRname%>"+"&boardNo="+boardNo; 
 
//  console.log($(a).parents().find("[name=boardNo]").val());
//  $("[name=boardDelFrm]").submit();
}

function insertComment(){
	
// 	console.log($("#boarding").text().trim()=='');
	console.log("<%=userLoginId%>"=="");
// 	console.log($("#boarding").val());

	if($("#boarding").val().trim()=='') {
		alert("내용을 입력해 주세요.");
		return false;
	}
	else if("<%=userLoginId%>"=="") {
		alert("로그인 후 이용하실 수 있습니다.");
		return false;
	}
	else {
		return true;	
	}
}

function updateComment(){
	
// 	console.log($("#boarding").text().trim()=='');
	console.log("<%=userLoginId%>"=="");
// 	console.log($("#boarding").val());

	if($("#update-boarding").val().trim()=='') {
		alert("수정을 위해 내용을 입력해 주세요.");
		return false;
	}
	else if("<%=memberLoggedIn%>"=="") {
		alert("로그인 후 이용하실 수 있습니다.");
		return false;
	}
	else {
		return true;	
	}
}

}
</script>
                                </section>
                            </div>
                        </section>
                    </div>
                </div>
                
                        </script>
                       
                    </div>
                </div>
            </div>

        </article>
    </main>
    


    <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>