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
�ۼ��Ϸ�
<c:choose>
<c:when test="${DELETE=='OK' }">
<script type="text/javascript">
alert("��ҵǾ����ϴ�.");
location.href="../home/getOrderList.html";
</script>
</c:when>
<c:when test="${DELETE=='NOK' }">
<script type="text/javascript">
	alert("���α۸� ���� �����մϴ�.");
	location.href="../product/read.html";
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
	alert("������ ������ �ıⰡ ��ϵǾ����ϴ�.");
	location.href="../home/getOrderList.html";
</script>
</c:otherwise>
</c:choose>
</body>
</html>










