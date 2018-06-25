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
                    <h4 class="title">후기 상세</h4>
                    <p class="category"></p>
                </div>
                <div class="card-content table-responsive">
                <c:if test="${ empty comment}">
                존재하지 않는 글입니다.
                </c:if>
                <c:if test="${ ! empty comment}">
                    <table class="table">
                    <tbody>
                        <tr>
                        	<td>글번호</td><td> ${comment.comment_id}</td>
                        </tr>
                        <tr>
                        	<td>주문코드</td><td>${comment.ol_code }</td>
                        </tr>
                        <tr>
                        	<td>상품명</td><td>${comment.p_name}</td>
                        </tr>
                       <tr>
                       		<td>제목</td><td>${comment.title}</td>
                       </tr>
                       <tr>
                       		<td width="250" height="250"><img src="${pageContext.request.contextPath }/upload/${comment.c_image}"
							width="250" height="250" border="0" alt=""/></td>
                       		<td>${comment.content }</td>
                       </tr>
                       <tr>
                       		<td>만족도</td><td>${comment.w_grade}%</td>
                       	</tr>
                       	<tr>
                       		<td>작성일</td><td>${comment.w_date}</td>
                       	</tr>
                       	<tr>
                       		<td>고객ID</td><td>${comment.c_id }</td>
                       </tr>
                   </tbody>
               </table>
               </c:if>
           </div>
        </div>
  </div>
</div>
</div>