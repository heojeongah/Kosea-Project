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
                    <h4 class="title">�ı�Խ���</h4>
                    <p class="category"></p>
                </div>
                <div class="card-content table-responsive">
                    <table class="table">
                        <thead class="text-primary">
                        <tr>
                        	<th>�Խñ۹�ȣ</th>
                        	<th >�̹���</th>
                        	<th>����</th>
                            <th>��ǰ��</th>
                            <th>������</th>
                            <th>�ۼ���</th>
                            <th>��ID</th>
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
 <!--����¡ ����  -->
<c:set var="startPage" value="${currentPage-
	(currentPage % 10==0? 10:(currentPage % 10) )+1}"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
<c:set var="endPage" value="${pageCount }"/>
</c:if>
<div align="center">

                      <nav aria-label="Page navigation example">
						  <ul class="pagination">
 							<!-- prev ��ư ����  -->
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
							
 							<!-- ������ ��ư ����  -->
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
							
 							<!-- next ��ư ����  -->
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
 <!--����¡ ���� -->
       </div>
   </div>
  </div>
</div>