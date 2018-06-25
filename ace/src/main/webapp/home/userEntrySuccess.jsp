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
<title>회원 가입 완료 화면</title>
</head>
<body>
<div align="center" class="body">
<b><font color="red">회원 가입을 축하드립니다.
</font></b>
<table>
	<tr height="40px"><td>아이디</td>
	<td>${user.c_id }</td></tr>
	<tr height="40px"><td>비밀번호</td>
	<td>${user.c_pwd }</td></tr>
	<tr height="40px"><td>성 함</td>
	<td>${user.c_name }</td></tr>
	<tr height="40px"><td>전화번호</td>
	<td>${user.c_phone }</td></tr>
	<tr height="40px"><td>주 소</td>
	<td>${user.c_addr }</td></tr>
	<tr height="40px"><td>이메일</td>
	<td>${user.c_email }</td></tr>
</table>
</div>
</body>
</html>








