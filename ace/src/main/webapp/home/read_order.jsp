<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ����</title>
</head>
<body>
	<!-- content page -->
	<section class="bgwhite p-t-66 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
				<div class="leftbar p-r-20 p-r-0-sm">

					<h4 class="m-text14 p-b-7">����������</h4>

					<ul class="p-b-54">
						<li class="p-t-4"><a href="#" class="s-text13 active1">
								�ֹ�/��� ��Ȳ </a></li>

						<li class="p-t-4"><a href="../home/update_info.html"
							class="s-text13"> ���� ���� ���� </a></li>

						<li class="p-t-4"><a href="../home/change.html"
							class="s-text13"> ��й�ȣ ���� </a></li>
					</ul>
				</div>
			</div>

			<div class="col-md-8 p-b-30">
				<h4 align="left" class="m-text26 p-b-36 p-t-15">�ֹ�/��� ��Ȳ</h4>
				<table class="table">
					<tr class="table-head">
						<th>�ֹ�����</th>
						<th>�ֹ���ȣ</th>
						<th>�ֹ��ݾ�</th>
						<th>�ֹ�/��ۻ���</th>
						<th>&nbsp;</th>
					</tr>
					<tr class="table-row">
						<c:forEach var="order" items="${LIST }">
							<tr>
								<td class="column-1">${order.o_date }</td>
								<td class="column-2"><a href="../home/getOrderDetail.html?o_code=${order.o_code }">${order.o_code }</a></td>
							
							
								<td class="column-3">${order.o_total }��</td>
								<td class="column-4">${order.o_state }/${order.d_state }</td>
								<td>
									<c:choose>
									<c:when test="${order.d_state=='����غ���'&&order.o_state=='�̰���' }">
									<div class="w-size25">
										<a href="../order/orderCancel.html?o_code=${order.o_code }"
											class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
											�ֹ����</a>
									</div>
									</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tr>
				</table>

			</div>
		</div>
	</div>

	</section>
</body>
</html>