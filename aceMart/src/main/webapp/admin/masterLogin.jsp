<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ �α��� ȭ��</title>
</head>
<body>
<div align="center" class="body">
<h2>������ �α��� ȭ��</h2>
<c:if test="${not empty param.login_error }">
	<font color="red">
	${SPRING_SECURITY_LAST_EXCEPTION.message }</font>
</c:if>
<form action="j_spring_security_check" method="post">
<table>
	<tr height="40px"><td>�����ID</td>
	<td><input type="text" class="userId"
	name="j_username" size="20"/></td></tr>
	<tr height="40px"><td>�н�����</td>
	<td><input type="password" class="password"
	name="j_password" size="20"/></td></tr>
	<tr><td colspan="2" align="center"></td></tr>
</table>
<table>
	<tr><td align="center">
	<input type="submit" value="�α���"/></td></tr>
</table>
</form>
</div>
</body>
</html>







