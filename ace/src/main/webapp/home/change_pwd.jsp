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
	 
	 // ���Է� ��ġ ����
	 if (newPwd != newPwd2) {
	  alert("�Է��� �� ���� ��й�ȣ�� ����  ��ġ���� �ʽ��ϴ�.");
	  return false;
	  }
	 if(oldPwd == newPwd){
		 alert("���� ��й�ȣ�� �� ��й�ȣ�� ��ġ�մϴ�.")
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
		    $('font[name=check]').html("��ȣ�� ��ġ���� �ʽ��ϴ�");
		   }else{
		    $('font[name=check]').text('');
		    $('font[name=check]').css("color","green");
		    $('font[name=check]').html("��ȣ�� ��ġ�մϴ�.");
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
							����������
						</h4>

						<ul class="p-b-54">
							<li class="p-t-4">
								<a href="../home/getOrderList.html" class="s-text13 active1">
									�ֹ�/��� ��Ȳ
								</a>
							</li>

							<li class="p-t-4">
								<a href="../home/update_info.html" class="s-text13">
									���� ���� ����
								</a>
							</li>

							<li class="p-t-4">
								<a href="../home/change.html" class="s-text13">
									��й�ȣ ����
								</a>
							</li>
						</ul>
					</div>
				</div>
				
			<div align="center">
				<h4 align="left" class="m-text26 p-b-36 p-t-15">��й�ȣ ����</h4>
				<table align="center">
					<tr>
						<td>������ ��й�ȣ�� ���� ���� ����Ʈ�� ��й�ȣ�� ���� ���, <br /> ����Ǳ� ����Ƿ� ������
							������ȣ�� ���� ��й�ȣ�� ���������� <br /> �����Ͽ� �ֽñ� �ٶ��ϴ�.
						</td>
					</tr>
					<tr>
						<td>�������� ����(2�� �̻� ����)�� 10�� �̻� ��밡���մϴ�. <br /> 3�� �̻� �ߺ��Ǵ� ����,
							���ڴ� ����� �� ������, <br /> ���鵵 ����� �� �����ϴ�.
						</td>
					</tr>
					<tr>
						<td>������ ��й�ȣ�� ���� ���� ����Ʈ�� ��й�ȣ�� ���� ���, <br /> ����Ǳ� ����Ƿ� ������
							������ȣ�� ���� ��й�ȣ�� ���������� <br /> �����Ͽ� �ֽñ� �ٶ��ϴ�.
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
								<input type="password" id="oldPwd" name="oldPwd" class="sizefull s-text7 p-l-22 p-r-22" placeholder="���� ��й�ȣ"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8 bo4 of-hidden size15 m-b-20">
								<input type="password" id="newPwd" name="newPwd" class="sizefull s-text7 p-l-22 p-r-22" placeholder="���ο� ��й�ȣ"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8 bo4 of-hidden size15 m-b-20">
								<input type="password" id="newPwd2" name="newPwd2" class="sizefull s-text7 p-l-22 p-r-22" placeholder="���ο� ��й�ȣ Ȯ��"/>
							</div>
							<div class="col-md-4 m-t-10"><font name="check" size="2"></font></div>
						</div>

						<div class="w-size25">
							<!-- Button -->
							<button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
								����
							</button>
						</div>
					</form>
				</div>
			</div>
	</section>
</body>
</html>