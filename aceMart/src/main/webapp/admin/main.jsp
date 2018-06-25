<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>
<head>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>ACE Mart</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Bootstrap core CSS     -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
<!--  Material Dashboard CSS    -->
<link href="../assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="../assets/css/demo.css" rel="stylesheet" />
<!--     Fonts and icons     -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons" rel='stylesheet'>
<!--   Core JS Files   -->
<script src="../assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="../assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="../assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="../assets/js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../assets/js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="../assets/js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>

</head>
<body>
    <div class="wrapper">
        <div class="sidebar" data-color="purple" data-image="../assets/img/sidebar-1.jpg">
    <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
        Tip 2: you can also add an image using data-image tag
    -->
            <div class="logo">
                <a href="../admin/main.html" class="simple-text logo-normal">
                    <img src="../upload/logo2.JPG" alt="IMG-LOGO" height="150">
                </a>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
                <!-- 여기서부터 드롭다운 메뉴 -->
<!--                  <li> -->
<!--                         <a data-toggle="collapse" href="#pagesExamples"> -->
<!--                             <p>드롭다운 메뉴 -->
<!--                                 <b class="caret"></b> -->
<!--                             </p> -->
<!--                         </a> -->
<!--                         <div class="collapse" id="pagesExamples"> -->
<!--                             <ul class="nav"> -->
<!--                                 <li> -->
<!--                                     <a href="pages/pricing.html">메뉴아이템1</a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a href="pages/timeline.html">메뉴아이템2</a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </li> -->
                <!-- 여기까지 -->
                    <li>
                        <a href="../admin/main.html">
                            <p>홈 화면</p>
                        </a>
                    </li>
                    <li>
                        <a href="../product/read.html">
                            <p>상품관리</p>
                        </a>
                    </li>
                     <li>
                        <a data-toggle="collapse" href="#pagesExamples">
                            <p>판매관리
                                <b class="caret"></b>
                            </p>
                        </a>
                        <div class="collapse" id="pagesExamples">
                            <ul class="nav">
                                <li>
                                    <a href="../read/readSales.html">일별판매관리</a>
                                </li>
                                <li>
                                    <a href="../read/readMonthly.html">월별판매관리</a>
                                </li>
                                <li>
                                    <a href="../read/readSalesRange.html">기간별판매관리</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="../read/readOrder.html">
                            <p>주문관리</p>
                        </a>
                    </li>
                    <li>
                        <a href="../read/readDelivery.html">
                            <p>배송관리</p>
                        </a>
                    </li>
                    <li>
                        <a href="../customer/read.html">
                            <p>고객관리</p>
                        </a>
                    </li>
					<li>
                        <a data-toggle="collapse" href="#bbs">
                            <p>게시글 관리
                                <b class="caret"></b>
                            </p>
                        </a>
                        <div class="collapse" id="bbs">
                            <ul class="nav">
                                <li>
                                    <a href="../qna/read.html">답변게시판</a>
                                </li>
                                <li>
                                    <a href="../read/readComment.html">후기게시판</a>
                                </li>
							</ul>
                         </div>
                      </li>       
                </ul>
             
            </div>
        </div>
        <div class="main-panel">
            <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
<!--                         <a class="navbar-brand" href="#"> ACE MART </a> -->
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
							<a href="../j_spring_security_logout">
                             <img src="../assets/img/logout-rounded-filled.png" width="30">
								</a>
                             </li>
                             
                        </ul>
<!--         				 <form class="navbar-form navbar-right" role="search"> -->
<!--                             <div class="form-group  is-empty"> -->
<!--                                 <input type="text" class="form-control" placeholder="Search"> -->
<!--                                 <span class="material-input"></span> -->
<!--                             </div> -->
<!--                             <button type="submit" class="btn btn-white btn-round btn-just-icon"> -->
<!--                                 <i class="material-icons">search</i> -->
<!--                                 <div class="ripple-container"></div> -->
<!--                             </button> -->
<!--                         </form> -->
                    </div>
                </div>
            </nav>
            <div class="content">
	 		<c:choose>
				<c:when test="${BODY != null }">
				<jsp:include page="${BODY }"/>
				</c:when>
			</c:choose>
		</div>
            <footer class="footer">
                <div class="container-fluid">
                    <p class="copyright pull-right">
						Copyright ⓒ 2018 All Rights Reserved
                    </p>
                </div>
            </footer>
        </div>
    </div>
    
<script type="text/javascript">
    $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();
    });
	$(function(){
		$('.nav a').filter(function(){return this.href==location.href}).parent().addClass('active').siblings().removeClass('active')
		$('.nav a').click(function(){
			$(this).parent().addClass('active').siblings().removeClass('active')	
		})
	})
	
$('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();
</script>
</body>


</html>