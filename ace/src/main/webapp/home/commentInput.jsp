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
		alert("������ �Է��ϼ���."); return false;
	}
	if(form.c_image.value == ""){
		alert("������ �����ϼ���."); return false;
	}
	var result = confirm("������ �����Ͻðڽ��ϱ�?");
	if(result == false) return false;
}
</script>


<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-4 p-b-30 m-l-r-auto">
	<form:form modelAttribute="comment" 
	action="../comment/write.html" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="p_code" value="${p_code }"/>
	<form:hidden path="ol_code"
	value="${comment.ol_code }"/>
	<form:hidden path="comment_id"
	value="${comment.comment_id + 1 }"/>
						<h4 class="m-text26 p-b-36 p-t-15">
							ȸ�� ����
						</h4>
<tr>
	<td>������</td><div class="bo4 of-hidden size15 m-b-20">
	<form:input path="title"
		size="40" value="${title }"/>
	<form:errors path="title" class="sizefull s-text7 p-l-22 p-r-22" placeholder="�� ������ �ۼ����ּ���."/>
	</div>
</tr>
<tr>
	<td>����</td>
	<td><select name="w_grade">
		<option value="" disabled selected>����</option>
		<c:forEach var="count" begin="1" end="10">
			<option>${count}</option>
		</c:forEach>
	</select>
	</td>
</tr>
<tr>
	<td>��ǰ ����</td>
	<input type="file" name="image" class="sizefull s-text7 p-l-22 p-r-22"/>
</tr>
<tr>
	<td>�� ��</td>
	<td><textarea class="dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-20" name="content" placeholder="������ �ۼ����ּ���."></textarea></td>

</tr>
<tr>
	<td colspan="2">
<div class="w-size15 m-t-10 m-b-10 m-r-10 m-l-r-auto">
<input type="submit" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4"  value="�� ��"/></div>
</td>
</tr>
</form:form>
</div>
</div>
</div>
</section>
</body>
</html>










