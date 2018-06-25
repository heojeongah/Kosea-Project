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
<form:form modelAttribute="qna" 
	action="../qna/qna.html" method="post"
	enctype="multipart/form-data">
<form:hidden path="qna_id"
	value="${qna.qna_id + 1 }"/>
<c:if test="${ ! empty qna.group_id }">
<form:hidden path="group_id"
	value="${param.groupid }"/>
</c:if>
<c:if test="${ ! empty qna.parent_id }">
<form:hidden path="parent_id"
	value="${param.parentid }"/>
</c:if>
<div class="col-md-8 p-b-30 ">
				<h4 align="left" class="m-text26 p-b-36 p-t-15">Q/A작성</h4>
						<table class="table">
					
						<tr class="table-head">
								<td>글제목</td>
						<td><div class="bo4 of-hidden size15 m-b-20">
							<form:input path="title"
							size="20" value="${title }"/>
		<form:errors path="title" class="sizefull s-text7 p-l-22 p-r-22" placeholder="글 제목을 작성해주세요."/></div>
								</td></tr>
						<tr class="table-head">
								<td>내 용</td>
	<td><textarea class="dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-20" name="content" placeholder="내용을 작성해주세요."></textarea></td>
								</tr>
<!-- <tr> -->
<!-- 	<td>글제목</td> -->
<%-- 	<td><form:input path="title" --%>
<%-- 		size="40" value="${title }"/> --%>
<%-- 	<font color="red"><form:errors path="title"/></font> --%>
<!-- 	</td> -->
<!-- </tr> -->

<!-- <tr> -->
<!-- 	<td>내 용</td> -->
<%-- 	<td><form:textarea rows="8" cols="40" --%>
<%-- 			path="content"></form:textarea></td> --%>
<!-- </tr> -->
<tr>
	<td colspan="2">
<div class="w-size15 m-t-10 m-b-10 m-r-10 m-l-r-auto">
<input type="submit" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4"  value="등 록"/></div>
</td>
</tr>
</table>
</div>
</form:form>
</body>
</html>










