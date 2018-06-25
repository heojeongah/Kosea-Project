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
	<c:when test="${sessionScope.loginUser != null}">
	<script type="text/javascript">
		alert("로그인 되었습니다.");
		location.href="../home/main.html";
	</script>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
		alert("로그인에 실패하였습니다. 암호와 계정을 확인해주세요");
		location.href="../login/login.html";
	</script>
	</c:otherwise>
</c:choose>

 </body>
</html>




