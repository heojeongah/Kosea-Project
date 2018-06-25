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

	<!-- New Product -->
	<section class="newproduct bgwhite p-t-45 p-b-105">
		<div class="container">
			<div class="sec-title p-b-60">
				<h3 class="m-text5 t-center">
				'${sp}'로 검색한 결과입니다.
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
						<div class="block3-txt p-t-14">
							<h5 class="p-b-5 t-center">
									${product.p_name}
							</h5>
							<h5 class="p-b-7 t-center">
									${product.p_price}
							</h5>
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
	
	<div class="col-md-6 m-l-r-auto">
	<div class="pagination flex-m flex-w p-r-50">
<c:set var="startPage" 
	value="${currentPage-
	(currentPage % 10==0? 10:(currentPage % 10) )+1}"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
<c:set var="endPage" value="${pageCount }"/>
</c:if>

<c:forEach var="pageNo" begin="${startPage }"	
		end="${endPage }">
	<c:choose>
	<c:when test="${currentPage == pageNo }">
		<a href="../product/productSearch.html?pageNo=${pageNo}&sp=${sp}" class="item-pagination flex-c-m trans-0-4 active-pagination">${pageNo }</a>
	</c:when>	
	<c:otherwise>
		<a href="../product/productSearch.html?pageNo=${pageNo}&sp=${sp}" class="item-pagination flex-c-m trans-0-4">
		${pageNo }</a>
	</c:otherwise>
	</c:choose>
</c:forEach>
</div>
</div>
	</section>

<form name="move" method="post">
   <input type="hidden" name="p_code"/>
   <input type="hidden" name="page">
</form>
</body>
</html>