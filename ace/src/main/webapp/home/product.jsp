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
		
<c:if test="${LIST == null }">
게시글이 없습니다.
</c:if>
<c:if test="${LIST != null }">
		
			<div class="sec-title p-b-60">
				<h3 class="m-text5 t-center">
				<c:if test="${cate=='run'}">▶▷ 운동화 ◁◀</c:if>
				<c:if test="${cate=='kudo'}">▶▷ 구두 ◁◀</c:if>
				<c:if test="${cate=='sports'}">▶▷ 스포츠/레저 ◁◀</c:if>
				<c:if test="${cate=='sandal'}">▶▷ 샌들 ◁◀</c:if>
				
				</h3>
			</div>

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
		<a href="../product/read.html?pageNo=${pageNo}&type=${cate}" class="item-pagination flex-c-m trans-0-4 active-pagination m-l-r-auto">${pageNo }</a>
	</c:when>	
	<c:otherwise>
		<a href="../product/read.html?pageNo=${pageNo}&type=${cate}" class="item-pagination flex-c-m trans-0-4">
		${pageNo }</a>
	</c:otherwise>
	</c:choose>
</c:forEach>
</div>
</div>
</c:if>
	</div>
	</section>
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