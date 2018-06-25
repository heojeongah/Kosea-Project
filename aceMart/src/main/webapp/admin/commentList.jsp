<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://cdn.rawgit.com/atatanasov/gijgo/master/dist/combined/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://cdn.rawgit.com/atatanasov/gijgo/master/dist/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header" data-background-color="purple">
                    <h4 class="title">후기게시판</h4>
                    <p class="category"></p>
                </div>
                <div class="card-content table-responsive">
                    <table class="table">
                        <thead class="text-primary">
                        <tr>
                        	<th>게시글번호</th>
                        	<th >이미지</th>
                        	<th>제목</th>
                            <th>상품명</th>
                            <th>만족도</th>
                            <th>작성일</th>
                            <th>고객ID</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                         <c:forEach var="comment" items="${COMMENT_LIST }">
                       <tr>
                       		<td class="text-primary">
                       		${comment.comment_id}</td>
                       		<td width="100" height="100"><img src="${pageContext.request.contextPath}/upload/${comment.c_image}"
							width="5" height="5"/></td>
							 <td><a href="../read/readDetail.html?COMMENT_ID=${comment.comment_id }">${comment.title}</a></td>
                            <td>${comment.p_name}</td>
                            <td>${comment.w_grade}%</td>
                           <td>${comment.w_date}</td>
                           <td>${comment.c_id}</td>
                       </tr>
                       </c:forEach>
                   </tbody>
               </table>
           </div>
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
							      <a class="page-link" href="../read/readComment.html?pageNo=${startPage-10}">Prev</a>
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
							 			<a class="page-link" href="../read/readComment.html?pageNo=${pageNo }">${pageNo }</a>
							 		</li>
								</c:when>	
								<c:otherwise>
								 	<li class="page-item">
							 			<a class="page-link" href="../read/readComment.html?pageNo=${pageNo }">${pageNo }</a>
							 		</li>
								</c:otherwise>
								</c:choose>
							</c:forEach>
							
 							<!-- next 버튼 구현  -->
							<c:choose>
								<c:when test="${endPage < pageCount }"> 
								<li class="page-item">
							      <a class="page-link" href="../read/readComment.html?pageNo=${startPage+10}">next</a>
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