<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>

<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker3.css"/>

<script type="text/javascript">
$(document).ready(function () {
    $('#datepicker').datepicker({
       format: 'yyyy/mm/dd'
    });
});
</script>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header" data-background-color="purple">
                    <h4 class="title">주문관리</h4>
                </div>
                <div class="card-content table-responsive">
                 <div class="row">
				<div class="col-md-4">
				 <form action="searchOrder.html" method="post">
				<div class="input-daterange input-group" id="datepicker">
					 <input type="text" class="input-md form-control" name="startDate" />
				    <span class="input-group-addon">to</span>
				    <input type="text" class="input-md form-control" name="endDate" />
				    <span class="input-group-addon">
				    <button type="submit" class="btn btn-white btn-round btn-just-icon">
				       <i class="material-icons">search</i>
				       <div class="ripple-container"></div>
				    </button>
				    </span>
					</div>
				</form>
				</div>
				<div class="col-md-5"> 
				&nbsp;
				</div>
				<div class="col-md-3 "> 
					<a href="../read/searchWaiting.html" class="btn btn-primary" >미결제</a>
					<a href="../read/searchNewOrder.html" class="btn btn-primary" >신규주문</a>
				</div>
				</div>
                    <table class="table">
                        <thead class="text-primary">
                        <tr>
							<th>주문일</th>
							<th>주문코드</th>
							<th>주문상세코드</th>
							<th>상품코드</th>
							<th>상품명</th>
							<th>사이즈</th>
							<th>주문수량</th>
							<th>고객ID</th>
							<th>결제상태</th>
							<th></th>
						</tr>
                        </thead>
                        <tbody>
                         <c:forEach var="order" items="${ORDER_LIST }">
                       <tr>
                       		<td>${order.o_date}</td>
                            <td>${order.o_code}</td>
                            <td>${order.ol_code}</td>
                            <td>${order.p_code}</td>
                            <td>${order.p_name}</td>
                            <td>${order.p_size}</td>
                            <td>${order.o_amount}</td>
                            <td>${order.c_id}</td>
                            <td>${order.o_state}</td>
                            <td>
                            <c:if test="${order.o_state!='결제완료' }">
                            <a href="../read/updatePay.html?OCODE=${order.o_code}" class="btn btn-primary btn-sm" >결제완료</a>
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
							      <a class="page-link" href="../read/readOrder.html?pageNo=${startPage-10}">Prev</a>
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
							 			<a class="page-link" href="../read/readOrder.html?pageNo=${pageNo }">${pageNo }</a>
							 		</li>
								</c:when>	
								<c:otherwise>
								 	<li class="page-item">
							 			<a class="page-link" href="../read/readOrder.html?pageNo=${pageNo }">${pageNo }</a>
							 		</li>
								</c:otherwise>
								</c:choose>
							</c:forEach>
							
 							<!-- next 버튼 구현  -->
							<c:choose>
								<c:when test="${endPage < pageCount }"> 
								<li class="page-item">
							      <a class="page-link" href="../read/readOrder.html?pageNo=${startPage+10}">next</a>
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
<div>

</div>
