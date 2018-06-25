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
<div class="container-fluid">
      <div class="row">
          <div class="col-md-12">
              <div class="card">
                  <div class="card-header" data-background-color="purple">
                      <h4 class="title">Q&A 게시판</h4>
                      <p class="category"></p>
                  </div>
                  <div class="card-content table-responsive">
          <div class="col-md-12">
                      <table class="table table-hover">
                          <thead class="text-primary">
							<tr>
								<th>답변상태</th><th>글제목</th><th>작성자ID</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
<c:if test="${ !empty LIST }">
<c:forEach var="writing" items="${LIST }">

<tr>
	<td>${writing.w_state }</td>
	<td>
	${writing.title }</td>
	<td>${writing.c_id }</td>
	<td>${writing.w_date }</td>
</tr>
<tr>
	<td colspan="4">
	<textarea rows="5" cols="70" readonly="readonly">${writing.content }</textarea>
	</td>
</tr>
<tr>
	<td colspan="4">
	<a class="btn btn-primary pull-right" href="../qna/qnaReplyForm.html?qna_id=${writing.qna_id }">답변</a>
	</td>
</tr>
</c:forEach>
</c:if>
</tbody>
</table>
 <!--페이징 시작  -->
<c:set var="startPage" value="${currentPage-
	(currentPage % 10==0? 10:(currentPage % 10) )+1}"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
<c:set var="endPage" value="${pageCount }"/>
</c:if>
<div align="center">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
		<!-- prev 버튼 구현  -->
		<c:choose>
		<c:when test="${startPage > 10 }">
		   <li class="page-item">
		     <a class="page-link" href="../qna/read.html?pageNo=${startPage-10}">Prev</a>
		   </li>
		</c:when>
		<c:otherwise>
		   <li class="page-item disabled">
		     <a class="page-link" href="#" tabindex="-1">Prev</a>
		   </li>
		</c:otherwise>
		</c:choose>
		
		<!-- 페이지 버튼 구현  -->
		<c:forEach var="pageNo" begin="${startPage }" end="${endPage }">
		<c:choose>
		<c:when test="${currentPage == pageNo }">
				<li class="page-item active">
					<a class="page-link" href="../qna/read.html?pageNo=${pageNo }">${pageNo }</a>
				</li>
		</c:when>	
		<c:otherwise>
		 	<li class="page-item">
					<a class="page-link" href="../qna/read.html?pageNo=${pageNo }">${pageNo }</a>
				</li>
		</c:otherwise>
		</c:choose>
		</c:forEach>
		
		<!-- next 버튼 구현  -->
		<c:choose>
		<c:when test="${endPage < pageCount }"> 
		<li class="page-item">
		     <a class="page-link" href="../product/read.html?pageNo=${startPage+10}">next</a>
		   </li>
		</c:when>
		<c:otherwise>
		   <li class="page-item disabled">
		     <a class="page-link" href="#" tabindex="-1">next</a>
		   </li>
		</c:otherwise>
		</c:choose>
		</ul>
	</nav>
</div>	
 <!--페이징 종료 -->
 </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
<script type="text/javascript">
function goView(qna_id){
	if(writingid == null){
		qna_id("글 번호가 없습니다.");
	}else{
		document.move.id.value = writingid;
		document.move.action="../read/readImage.html";
		document.move.submit();
	}
}
</script>
</body>
</html>










