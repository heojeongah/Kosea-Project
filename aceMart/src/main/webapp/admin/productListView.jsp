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
</head>
<body>

  <div class="container-fluid">
      <div class="row">
          <div class="col-md-12">
              <div class="card">
                  <div class="card-header" data-background-color="purple">
                      <h4 class="title">��ǰ ��� ��ȸ</h4>
                      <a class="pull-right" href="../product/productTemplate.html">��ǰ ���</a>
                      <p class="category"></p>
                  </div>
                  <div class="card-content table-responsive">
                      <table class="table table-hover">
                          <thead class="text-primary">
                          <tr>
                          	<th width="70">��ǰ�ڵ�</th>	
							<th width="200">��ǰ��</th>
							<th width="100">�з�</th>
							<th width="100">�귣��</th>
							<th width="100">����</th>
							<th width="120">&nbsp;</th>
                        </tr>
                          </thead>
                          <tbody>
							<c:forEach var="product" items="${PRODUCT_LIST }">
									<tr>
										<td align="center">${product.p_code }</td>
										<td><a href="../product/readDetail.html?PCODE=${product.p_code }">
										${product.p_name }</a>
										</td>
										<td>${product.p_type }</td>
										<td>${product.p_brand }</td>
										<td>
										<fmt:formatNumber value="${product.p_price }" pattern="#,###"/>��
										</td>
										<td><a href="#" onClick="">
										&nbsp;</a>
										</td>
									</tr>
								</c:forEach>
                          </tbody>
                      </table>
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
							      <a class="page-link" href="../product/read.html?pageNo=${startPage-10}">Prev</a>
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
							 			<a class="page-link" href="../product/read.html?pageNo=${pageNo }">${pageNo }</a>
							 		</li>
								</c:when>	
								<c:otherwise>
								 	<li class="page-item">
							 			<a class="page-link" href="../product/read.html?pageNo=${pageNo }">${pageNo }</a>
							 		</li>
								</c:otherwise>
								</c:choose>
							</c:forEach>
							
 							<!-- next ��ư ����  -->
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
 
  <div class="row">
 <form action="../product/read.html" method="post">
 <div class="form-check form-check-radio form-check-inline">
	  <label class="form-check-label">
	    <input class="form-check-input" type="radio" name="searchOption" value="code"> �ڵ�
	    <span class="circle">
	        <span class="check"></span>
	    </span>
	  </label>
	  <label class="form-check-label">
	    <input class="form-check-input" type="radio" name="searchOption" value="brand"> �귣��
	  </label>
	  <label class="form-check-label">
	    <input class="form-check-input" type="radio" name="searchOption" value="type"> �з�
	    <span class="circle">
	        <span class="check"></span>
	    </span>
	  </label>
</div>
	<div class="input-group col-md-3">
	    <input type="text" class="form-control" name="keyword"/>
		    <span class="input-group-addon">
		    <button type="submit" class="btn btn-white btn-round btn-just-icon">
			    <i class="material-icons">search</i>
			    <div class="ripple-container"></div>
		    </button>
		    </span>
		</div>
  </form>
	</div>
</div>
 <!--����¡ ���� -->

                  </div>
              </div>
          </div>
      </div>
  </div>
<br/><br/>
</body>
</html>




