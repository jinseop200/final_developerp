<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <!-- Custom styles for this page -->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">작업 지시서</h1>
           <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="float:right;">
            <div class="input-group" style="margin:30px;" >
              <div class="input-group-append">
                <button class="btn btn-primary" type="button" id="quality-insert-button">
                	  신규 등록 
                </button> &nbsp;&nbsp;&nbsp;&nbsp;
                <button class="btn btn-primary" type="button" id="quality-search-button">
                	  부적합 상세 검색하기&nbsp;&nbsp;&nbsp; <i class="fas fa-search fa-sm"></i>
                </button> 
              </div>
            </div>
          </form>
          <br />

          <!-- DataTales Example -->
          <div class="card shadow mb-4" style="clear:both;">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">조회 결과</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>작업지시번호</th>
                      <th>납품처</th>
                      <th>납기일</th>
                      <th>담당자</th>
                      <th>제품명</th>
                      <th>지시수량</th>
                    </tr>
                  </thead>
                 
                  <tbody>
                    <tr>
                      <td>Tiger Nixon</td>
                      <td>System Architect</td>
                      <td>Edinburgh</td>
                      <td>61</td>
                      <td>2011/04/25</td>
                      <td>$320,800</td>
                    </tr>
                    <tr>
                      <td>Garrett Winters</td>
                      <td>Accountant</td>
                      <td>Tokyo</td>
                      <td>63</td>
                      <td>2011/07/25</td>
                      <td>$170,750</td>
                    </tr>
                    <tr>
                      <td>Ashton Cox</td>
                      <td>Junior Technical Author</td>
                      <td>San Francisco</td>
                      <td>66</td>
                      <td>2009/01/12</td>
                      <td>$86,000</td>
                    </tr>
                    <tr>
                      <td>Cedric Kelly</td>
                      <td>Senior Javascript Developer</td>
                      <td>Edinburgh</td>
                      <td>22</td>
                      <td>2012/03/29</td>
                      <td>$433,060</td>
                    </tr>
                    <tr>
                      <td>Airi Satou</td>
                      <td>Accountant</td>
                      <td>Tokyo</td>
                      <td>33</td>
                      <td>2008/11/28</td>
                      <td>$162,700</td>
                    </tr>
                    <tr>
                      <td>Brielle Williamson</td>
                      <td>Integration Specialist</td>
                      <td>New York</td>
                      <td>61</td>
                      <td>2012/12/02</td>
                      <td>$372,000</td>
                    </tr>
                    <tr>
                      <td>Herrod Chandler</td>
                      <td>Sales Assistant</td>
                      <td>San Francisco</td>
                      <td>59</td>
                      <td>2012/08/06</td>
                      <td>$137,500</td>
                    </tr>
                    <tr>
                      <td>Rhona Davidson</td>
                      <td>Integration Specialist</td>
                      <td>Tokyo</td>
                      <td>55</td>
                      <td>2010/10/14</td>
                      <td>$327,900</td>
                    </tr>
                    <tr>
                      <td>Colleen Hurst</td>
                      <td>Javascript Developer</td>
                      <td>San Francisco</td>
                      <td>39</td>
                      <td>2009/09/15</td>
                      <td>$205,500</td>
                    </tr>
                    <tr>
                      <td>Sonya Frost</td>
                      <td>Software Engineer</td>
                      <td>Edinburgh</td>
                      <td>23</td>
                      <td>2008/12/13</td>
                      <td>$103,600</td>
                    </tr>
                    <tr>
                      <td>Jena Gaines</td>
                      <td>Office Manager</td>
                      <td>London</td>
                      <td>30</td>
                      <td>2008/12/19</td>
                      <td>$90,560</td>
                    </tr>
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
  <!-- Modal -->
<div class="modal" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title controll-title"></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body controll-modal-body">
            <!-- <p>Modal body text goes here.</p> -->
        </div>
        
        </div>
    </div>
</div>
  
  <script>
  $("#quality-search-button").click(function(){
      $('.controll-modal-body').load("${pageContext.request.contextPath}/quality/qualitySearch.do",function(){
          $('#myModal').modal({backdrop: 'static', keyboard: false});
          $('#myModal').modal({show:true});
          $(".modal-backdrop.in").css('opacity', 0.4);
          
          $(".controll-title").html("");
          $(".controll-title").html("부적합 상세조회");
          
      });
  });
  $("#quality-insert-button").click(function(){
	  $('.controll-modal-body').load("${pageContext.request.contextPath}/productplan/insertJobOrder.do",function(){
          $('#myModal').modal({backdrop: 'static', keyboard: false});
          $('#myModal').modal({show:true});
          $(".modal-backdrop.in").css('opacity', 0.4);
          $(".controll-title").html("작업지시서 등록");
  	});
  });
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