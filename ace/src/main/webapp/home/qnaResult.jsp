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
<c:when test="${OK!=null }">
<script type="text/javascript">
alert("문의가 등록되었습니다.");
location.href="../qna/read.html";
</script>
</c:when>
<c:when test="${LOGIN!=null }">
<script type="text/javascript">
alert("로그인 후 이용해 주세요.");
location.href="../qna/read.html";
</script>
</c:when>
<c:when test="${NOK!=null }">
<script type="text/javascript">
alert("아이디가 일치하지 않습니다.");
location.href="../qna/read.html";
</script>
</c:when>
<c:when test="${DELETE!=null }">
<script type="text/javascript">
alert("삭제되었습니다.");
location.href="../qna/read.html";
</script>
</c:when>
</c:choose>
</body>
</html>










