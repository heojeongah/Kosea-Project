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
<title>ȸ�� ���� �Ϸ� ȭ��</title>
</head>
<body>
<div align="center" class="body">
<b><font color="red">ȸ�� ������ ���ϵ帳�ϴ�.
</font></b>
<table>
	<tr height="40px"><td>���̵�</td>
	<td>${user.c_id }</td></tr>
	<tr height="40px"><td>��й�ȣ</td>
	<td>${user.c_pwd }</td></tr>
	<tr height="40px"><td>�� ��</td>
	<td>${user.c_name }</td></tr>
	<tr height="40px"><td>��ȭ��ȣ</td>
	<td>${user.c_phone }</td></tr>
	<tr height="40px"><td>�� ��</td>
	<td>${user.c_addr }</td></tr>
	<tr height="40px"><td>�̸���</td>
	<td>${user.c_email }</td></tr>
</table>
</div>
</body>
</html>








