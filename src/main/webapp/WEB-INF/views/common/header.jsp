<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP Main</title>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
	  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath }/resources/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath }/resources/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/demo/chart-pie-demo.js"></script>
  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <!--  chart -->
  <style>
 .main-container{
    width: 1440px;
  }
  .bg-gradient-primary{
    background-image: linear-gradient(180deg,#00475d 10%,#0a0f29 100%);
  }
  </style>

</head>

	<div class="main-container">
    <body id="page-top">

      <!-- Page Wrapper -->
      <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

          <!-- Sidebar - Brand -->
          <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath }/main/main.do">
            <div class="sidebar-brand-icon rotate-n-15">
              <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">DEVELOP <sup>ERP</sup></div>
          </a>

          <!-- Divider -->
          <hr class="sidebar-divider my-0">

          <!-- Nav Item - Dashboard -->
          <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath }/main/main.do">
              <i class="fas fa-fw fa-tachometer-alt"></i>
              <span>메인페이지</span></a>
          </li>

          <!-- Divider -->
          <hr class="sidebar-divider">

          <!-- Heading -->
          <div class="sidebar-heading">
            COMMUNITY
          </div>

          <!-- Nav Item - Pages Collapse Menu -->
          <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
              <i class="fas fa-fw fa-user"></i>
              <span>그룹웨어</span>
            </a>
            <div id="collapseOne" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
              <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Detail</h6>
                <a class="collapse-item" href="${pageContext.request.contextPath }/document/documentView.do?empName=${memberLoggedIn.empName}">문서결재</a>
                <a class="collapse-item" href="${pageContext.request.contextPath }/attend/attendList.do?email=${memberLoggedIn.email}">출결관리</a>
                <a class="collapse-item" href="cards.html">쪽지함</a>
                <a class="collapse-item" href="cards.html">메신저</a>
                <a class="collapse-item" href="cards.html">게시판</a>
                <a class="collapse-item" href="cards.html">시설물 예약</a>
              </div>
            </div>
          </li>

          <!-- Divider -->
          <hr class="sidebar-divider">

           <!-- Heading -->
           <div class="sidebar-heading">
            MANAGEMENT
          </div>

          <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
              <i class="fas fa-fw fa-cog"></i>
              <span>기초등록</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
              <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">DETAIL</h6>
               	<a class="collapse-item" href="${pageContext.request.contextPath }/enrollment/vendorEnrollment.do">거래처등록</a>
                <a class="collapse-item" href="${pageContext.request.contextPath }/enrollment/warehouseEnrollment.do">창고등록</a>
                <a class="collapse-item" href="${pageContext.request.contextPath }/enrollment/productEnrollment.do">품목등록</a>
              </div>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
              <i class="fas fa-fw fa-cog"></i>
              <span>생산관리</span>
            </a>
            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionSidebar">
              <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">DETAIL</h6>
                <a class="collapse-item" href="${pageContext.request.contextPath }/production/BOMListManagement.do">BOM 목록관리</a>
                <a class="collapse-item" href="${pageContext.request.contextPath }/production/warehousing.do">생산입고</a>
              </div>
            </div>
          </li>

          <li class="nav-item">
              <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                <i class="fas fa-fw fa-cog"></i>
                <span>생산 계획 관리</span>
              </a>
              <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                  <h6 class="collapse-header">DETAIL</h6>
                   <a class="collapse-item" href="buttons.html">주별 생산 계획</a>
                  <a class="collapse-item" href="cards.html">원재료 구매 계획</a>
                  <a class="collapse-item" href="cards.html">생산률 조회</a>
                  <a class="collapse-item" href="${pageContext.request.contextPath}/productplan/jobOrder.do">작업 지시서</a>
                </div>
              </div>
            </li>

          
          <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
              <i class="fas fa-fw fa-cog"></i>
              <span>재고관리</span>
            </a>
            <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionSidebar">
              <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">DETAIL</h6>
                <a class="collapse-item" href="${pageContext.request.contextPath }/stock/rm/rmView.do">원재료 입출고/재고관리</a>
                <a class="collapse-item" href="${pageContext.request.contextPath }/stock/product/productView.do">완제품 재고관리</a>
                <a class="collapse-item" href="${pageContext.request.contextPath }/stock/storage/storageView.do">창고별 재고관리</a>
              </div>
            </div>
          </li>

          <li class="nav-item">
              <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSix" aria-expanded="true" aria-controls="collapseSix">
                <i class="fas fa-fw fa-cog"></i>
                <span>품질관리</span>
              </a>
              <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                  <h6 class="collapse-header">DETAIL</h6>
                  <a class="collapse-item" href="${pageContext.request.contextPath }/quality/doughnutHistoGraph.do">부적합 현황</a>
                  <a class="collapse-item" href="${pageContext.request.contextPath }/quality/xbarGraphByProduct.do">제품별 Xbar 그래프</a>
                  <a class="collapse-item" href="cards.html">P 관리도</a>
                  <a class="collapse-item" href="${pageContext.request.contextPath }/quality/qualityInsection.do">품질 검사 관리</a>
                  <a class="collapse-item" href="${pageContext.request.contextPath }/quality/qualityControll.do">부적합 관리</a>
                </div>
              </div>
            </li>
           <c:if test='${memberLoggedIn.email eq "admin@admin.com"}'>
          <li class="nav-item">
              <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="true" aria-controls="collapseSeven">
                <i class="fas fa-fw fa-cog"></i>
                <span>관리자페이지</span>
              </a>
              <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                  <h6 class="collapse-header">DETAIL</h6>
                  <a class="collapse-item" href="${pageContext.request.contextPath}/member/memberEnroll.do">신입사원등록</a>
                  <a class="collapse-item" href="cards.html">Xbar-R</a>
                  <a class="collapse-item" href="cards.html">P 관리도</a>
                </div>
              </div>
            </li>
            </c:if>

          <!-- Divider -->
          <hr class="sidebar-divider">

          <!-- Heading -->
          <div class="sidebar-heading">
            Addons
          </div>

          <!-- Nav Item - Pages Collapse Menu -->
          <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
              <i class="fas fa-fw fa-folder"></i>
              <span>Pages</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
              <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Login Screens:</h6>
                <a class="collapse-item" href="login.html">Login</a>
                <a class="collapse-item" href="register.html">Register</a>
                <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                <div class="collapse-divider"></div>
                <h6 class="collapse-header">Other Pages:</h6>
                <a class="collapse-item" href="404.html">404 Page</a>
                <a class="collapse-item" href="blank.html">Blank Page</a>
              </div>
            </div>
          </li>

          <!-- Nav Item - Charts -->
          <li class="nav-item">
            <a class="nav-link" href="charts.html">
              <i class="fas fa-fw fa-chart-area"></i>
              <span>Charts</span></a>
          </li>

          <!-- Nav Item - Tables -->
          <li class="nav-item">
            <a class="nav-link" href="tables.html">
              <i class="fas fa-fw fa-table"></i>
              <span>Tables</span></a>
          </li>

          <!-- Divider -->
          <hr class="sidebar-divider d-none d-md-block">

          <!-- Sidebar Toggler (Sidebar) -->
          <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
          </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

          <!-- Main Content -->
          <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

              <!-- Sidebar Toggle (Topbar) -->
              <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
              </button>

              <!-- Topbar Search -->
              <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                <div class="input-group">
                  <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                  <div class="input-group-append">
                    <button class="btn btn-primary" type="button">
                      <i class="fas fa-search fa-sm"></i>
                    </button>
                  </div>
                </div>
              </form>

              <!-- Topbar Navbar -->
              <ul class="navbar-nav ml-auto">

                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                <li class="nav-item dropdown no-arrow d-sm-none">
                  <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-search fa-fw"></i>
                  </a>
                  <!-- Dropdown - Messages -->
                  <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                    <form class="form-inline mr-auto w-100 navbar-search">
                      <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                          <button class="btn btn-primary" type="button">
                            <i class="fas fa-search fa-sm"></i>
                          </button>
                        </div>
                      </div>
                    </form>
                  </div>
                </li>

                <!-- Nav Item - Alerts -->
                <li class="nav-item dropdown no-arrow mx-1">
                  <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-bell fa-fw"></i>
                    <!-- Counter - Alerts -->
                    <span class="badge badge-danger badge-counter">3+</span>
                  </a>
                  <!-- Dropdown - Alerts -->
                  <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                    <h6 class="dropdown-header">
                      Alerts Center
                    </h6>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                      <div class="mr-3">
                        <div class="icon-circle bg-primary">
                          <i class="fas fa-file-alt text-white"></i>
                        </div>
                      </div>
                      <div>
                        <div class="small text-gray-500">December 12, 2019</div>
                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                      </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                      <div class="mr-3">
                        <div class="icon-circle bg-success">
                          <i class="fas fa-donate text-white"></i>
                        </div>
                      </div>
                      <div>
                        <div class="small text-gray-500">December 7, 2019</div>
                        $290.29 has been deposited into your account!
                      </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                      <div class="mr-3">
                        <div class="icon-circle bg-warning">
                          <i class="fas fa-exclamation-triangle text-white"></i>
                        </div>
                      </div>
                      <div>
                        <div class="small text-gray-500">December 2, 2019</div>
                        Spending Alert: We've noticed unusually high spending for your account.
                      </div>
                    </a>
                    <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                  </div>
                </li>

                <!-- Nav Item - Messages -->
                <li class="nav-item dropdown no-arrow mx-1">
                  <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-envelope fa-fw"></i>
                    <!-- Counter - Messages -->
                    <span class="badge badge-danger badge-counter">7</span>
                  </a>
                  <!-- Dropdown - Messages -->
                  <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                    <h6 class="dropdown-header">
                      Message Center
                    </h6>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                      <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                        <div class="status-indicator bg-success"></div>
                      </div>
                      <div class="font-weight-bold">
                        <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                      </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                      <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                        <div class="status-indicator"></div>
                      </div>
                      <div>
                        <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                        <div class="small text-gray-500">Jae Chun · 1d</div>
                      </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                      <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                        <div class="status-indicator bg-warning"></div>
                      </div>
                      <div>
                        <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                      </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                      <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                        <div class="status-indicator bg-success"></div>
                      </div>
                      <div>
                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                      </div>
                    </a>
                    <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                  </div>
                </li>

                  <!-- Nav Item - Messenger -->
                  <li class="nav-item dropdown no-arrow mx-1">
                      <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-comment"></i>
                        <!-- Counter - Messages -->
                        <span class="badge badge-danger badge-counter">7</span>
                      </a>
                      <!-- Dropdown - Messages -->
                      <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                        <h6 class="dropdown-header">
                          Messenger Center
                        </h6>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                          <div class="dropdown-list-image mr-3">
                            <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                            <div class="status-indicator bg-success"></div>
                          </div>
                          <div class="font-weight-bold">
                            <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                            <div class="small text-gray-500">Emily Fowler · 58m</div>
                          </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                          <div class="dropdown-list-image mr-3">
                            <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                            <div class="status-indicator"></div>
                          </div>
                          <div>
                            <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                            <div class="small text-gray-500">Jae Chun · 1d</div>
                          </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                          <div class="dropdown-list-image mr-3">
                            <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                            <div class="status-indicator bg-warning"></div>
                          </div>
                          <div>
                            <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                            <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                          </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                          <div class="dropdown-list-image mr-3">
                            <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                            <div class="status-indicator bg-success"></div>
                          </div>
                          <div>
                            <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                            <div class="small text-gray-500">Chicken the Dog · 2w</div>
                          </div>
                        </a>
                        <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                      </div>
                    </li>
                
                <div class="topbar-divider d-none d-sm-block"></div>

                <!-- Nav Item - User Information -->
                <li class="nav-item dropdown no-arrow mypage">
                  <a class="nav-link dropdown-toggle mypage" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${memberLoggedIn.empName}</span>
                    <img class="img-profile rounded-circle" src="${pageContext.request.contextPath }/resources/images/account_circle_black.png">
                  </a>
                  <!-- Dropdown - User Information -->
                  <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in mypage" aria-labelledby="userDropdown">
                 	<div class="mypage_head">
                 		<form action="<%=request.getContextPath()%>/member/memberProfile.do" id="profileImgSubmit" method="POST" enctype="multipart/form-data">
	                 		<input type="file" id="profileImage" name="uploadFile" onchange="changeValue(this)"/>
	                 		<input type="hidden" id="email" name="email" value="${memberLoggedIn.email }"/>
	                 		<img src="${pageContext.request.contextPath}/resources/upload/member/${memberLoggedIn.profileImage}"  class="mypage_image" />
                 		</form>
                 		<span class="mypage_alterpassword" onclick="mypage_alterpassword();">
                 			<img src="${pageContext.request.contextPath}/resources/images/lock.png" class="mypage_lock" />
                 			비밀번호 변경
                 		</span>
                 	</div>
                 	<div class="mypage_blank"></div>
                    <span class="dropdown-item empNameBold" onclick="mypage_updateName();">
                    	${memberLoggedIn.empName}
                    </span>
                    <span class="dropdown-item"onclick="mypage_updateName();" >
                    	${dept_title.DEPT_TITLE}  /  ${job_name.JOB_NAME}
                    </span>
                    <span class="dropdown-item" onclick="mypage_updateName();">
                    	<img src="${pageContext.request.contextPath}/resources/images/phone.png" class="mypage_phoneimg" />
                    	${memberLoggedIn.phone}   
                    	<i class="fas fa-envelope fa-fw"></i>
                    	${memberLoggedIn.email }
                    </span>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item mypageLogout" href="${pageContext.request.contextPath}/member/memberLogOut.do">
                      <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                      Logout
                    </a>
                  </div>
                </li>

              </ul>

            </nav>
            <!-- End of Topbar -->
            <style>
            .mypage_head{
            background-color:steelblue; width:400px; height:100px;
            }
            .dropdown-menu{
            padding:0;
            }
            .mypage_head .mypage_image{
            width:90px; height:90px; position:absolute; top:13%; left:40%; box-shadow:0px 1px 3px 2px #ccc;
            cursor:pointer;
            }
            .mypage_phoneimg{
            width:25px; height:25px;
            }
            .mypage_alterpassword{
            color:white; position:absolute; top:30%; right:1%; cursor:pointer;
            }
            .mypage_alterpassword .mypage_lock{
            width:30px; height:30px; position:absolute; top:-29%; left:-32%;
            }
            .mypage_blank{
            height:31px;
            }
            .dropdown-item{
          	text-align:center;
          	cursor:pointer;
            }
            .empNameBold{
            font-weight:bold;
            }
            .mypageLogout{
            text-align:left;
            }
            #profileImage{
            display:none;
            }
            </style>
            
             <!-- 비밀번호변경 Modal -->
			<div class="modal" tabindex="-1" role="dialog" id="updatePassword">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			        <div class="modal-header">
			            <h5 class="modal-title controll-title-updatePassword">비밀번호 변경</h5>
			            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			            <span aria-hidden="true">&times;</span>
			            </button>
			        </div>
			        <div class="modal-body controll-modal-body-updatePassword">
			            <!-- <p>Modal body text goes here.</p> -->
			        </div>
			        
			        </div>
			    </div>
			</div>
			
             <!-- 이름변경 Modal -->
			<div class="modal" tabindex="-1" role="dialog" id=updateInfo>
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			        <div class="modal-header">
			            <h5 class="modal-title controll-title-updateInfo">내정보 변경</h5>
			            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			            <span aria-hidden="true">&times;</span>
			            </button>
			        </div>
			        <div class="modal-body controll-modal-body-updateInfo">
			            <!-- <p>Modal body text goes here.</p> -->
			        </div>
			        
			        </div>
			    </div>
			</div>
			
			<script>
			$(function(){
				$(".mypage_image").click(function (e){
					$("#profileImage").click();
				});
			});
			
			function changeValue(obj){
					$("#profileImgSubmit").submit();
					alert("프로필사진이 수정되었습니다");
	    	       	$("li.nav-item.dropdown.no-arrow.mypage").addClass("show");
	    	       	$("a#userDropdown.nav-link.dropdown-toggle.mypage").attr("aria-expanded","true");
	    	       	$("div.dropdown-menu.dropdown-menu-right.shadow.animated--grow-in.mypage").addClass("show");

	         };

			function mypage_alterpassword(){
			    $('.controll-modal-body-updatePassword').load("${pageContext.request.contextPath}/member/memberAlterPassword.do",function(){
			        $('#updatePassword').modal({backdrop: 'static', keyboard: false});
			        $('#updatePassword').modal({show:true});
			        $(".modal-backdrop.in").css('opacity', 0.4);
			        
			    });
					$("#updatePassword").modal();			        
			};
			function mypage_updateName(){
			    $('.controll-modal-body-updateInfo').load("${pageContext.request.contextPath}/member/memberUpdateInfo.do",function(){
			        $('#updateInfo').modal({backdrop: 'static', keyboard: false});
			        $('#updateInfo').modal({show:true});
			        $(".modal-backdrop.in").css('opacity', 0.4);
			        
			    });
					$("#updateInfo").modal();			        
			};
			  </script>
  

            <!-- 페이지 내용(Begin Page Content) -->
            <div class="container-fluid">
            
