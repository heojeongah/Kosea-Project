<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
                    <h4 class="title">기간별 매출</h4>
                </div>
                <div class="card-content table-responsive">
                    <div class="row">
					<div class="col-md-4">
						<form action="searchRange.html" method="post">
								<div class="container-fluid">
									<div class="input-daterange input-group" id="datepicker">
										<input type="text" class="input-sm form-control"
											name="startDate" placeholder="캘린더 보기"/> <span class="input-group-addon">to</span>
										<input type="text" class="input-sm form-control"
											name="endDate" placeholder="캘린더 보기"/> <span class="input-group-addon">
											<button type="submit"
												class="btn btn-white btn-round btn-just-icon">
												<i class="material-icons">search</i>
												<div class="ripple-container"></div>
											</button>
										</span>
									</div>
								</div>
						</form>
						</div>
						<table class="table">
                        <thead class="text-primary">
                        	<th>판매일자</th>
                            <th>상품코드</th>
                            <th>상품명</th>
                            <th>수량</th>
                            <th>총액</th>
                        </thead>
                        <tbody>
                         <c:forEach var="sales" items="${SALES_LIST }">
                       <tr>
                       		<td class="text-primary">${sales.s_date}</td>
                           <td>${sales.p_code}</td>
                           <td>${sales.p_name}</td>
                           <td>${sales.s_amount}</td>
                           <td class="text-primary">${sales.s_total}</td>
                       </tr>
                       </c:forEach>
                   </tbody>
               </table>
           </div>
            <div align="center">
         		  총 액    :    <input id="s_sum" type="text" value="${s_sum }"/>
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
							      <a class="page-link" href="../product/read.html?pageNo=${startPage-10}">Prev</a>
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
							 			<a class="page-link" href="../read/readSalesRange.html?pageNo=${pageNo }">${pageNo }</a>
							 		</li>
								</c:when>	
								<c:otherwise>
								 	<li class="page-item">
							 			<a class="page-link" href="../read/readSalesRange.html?pageNo=${pageNo }">${pageNo }</a>
							 		</li>
								</c:otherwise>
								</c:choose>
							</c:forEach>
							
 							<!-- next 버튼 구현  -->
							<c:choose>
								<c:when test="${endPage < pageCount }"> 
								<li class="page-item">
							      <a class="page-link" href="../read/readSalesRange.html?pageNo=${startPage+10}">next</a>
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