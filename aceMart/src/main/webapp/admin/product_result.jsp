<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${param.RESULT=='RE' }">
	��ǰ ������ �����Ͽ����ϴ�<br/>
	</c:when>
	<c:when test="${param.RESULT=='DBL' }">
	�ߺ��� ��ǰ��ȣ�Դϴ�<br/>
	</c:when>
	<c:when test="${param.RESULT=='OK' }">
	��ǰ�� ��ϵǾ����ϴ�
	</c:when>
	<c:otherwise>
	��ǰ��Ͽ� �����Ͽ����ϴ�. �����ڿ��� �������ּ���.
	</c:otherwise>
</c:choose>
</body>
</html>