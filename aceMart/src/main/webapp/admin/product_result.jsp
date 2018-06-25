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
	상품 수정에 실패하였습니다<br/>
	</c:when>
	<c:when test="${param.RESULT=='DBL' }">
	중복된 상품번호입니다<br/>
	</c:when>
	<c:when test="${param.RESULT=='OK' }">
	상품이 등록되었습니다
	</c:when>
	<c:otherwise>
	상품등록에 실패하였습니다. 관리자에게 문의해주세요.
	</c:otherwise>
</c:choose>
</body>
</html>