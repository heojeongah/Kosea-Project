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
	if(form.imagename.value == ""){
		alert("������ �����ϼ���."); return false;
	}
	var result = confirm("������ �����Ͻðڽ��ϱ�?");
	if(result == false) return false;
}
</script>
<form:form modelAttribute="comment" 
	action="../comment/commentForm.html" method="post"
	enctype="multipart/form-data">
<input type="hidden" name="p_code" value="${p_code }"/>
<table width="100%" border="1" cellpadding="1">
<tr>
	<td>������</td>
	<td><form:input path="title"
		size="40" value="${title }"/>
	<font color="red"><form:errors path="title"/></font>
	</td>
</tr>
<tr>
	<td>����</td>
	<td><form:input path="writer_name" size="20"/>
	<font color="red"><form:errors path="writer_name"/>
	</font>
	</td>
</tr>
<tr>
	<td>�̹���</td>
	<td><input type="file" name="image"/></td>
</tr>
<tr>
	<td>�� ��</td>
	<td><form:textarea rows="8" cols="40"
			path="content"></form:textarea></td>
</tr>
<tr>
	<td colspan="2">
	<input type="submit" value="�� ��"/></td>
</tr>
</table>
</form:form>
</body>
</html>










