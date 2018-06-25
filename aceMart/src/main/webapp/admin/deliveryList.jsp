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
                    <h4 class="title">배송관리</h4>
                    <p class="category"></p>
                </div>
                <div class="card-content table-responsive">
                   <div class="col-md-12" align="right">
	                    <form action="searchByState.html" method="post">
	                    <input type="radio" name="state" value="배송준비중"/>배송준비중 
	                    <input type="radio" name="state" value="배송중"/>배송중 
	                    <input type="radio" name="state" value="배송완료"/>배송완료 
	                    <input class="btn btn-primary btn-sm" type="submit" id="getState" value="검색">
	                    </form	>
					</div>                
                    <table class="table">
                        <thead class="text-primary">
                        <tr>
                        	<th>배송코드</th>
                            <th>상품명</th>
                            <th>수량</th>
                            <th>배송상태</th>
                            <th>배송시작일</th>
                            <th>배송완료일</th>
                            <th>고객ID</th>
                            <th></th>
                         </tr>
                        </thead>
                        <tbody>
                         <c:forEach var="delivery" items="${DELIVERY_LIST }">
                       <tr>
                       		<td class="text-primary">${delivery.d_number}</td>
                           <td><a href="../read/readDeliveryDetail.html?DNUMBER=${delivery.d_number}">${delivery.p_name}</a></td>
                           <td>${delivery.o_amount}</td>
                            <td>${delivery.d_state}</td>
                           <td>${delivery.d_sdate}</td>
                           <td>${delivery.d_edate}</td>
                           <td>${delivery.c_id}</td>
                           <td>
                           <c:if test="${delivery.d_state=='배송준비중' }"> 
                           <a href="../read/updateState.html?DNUMBER=${delivery.d_number}" class="btn btn-primary btn-sm" >배송시작</a>
                           </c:if>
                           </td>
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
							      <a class="page-link" href="../read/readDelivery.html?pageNo=${startPage-10}">Prev</a>
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
							 			<a class="page-link" href="../read/readDelivery.html?pageNo=${pageNo }">${pageNo }</a>
							 		</li>
								</c:when>	
								<c:otherwise>
								 	<li class="page-item">
							 			<a class="page-link" href="../read/readDelivery.html?pageNo=${pageNo }">${pageNo }</a>
							 		</li>
								</c:otherwise>
								</c:choose>
							</c:forEach>
							
 							<!-- next 버튼 구현  -->
							<c:choose>
								<c:when test="${endPage < pageCount }"> 
								<li class="page-item">
							      <a class="page-link" href="../read/readDelivery.html?pageNo=${startPage+10}">next</a>
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