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
	<c:when test="${RESULT!=null}">
	<script type="text/javascript">
		alert("주문완료!");
		location.href="../home/main.html";
	</script>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
		alert("주문실패!");
		history.back();
	</script>
	</c:otherwise>
</c:choose>

 </body>
</html>




