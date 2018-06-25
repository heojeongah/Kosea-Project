<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"
   uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt"
   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- Slide1 -->


	<section class="slide1">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1 item1-slick1" style="background-image: url(../images/banner01.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 m-text1 t-center animated visible-false m-b-15" data-appear="fadeInDown">
							ACE Collection 2018
						</span>

						<h2 class="caption2-slide1 xl-text1 t-center animated visible-false m-b-37" data-appear="fadeInUp">
							New arrivals
						</h2>

						<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="zoomIn">
							<!-- Button -->
							<a href="../product/read.html?type=run" class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4">
								Shop Now
							</a>
						</div>
					</div>
				</div>

				<div class="item-slick1 item2-slick1" style="background-image: url(../images/banner02.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<div class="wrap-btn-slide1 w-size1 animated visible-false" data-appear="zoomIn">
							<!-- Button -->
							<a href="../product/read.html?type=sandal" class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4">
								Shop Now
							</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- New Product -->
	<section class="newproduct bgwhite p-t-45 p-b-105">
		<div class="container">
			<div class="sec-title p-b-60">
				<h3 class="m-text5 t-center">
				NEW ARRIVALS
				</h3>
			</div>

<c:if test="${LIST == null }">
게시글이 없습니다.
</c:if>
<c:if test="${LIST != null }">

<!-- PRODUCTS -->

<c:set var="count" value="0"/>
<c:forEach var="product" items="${LIST }">
<c:if test="${count%4==0 }">
			<div class="row">
</c:if>
				<div class="col-md-3 p-b-30 m-l-r-auto">
					<!-- Block3 -->
					<div class="block3">
						<a href="../product/readDetail.html?code=${product.p_code}" class="block3-img dis-block hov-img-zoom">
							<img src="../upload/${product.p_image1}" alt="IMG-BLOG">
						<div class="block3-txt p-t-20">
							<h6 class="p-b-15 t-center">
									${product.p_name}
							</h6>
							<h6 class="p-b-15 t-center">
									${product.p_price}
							</h6>
						</div>
						</a>
					</div>
				</div>
 
   <c:set var="count" value="${count +1 }"/>
<c:if test="${count%4==0 }">
		</div>
</c:if>

</c:forEach>
</c:if>

	</div>
	</section>
	<script type="text/javascript" src="../vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="../js/slick-custom.js"></script>
	
<script type="text/javascript">

function goView(code){
	alert("goPage");
   document.move.code.value = code;
   document.move.action="/product/readDetail.html";
   document.move.submit();
}
function goPage(pageNo){
	alert("goPage");
   document.move.action="/product/productTemplate.html";
   document.move.page.value=pageNo;
   document.move.submit();
}
</script>
<form name="move" method="post">
   <input type="hidden" name="p_code"/>
   <input type="hidden" name="page">
</form>
</body>
</html>