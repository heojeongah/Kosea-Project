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
alert("���ǰ� ��ϵǾ����ϴ�.");
location.href="../qna/read.html";
</script>
</c:when>
<c:when test="${LOGIN!=null }">
<script type="text/javascript">
alert("�α��� �� �̿��� �ּ���.");
location.href="../qna/read.html";
</script>
</c:when>
<c:when test="${NOK!=null }">
<script type="text/javascript">
alert("���̵� ��ġ���� �ʽ��ϴ�.");
location.href="../qna/read.html";
</script>
</c:when>
<c:when test="${DELETE!=null }">
<script type="text/javascript">
alert("�����Ǿ����ϴ�.");
location.href="../qna/read.html";
</script>
</c:when>
</c:choose>
</body>
</html>










