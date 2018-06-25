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
작성완료
<c:choose>
<c:when test="${DELETE=='OK' }">
<script type="text/javascript">
alert("취소되었습니다.");
location.href="../home/getOrderList.html";
</script>
</c:when>
<c:when test="${DELETE=='NOK' }">
<script type="text/javascript">
	alert("본인글만 삭제 가능합니다.");
	location.href="../product/read.html";
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
	alert("고객님의 소중한 후기가 등록되었습니다.");
	location.href="../home/getOrderList.html";
</script>
</c:otherwise>
</c:choose>
</body>
</html>










