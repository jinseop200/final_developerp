<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

   <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<p1>원재료 재고관리(LOT)</p1>
<body id="page-top">

  <!-- Begin Page Content -->
  <div class="container-fluid">
    
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">재고 관리 테이블</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            
              <tr>
               <th>로트번호</th>
               <th>원재료번호</th>
               <th>창고번호</th>
               <th>입고수량</th>
               <th>부적합여부</th>
               <th>입고일</th>
              </tr>
            </thead>
            
            <tfoot>
              <tr>
               <th>로트번호</th>
               <th>원재료번호</th>
               <th>창고번호</th>
               <th>입고수량</th>
               <th>부적합여부</th>
               <th>입고일</th>
              </tr>
            </tfoot>
            
            <tbody>
              <tr>
                <td>M1234</td>
                <td>1234</td>
                <td>A11</td>
                <td>500</td>
                <td>T</td>
                <td>2020/02/04</td>
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
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>



</body>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>