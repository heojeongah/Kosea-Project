<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<section class="cart bgwhite p-t-70 p-b-100">
		<div class="container">
			<!-- Cart item -->
			
			<div class="row">
				<div class="col-md-12 p-b-30 m-l-r-auto">

	<div align="right">
	<div class="w-size25">
	<!-- Button -->
		<a href="../qna/writeForm.html?qna_id=${qna.qna_id }&c_id=${qna.c_id }"
			class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
			Q/A올리기</a>
	</div>
	</div>
<div class="container-table-cart pos-relative">
		<div class="wrap-table-shopping-cart bgwhite">
			<table class="table-shopping-cart">
				<tr class="table-head">
					<th class="column-3 p-l-20">답변상태</th>
					<th class="column-2">글제목</th>
					<th class="column-3">작성일</th>
				</tr>
<c:if test="${ !empty BBS_LIST }">
	<c:forEach var="qna" items="${BBS_LIST }">
		<c:choose>
		<c:when test="${sessionScope.loginUser==qna.c_id }">
			<tr class="table-row">
				<td class="column-3  p-l-20" bgcolor="#FBFBEF">${qna.w_state }</td>
				<td class="column-2" bgcolor="#FBFBEF"><a href="../read/readDetail.html?qna_id=${qna.qna_id }&c_id=${qna.c_id }">${qna.title }</a></td>
				<td class="column-3"  bgcolor="#FBFBEF">${qna.w_date }</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr class="table-row">
				<td class="column-3  p-l-20">${qna.w_state }</td>
				<td class="column-2"><a href="../read/readDetail.html?qna_id=${qna.qna_id }&c_id=${qna.c_id }">${qna.title }</a></td>
				<td class="column-3">${qna.w_date }</td>
			</tr>
		</c:otherwise>
		</c:choose>
	</c:forEach>
</c:if>
			</table>
		</div>

		
	</div>

				
	<!-- Pagination -->	
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
		<a href="../qna/read.html?pageNo=${pageNo}" class="item-pagination flex-c-m trans-0-4 active-pagination">${pageNo }</a>
	</c:when>	
	<c:otherwise>
		<a href="../qna/read.html?pageNo=${pageNo}" class="item-pagination flex-c-m trans-0-4">
		${pageNo }</a>
	</c:otherwise>
	</c:choose>
</c:forEach>
</div>
<!-- 페이징 끝 -->
	</div>
		</div></div>
	</section>

	<div id="dropDownSelect2"></div>
<!-- <tr> -->
<!-- 	<td>글제목</td><td>작성자</td> -->
<!-- 	<td>작성일</td> -->
<!-- </tr> -->
<%-- <c:if test="${ !empty BBS_LIST }"> --%>
<%-- <c:forEach var="qna" items="${BBS_LIST }"> --%>
<!-- <tr> -->
<%-- 	<td><img src="${pageContext.request.contextPath}" --%>
<!-- 			width="50" height="50"/></td> -->
<%-- 	<td><a href="javascript:goView(${qna.qna_id })"> --%>
<%-- 	${qna.title }</a></td> --%>
<%-- 	<td>${qna.c_id }</td> --%>
<%-- 	<td>${qna.w_date }</td> --%>
<!-- </tr> -->
<%-- </c:forEach> --%>
<%-- </c:if> --%>

<!-- </table> -->

<script type="text/javascript">
function goView(qna_id){
	if(qna_id == null){
		alert("글 번호가 없습니다.");
	}else{
		document.move.qna_id.value = qna_id;
		document.move.action="../read/readDetail.html";
		document.move.submit();
	}
}
</script>
<form name="move" method="POST" >
	<input type="hidden" name="qna_id"/>
</form>
</body>
</html>










