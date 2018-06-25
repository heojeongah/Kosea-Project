<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
	uri="http://www.springframework.org/tags/form" %>	   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function validate(form){
	if(form.title.value == ""){
		alert("제목을 입력하세요."); return false;
	}
	var result = confirm("정말로 저장하시겠습니까?");
	if(result == false) return false;
}
</script>


 <div class="container-fluid">
     <div class="row">
         <div class="col-md-12">
             <div class="card">
<form:form modelAttribute="qna" action="../qna/writeReply.html" method="post"
	enctype="multipart/form-data">
                 <div class="card-header" data-background-color="purple">
                     <h4 class="title">상품 등록</h4>
                     <p class="category"></p>
                 </div>
                 <div class="card-body">
                 <div class="row">
                 	<div class="card-content">

<form:hidden path="qna_id"
	value="${qna_id}"/>
<form:hidden path="order_no"
	value="${qna.order_no + 1 }"/>
<c:if test="${ ! empty qna.group_id }">
<form:hidden path="group_id"
	value="${param.group_id }"/>
</c:if>
<c:if test="${ ! empty qna.parent_id }">
<form:hidden path="parent_id"
	value="${param.parent_id }"/>
</c:if>
<table class="table table-hover">
<tr>
	<td>글제목</td>
	<td><form:input path="title"
		size="40" value="${title }"/>
	<font color="red"><form:errors path="title"/></font>
	</td>
</tr>
<tr>
	<td>내 용</td>
	<td><form:textarea rows="8" cols="40"
			path="content"></form:textarea></td>
</tr>
</table>
  </div>
				</div>
				</div>
				<div class="card-footer">
                    <input type="submit" class="btn btn-primary pull-right" value="등록"/>
                    <div class="clearfix"></div></div>
                    </form:form>
             </div>
         </div>
	</div>
</div>

</body>
</html>










