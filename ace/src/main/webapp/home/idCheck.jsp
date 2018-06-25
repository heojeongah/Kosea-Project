<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>ID 중복 검사</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="../images/icons/favicon.png"/>
	<link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="../vendor/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="../vendor/lightbox2/css/lightbox.min.css">
	<link rel="stylesheet" type="text/css" href="../css/util.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css"><title>Insert title here</title>
<script type="text/javascript">
function idOK(){
	opener.document.frm.c_id.value=
		document.frm.c_id.value;
	self.close();
}
</script>
</head>
<body>
<section class="bgwhite">
		<div class="container">
			<div class="row">
				<div class="col-md-12 p-b-20">
<form action="../home/idCheck.html" method="get" name="frm">
						<div class="row">
							<div class="col-md-3  m-t-10">ID</div>
							<div class="col-md-6 bo4 of-hidden size15 m-b-20">
								<input type="text"  class="sizefull s-text7 p-l-22 p-r-22" name="c_id" value="${ID }"/>
							</div>
							<div class="col-md-3 size15">
								<input class="flex-c-m size1 bg1 bo-rad-23 hov1 m-text3 trans-0-4"   type="submit" value="중복 검사"/>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-1  m-t-10  m-b-10">
							<c:if test="${DUP == 'YES' }"> 
								<script type="text/javascript">
								opener.document.frm.c_id.value="";
								</script>
								${ID }는 이미 사용 중입니다.
							</c:if>
							<c:if test="${DUP != 'YES' }">
								${ID }는 사용 가능합니다.
							</div>
							<div class="col-sm-1 m-t-10  m-b-10">
							<input  class="flex-c-m size1 bg1 bo-rad-23 hov1 m-text3 trans-0-4"   type="button" value="사용" onClick="idOK()"/>
							</div>
							</c:if>
						</div>
				</form>
				</div></div></div></section>
</body>
</html>









