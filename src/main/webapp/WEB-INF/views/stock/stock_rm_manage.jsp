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
                <td>M1235</td>
                <td>1235</td>
                <td>A12</td>
                <td>501</td>
                <td>T</td>
                <td>2020/02/05</td>
              </tr>
              
              <tr>
                <td>M1236</td>
                <td>1236</td>
                <td>A13</td>
                <td>502</td>
                <td>F</td>
                <td>2020/02/05</td>
              </tr>
              
              <tr>
                <td>M1237</td>
                <td>1237</td>
                <td>A14</td>
                <td>504</td>
                <td>T</td>
                <td>2020/02/04</td>
              </tr>
              
              <tr>
                <td>M1238</td>
                <td>1238</td>
                <td>A17</td>
                <td>500</td>
                <td>F</td>
                <td>2020/02/10</td>
              </tr>
              
              <tr>
                <td>M1250</td>
                <td>1250</td>
                <td>A24</td>
                <td>522</td>
                <td>T</td>
                <td>2020/02/04</td>
              </tr>
              
              <tr>
                <td>M1225</td>
                <td>1225</td>
                <td>A24</td>
                <td>500</td>
                <td>T</td>
                <td>2020/04/05</td>
              </tr>
              
              <tr>
                <td>M1282</td>
                <td>1282</td>
                <td>A15</td>
                <td>525</td>
                <td>T</td>
                <td>2020/07/07</td>
              </tr>
              
              <tr>
                <td>M1274</td>
                <td>1274</td>
                <td>A20</td>
                <td>500</td>
                <td>T</td>
                <td>2020/03/04</td>
              </tr>
              
              <tr>
                <td>M1272</td>
                <td>1272</td>
                <td>A11</td>
                <td>522</td>
                <td>F</td>
                <td>2020/05/04</td>
              </tr>
              
              <tr>
                <td>M1264</td>
                <td>1264</td>
                <td>A12</td>
                <td>504</td>
                <td>T</td>
                <td>2020/05/04</td>
              </tr>
              
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>



</body>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>