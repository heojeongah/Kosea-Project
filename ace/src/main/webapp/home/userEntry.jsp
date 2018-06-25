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
<title>회원 가입 화면</title>
</head>
<body>

<script type="text/javascript">
function idCheck(){
	if(document.frm.c_id.value == ""){
		alert("아이디를 입력하세요.");
		document.frm.c_id.focus();
		return;
	}
	var url="../home/idCheck.html?c_id="+document.frm.c_id.value;
	window.open(url,"_blank_","width=350,height=250");
}
function checkPassword(form){
	if(form.c_pwd.value!=form.pwd.value){
		alert("비밀번호를 확인해주세요.");
		form.c_pwd.focus();
		return false;
	}
}

$(function(){
	  $('#user_pass').keyup(function(){
	   $('font[name=check]').text('');
	   $('font[name=valid]').text('');
	  }); //#user_pass.keyup

	  $('#chpass').keyup(function(){
	   if($('#user_pass').val()!=$('#chpass').val()){
	    $('font[name=check]').text('');
	    $('font[name=check]').css("color","red");
	    $('font[name=check]').html("암호가 일치하지 않습니다");
	   }else{
	    $('font[name=check]').text('');
	    $('font[name=check]').css("color","green");
	    $('font[name=check]').html("암호가 일치합니다.");
	   }
	  }); //#chpass.keyup
	 });



</script>
<!-- <div align="center" class="body"> -->
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach var="error" 
				items="${errors.globalErrors}">
			<spring:message code="${error.code }"/>					
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 p-b-30 m-l-r-auto">
	<form:form modelAttribute="user" method="post" name="frm"
		action="../home/userEntry.html" onsubmit='return checkPassword(this);'>
						<h4 class="m-text26 p-b-36 p-t-15">
							회원 가입
						</h4>
						<div class="row">
							<div class="col-md-3  m-t-10">ID</div>
							<div class="col-md-5 bo4 of-hidden size15 m-b-20">
								<form:input path="c_id"  class="sizefull s-text7 p-l-22 p-r-22" placeholder="ID"/>
							</div>
							<div class="col-md-3 size15">
								<input class="flex-c-m size1 bg1 bo-rad-23 hov1 m-text3 trans-0-4"  type="submit" value="중복 검사" onClick="idCheck()"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3 m-t-10">비밀번호</div>
							<div class="col-md-5 bo4 of-hidden size15 m-b-20">
								<form:password id="user_pass" path="c_pwd" class="sizefull s-text7 p-l-22 p-r-22" placeholder="PASSWORD"/>
							</div>
							<div class="col-md-4 m-t-10"><font name="valid" size="2"></font></div>
						</div>
						<div class="row">
							<div class="col-md-3 m-t-10">비밀번호 확인</div>
							<div class="col-md-5 bo4 of-hidden size15 m-b-20">
								<input type="password" id="chpass" name="pwd" class="sizefull s-text7 p-l-22 p-r-22" placeholder="PASSWORD"/>
							</div>
							<div class="col-md-4 m-t-10"><font name="check" size="2"></font></div>
						</div>
						<div class="row">
							<div class="col-md-3 m-t-10">이름</div>
							<div class="col-md-9 bo4 of-hidden size15 m-b-20">
								<form:input  path="c_name" class="sizefull s-text7 p-l-22 p-r-22" placeholder="NAME"/>
							</div>
						</div>	
						<div class="row">
							<div class="col-md-3 m-t-10">전화번호</div>
							<div class="col-md-9 bo4 of-hidden size15 m-b-20">
								<form:input  path="c_phone" class="sizefull s-text7 p-l-22 p-r-22" placeholder="PHONE"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3 m-t-10">주소</div>
							<div class="col-md-9 bo4 of-hidden size15 m-b-20">
								<form:input  path="c_addr" class="sizefull s-text7 p-l-22 p-r-22" placeholder="ADDRESS"/>
							</div>
						</div>			
						<div class="row">
							<div class="col-md-3 m-t-10">이메일</div>
							<div class="col-md-9 bo4 of-hidden size15 m-b-20">
								<form:input  path="c_email" class="sizefull s-text7 p-l-22 p-r-22" placeholder="E-MAIL"/>
							</div>
						</div>						

						<div class="flex-w flex-m w-full-sm">
<div class="w-size15 m-t-10 m-b-10 m-r-10 m-l-r-auto">
<input type="submit" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4"  value="가입"/></div>
<div class="w-size15 m-t-10 m-b-10 m-r-10 m-l-r-auto">
<input type="reset" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4"  value="취소"/></div>
</div>
</form:form>
</div>
					
						</div>
							</div>
							</div>
							
								</section>
								

</body>
</html>





