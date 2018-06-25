<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function passwordCheck(form) {
	
     var oldPwd = document.getElementById("oldPwd").value;
	 var newPwd = document.getElementById("newPwd").value;
	 var newPwd2 = document.getElementById("newPwd2").value;
	 
	 // 재입력 일치 여부
	 if (newPwd != newPwd2) {
	  alert("입력한 두 개의 비밀번호가 서로  일치하지 않습니다.");
	  return false;
	  }
	 if(oldPwd == newPwd){
		 alert("기존 비밀번호와 새 비밀번호가 일치합니다.")
		 return false;
	 }
	 
	 return true;
}

	$(function(){
		  $('#newPwd').keyup(function(){
		   $('font[name=check]').text('');
		   $('font[name=valid]').text('');
		  }); //#user_pass.keyup

		  $('#newPwd2').keyup(function(){
		   if($('#newPwd').val()!=$('#newPwd2').val()){
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
	<!-- content page -->
	<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="row">			
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
					<div class="leftbar p-r-20 p-r-0-sm">
				
						<h4 class="m-text14 p-b-7">
							마이페이지
						</h4>

						<ul class="p-b-54">
							<li class="p-t-4">
								<a href="../home/getOrderList.html" class="s-text13 active1">
									주문/배송 현황
								</a>
							</li>

							<li class="p-t-4">
								<a href="../home/update_info.html" class="s-text13">
									개인 정보 변경
								</a>
							</li>

							<li class="p-t-4">
								<a href="../home/change.html" class="s-text13">
									비밀번호 변경
								</a>
							</li>
						</ul>
					</div>
				</div>
				
			<div align="center">
				<h4 align="left" class="m-text26 p-b-36 p-t-15">비밀번호 변경</h4>
				<table align="center">
					<tr>
						<td>·쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같은 경우, <br /> 도용되기 쉬우므로 고객님의
							정보보호를 위해 비밀번호는 정기적으로 <br /> 변경하여 주시기 바랍니다.
						</td>
					</tr>
					<tr>
						<td>·영문과 숫자(2개 이상 조합)로 10자 이상 사용가능합니다. <br /> 3자 이상 중복되는 문자,
							숫자는 사용할 수 없으며, <br /> 공백도 사용할 수 없습니다.
						</td>
					</tr>
					<tr>
						<td>·쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같은 경우, <br /> 도용되기 쉬우므로 고객님의
							정보보호를 위해 비밀번호는 정기적으로 <br /> 변경하여 주시기 바랍니다.
						</td>
					</tr>
				</table>
			</div>
			</div>
			
			<br/><br/>
			<div class="col-md-6 p-b-30 m-l-r-auto">
					<form action="../home/changePwd.html" method="post" 
						onsubmit="return passwordCheck(this)" class="leave-comment">
				
						<div class="row">
							<div class="col-md-8 bo4 of-hidden size15 m-b-20">
								<input type="password" id="oldPwd" name="oldPwd" class="sizefull s-text7 p-l-22 p-r-22" placeholder="기존 비밀번호"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8 bo4 of-hidden size15 m-b-20">
								<input type="password" id="newPwd" name="newPwd" class="sizefull s-text7 p-l-22 p-r-22" placeholder="새로운 비밀번호"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8 bo4 of-hidden size15 m-b-20">
								<input type="password" id="newPwd2" name="newPwd2" class="sizefull s-text7 p-l-22 p-r-22" placeholder="새로운 비밀번호 확인"/>
							</div>
							<div class="col-md-4 m-t-10"><font name="check" size="2"></font></div>
						</div>

						<div class="w-size25">
							<!-- Button -->
							<button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
								변경
							</button>
						</div>
					</form>
				</div>
			</div>
	</section>
</body>
</html>