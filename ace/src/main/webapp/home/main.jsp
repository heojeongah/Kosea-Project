<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="../images/icons/favicon.png"/>
	<link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="../vendor/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="../vendor/lightbox2/css/lightbox.min.css">
	<link rel="stylesheet" type="text/css" href="../css/util.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
</head>
<body class="animsition">


<!--===============================================================================================-->
	<script type="text/javascript" src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="../vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="../vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="../vendor/select2/select2.min.js"></script>

<!--===============================================================================================-->
	<script type="text/javascript" src="../vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="../js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="../vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="../vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="../vendor/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
// 		$('.block2-btn-addcart').each(function(){
// 			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
// 			$(this).on('click', function(){
// 				swal(nameProduct, "is added to cart !", "success");
// 			});
// 		});

	</script>

<!--===============================================================================================-->

	<!-- Header -->
	<header class="header1">
		<!-- Header desktop -->
		<div class="container-menu-header">
			<div class="topbar">

				<div class="topbar-child2">
				<c:choose>
					<c:when test="${AGAIN != null }" >
						<jsp:include page="${AGAIN }" />
					</c:when>
					<c:when test="${sessionScope.loginUser == null }">
						<a href="../login/login.html">로그인</a>&nbsp;|&nbsp;
						<a href="../home/intro.html?BODY=tems.jsp">회원가입</a>
					</c:when>
					<c:otherwise>
						환영합니다.<a href="../home/check.html"> ${sessionScope.loginUser }</a> 님~&nbsp;|&nbsp;
						<a href="../logout/template.html">로그아웃</a>
					</c:otherwise>
				</c:choose>
				</div>

			</div>

			<div class="wrap_header">
				<!-- Logo -->
				<a href="../home/main.html" class="logo">
					<img src="../images/icons/logo2.png" alt="IMG-LOGO">
				</a>

				<!-- Menu -->
				<div class="wrap_menu">
					<nav class="menu">
						<ul class="main_menu">
							<li class="sale-noti">
								<a href="../home/main.html">Home</a>
							</li>
							<li>
								<a href="../product/read.html?type=run">운동화</a>
							</li>
							<li>
								<a href="../product/read.html?type=sports">스포츠.레저</a>
							</li>
							<li>
								<a href="../product/read.html?type=kudo">구두</a>
							</li>
							<li>
								<a href="../product/read.html?type=sandal">샌들</a>
							</li>
							<li>
							<form action="../product/productSearch.html">
							<div class="search-product pos-relative bo4 of-hidden">
							<input class="s-text7 size6 p-l-23 p-r-50" type="text" name="sp"  placeholder="상품을 검색해보세요.">
							<button type="submit" class="flex-c-m size5 ab-r-m color2 color0-hov trans-0-4">
								<i class="fs-12 fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
						</form>
							
							</li>
						</ul>
					</nav>
				</div>

				<!-- Header Icon -->
				<div class="header-icons">
				<c:choose>
					<c:when test="${AGAIN != null }" >
						<jsp:include page="${AGAIN }" />
					</c:when>
					<c:when test="${sessionScope.loginUser == null }">
						<a href="../login/login.html" class="header-wrapicon1 dis-block">
							<img src="../images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
						</a>
					</c:when>
					<c:otherwise>
						<a href="../home/check.html" class="header-wrapicon1 dis-block">
							<img src="../images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
						</a>
					</c:otherwise>
				</c:choose>
					<span class="linedivide1"></span>


						<a href="../cart/show.html" class="header-wrapicon1 dis-block">
							<img src="../images/icons/icon-header-02.png" class="header-icon1" alt="ICON">
						</a>
					<span class="linedivide1"></span>
						<a href="../qna/read.html" class="header-wrapicon1 dis-block">
							<img src="../images/icons/icon_qna.png" class="header-icon1" alt="ICON" style="opacity: 0.5">
						</a>


				</div>
			</div>
		</div>
	</header>

   	<div class="content">
   	<c:choose>
   	<c:when test="${BODY != null }">
		<jsp:include page="${BODY }"/>
	</c:when>
   	</c:choose>
	</div>
		
	<!-- Footer -->
	<footer class="bg6 p-t-45 p-b-43 p-l-45 p-r-45">
		<div class="t-center p-l-15 p-r-15">
			<a href="#">
				<img class="h-size2" src="../images/icons/paypal.png" alt="IMG-PAYPAL">
			</a>

			<a href="#">
				<img class="h-size2" src="../images/icons/visa.png" alt="IMG-VISA">
			</a>

			<a href="#">
				<img class="h-size2" src="../images/icons/mastercard.png" alt="IMG-MASTERCARD">
			</a>

			<a href="#">
				<img class="h-size2" src="../images/icons/express.png" alt="IMG-EXPRESS">
			</a>

			<a href="#">
				<img class="h-size2" src="../images/icons/discover.png" alt="IMG-DISCOVER">
			</a>


			<div class="t-center s-text8 p-t-20">
				Copyright ⓒ 2018 All Rights Reserved
			</div>
		</div>
	</footer>



	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection1 -->
	<div id="dropDownSelect1"></div>


	<script src="../js/main.js"></script>
</body>
</html>
