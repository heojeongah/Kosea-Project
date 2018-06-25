<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>

<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://cdn.rawgit.com/atatanasov/gijgo/master/dist/combined/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://cdn.rawgit.com/atatanasov/gijgo/master/dist/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header" data-background-color="purple">
                    <h4 class="title">배송 상세</h4>
                    <p class="category"></p>
                </div>
                <div class="card-content table-responsive">
                <c:if test="${ empty delivery}">
                존재하지 않는 글입니다.
                </c:if>
                <c:if test="${ ! empty delivery}">
                    <table class="table">
                    <tbody>
                        <tr>
                        	<td>배송번호</td><td> ${delivery.d_number}</td>
                        	<td>주문코드</td><td>${delivery.o_code }</td>
                        </tr>
                        <tr>
<%--                         	<td>상품이름</td><td>${delivery.p_name}</td> --%>
                        	<td>배송상태</td><td>${delivery.d_state}</td>
                        </tr>
                        <tr>
                        	<td>배송시작일</td><td>${delivery.d_sdate}</td>
                        	<td>배송완료일</td><td>${delivery.d_edate}</td>
                        </tr>
                        <tr>
                       		<td>고객 ID</td><td>${delivery.c_id}</td>
                       		<td>수신인 이름</td><td>${delivery.d_name}</td>
                       </tr>
                       <tr>
                       		<td>수신인 주소</td><td>${delivery.d_addr}</td>
                       		<td>수신인 연락처</td><td>${delivery.d_phone}</td>
                       </tr>
                     </tbody>
               </table>
               </c:if>
           </div>
        </div>
  </div>
</div>
</div>