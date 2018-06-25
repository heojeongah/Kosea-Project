<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
	uri="http://www.springframework.org/tags/form" %>	    
	 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${RESULT == 'nobody' }">
	<h3>글을 올리려면 로그인을 하세요.</h3>
	</c:when>
	<c:when test="${RESULT == 'nologin' }">
	<h3>서비스를 이용하려면 로그인을 하세요.</h3>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
	<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-4 p-b-30 m-l-r-auto">
				<form:form modelAttribute="user" class="leave-comment" action="../login/template.html" method="post">
						<h4 class="m-text26 p-b-36 p-t-15">
							Log in
						</h4>
						
						<div>
							<font color="red"><form:errors path="c_id"/></font>
						</div>
						<div class="bo4 of-hidden size15 m-b-20">
							<form:input path="c_id"  cssClass="sizefull s-text7 p-l-22 p-r-22" placeholder="ID"/>
						</div>
						
						<div class="">
							<font color="red"><form:errors path="c_pwd"/></font>
						</div>
						<div class="bo4 of-hidden size15 m-b-20">
							<form:password  path="c_pwd" cssClass="sizefull s-text7 p-l-22 p-r-22" placeholder="PASSWORD"/>
						</div>
						<div class="flex-w flex-m w-full-sm">
							<div class="w-size25 m-t-10 m-b-10 m-r-10 m-l-r-auto">
								<!-- Button -->
								<input type="submit" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4"  value="로그인"/>
							</div>
							<div class="w-size25 m-l-r-auto">
								<!-- Button -->
								<a href="../home/intro.html?BODY=tems.jsp" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">회원가입</a>
							</div>
						</div>
					</form:form>
				</div>

			</div>
		</div>
	</section>


<%-- 	<form:form modelAttribute="user"  --%>
<%-- 		action="../login/template.html" method="post"> --%>
<%-- 	아이디: <form:input path="c_id"  size="12"/><font color="red"><form:errors path="c_id"/></font><br/> --%>
<%-- 	패스워드: <form:password path="c_pwd" size="12"/><font color="red"><form:errors path="c_pwd"/></font> --%>
<!-- 	<br/> -->
<!-- 	<input type="submit" value="로그인"/> -->
<%-- 	</form:form> --%>

</body>
</html>









