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

	var result = confirm("정말로 변경하시겠습니까?");
	if(result == false) return false;
}
</script>
<form:form modelAttribute="qna" 
	action="../qna/updateDo.html" method="post"
	enctype="multipart/form-data"
	onSubmit="return validate(this)">
	
<form:hidden path="c_id" value="${qna.c_id }"/>
<form:hidden path="qna_id" value="${qna.qna_id }"/>
<div class="col-md-8 p-b-30">
				<h4 align="left" class="m-text26 p-b-36 p-t-15">Q/A 수정</h4>
						<table class="table">
					
						<tr class="table-head">
								<td>글제목</td>
						<td><div class="bo4 of-hidden size15 m-b-20">
							<form:input path="title"
							size="20" value="${qna.title }"/>
		<form:errors path="title" class="sizefull s-text7 p-l-22 p-r-22"/></div>
								</td></tr>
				<tr class="table-head">
								<td class="column-1">작성자</td>
						<td>${qna.c_id }</td></tr>
						<tr class="table-head">
								<td>내 용</td>
	<td><textarea class="dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-20" name="content" >${qna.content }</textarea></td>
								</tr>
								
			<tr>
<td colspan="1">
<div class="w-size20 m-t-10 m-b-10 m-r-10 m-l-r-auto">
<input type="submit" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4"  value="수 정"/></div></td>
<!-- <td colspan="1"> -->
<!-- <div class="w-size20 m-t-10 m-b-10 m-r-10 m-l-r-auto"> -->
<!-- <input type="reset" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4"  value="취소"/></div></td> -->
</tr>					
<%-- <tr><td>글제목</td><td><form:input path="title" --%>
<%-- 	size="20" value="${qna.title }"/></td></tr> --%>
<%-- <tr><td>작성자</td><td><form:input path="c_id" --%>
<%-- 	size="20" value="${qna.c_id }"/></td></tr> --%>
<%-- <tr><td>글내용</td><td><form:textarea rows="8" cols="40" --%>
<%-- 	path="content" value="${qna.content }"></form:textarea> --%>
<!-- 	</td></tr> -->

<!-- <tr><td colspan="2"><input type="submit" value="수정"/> -->
<!-- <input type="button" value="취소"  -->
<!-- 	onClick="javascript:history.go(-1)"/> -->
<!-- </td></tr>					 -->
<!-- </table> -->
</table>
</div>
</form:form>
</body>
</html>











