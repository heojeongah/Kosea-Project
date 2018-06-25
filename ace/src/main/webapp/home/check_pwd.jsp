<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- content page -->
	<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			
			<div align="center">
				<h4 align="left" class="m-text26 p-b-36 p-t-15">비밀번호 재확인</h4>
				<table align="center">
					<tr>
						<td>·고객님의 소중한 개인 정보를 보호하기 위해 비밀번호를 다시 한번 확인합니다.
						</td>
					</tr>
					<tr>
						<td>·비밀번호 입력 시 타인에게 노출되지 않도록 주의해 주시기 바랍니다.
						</td>
					</tr>
				</table>
			</div>
			<br/>
			<div class="row">
			<div class="col-md-6 p-b-30 m-l-r-auto">
					<form action="../home/checkPwd.html" method="post" class="leave-comment">
						<div class="bo4 of-hidden size15 m-b-20">
							<input class="sizefull s-text7 p-l-22 p-r-22" id="Pwd" name="Pwd" type="password" placeholder="비밀번호 입력"  width="50"/>
						</div>

						<div class="w-size25">
							<!-- Button -->
							<button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
								확인
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>