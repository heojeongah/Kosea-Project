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
	<c:when test="${sessionScope.loginUser == null}">
		<script type="text/javascript">
			alert("로그아웃 되었습니다.");
			location.href="../home/main.html";
		</script>
	</c:when>
	<c:otherwise>
	<h3>로그아웃되지 못했습니다. 관리자에게 문의하세요.</h3>
	</c:otherwise>
</c:choose>
</body>
</html>




