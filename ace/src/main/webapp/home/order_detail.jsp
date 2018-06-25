<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ����</title>
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
				<h4 align="left" class="m-text26 p-b-36 p-t-15">�ֹ� ����</h4>
				<table class="table">
					<tr class="table-head">
						<td>�ֹ�����</td><td class="column-1">${DETAIL.o_date }</td>
					</tr>
				    <tr class="table-row">
						<td>�ֹ���ȣ</td><td  class="column-1">${DETAIL.o_code }</td>
					</tr>
					<tr class="table-row">
						<td>�ֹ�ó������</td><td  class="column-1">${DETAIL.d_state }</td>
					</tr>
				</table>

				<h4 align="left" class="m-text26 p-b-36 p-t-15">����� ����</h4>
						<table class="table">
							<tr class="table-head">
								<td>������</td><td class="column-1">${DETAIL.d_name }</td>
							</tr>
							<tr class="table-row">
								<td>�ּ�</td><td class="column-1">${DETAIL.d_addr }</td>
							</tr>
							<tr class="table-row">
								<td>����ó</td><td class="column-1">${DETAIL.d_phone }</td>
							</tr>
						</table>
		
				<h4 align="left" class="m-text26 p-b-36 p-t-15">���� ����</h4>
						<table class="table">
							<tr class="table-head">
								<td>�� �ֹ��ݾ�</td><td class="column-1">${DETAIL.o_total }��</td>
							</tr>
						</table>
		
					<h4 align="left" class="m-text26 p-b-36 p-t-15">�ֹ� ��ǰ ����</h4>
						<table class="table-shopping-cart">
						<tr class="table-head">
							<th>�̹���</th>
							<th>��ǰ��</th> 
							<th>�ǸŰ�</th>
							<th>����</th>
							<th>�հ�ݾ�</th>
							<th>ó������</th>
							<th>��&nbsp;��</th>
						</tr>
						<c:forEach var="order" items="${LIST }">
						<tr class="table-row">
							<td class="column-3">
								<div class="cart-img-product b-rad-4 o-f-hidden">
								<img src="../upload/${order.p_image1}"
									width="120" height="80"/>
								</div>
							</td>
							<td class="column-3">${order.p_name }</td>
							<td class="column-3">${order.p_price }��</td>
							<td class="column-3">${order.o_amount }</td>
							<td class="column-3">${order.p_price*order.o_amount }��</td>
							<td class="column-3">${order.d_state }</td>
							<td>
								<c:choose>
									<c:when test="${order.d_state=='��ۿϷ�' }">
									<div class="w-size25">
										<a href="../comment/writeForm.html?ol_code=${order.ol_code }&p_code=${order.p_code}"
											class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
											�ı��ۼ�</a>
									</div>
									</c:when>
									<c:when test="${order.d_state=='����غ���'&&order.o_state=='�̰���' }">
									<div class="w-size25">
										<a href="../order/itemCancel.html?ol_code=${order.ol_code }&o_code=${order.o_code }"
											class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
											�ֹ����</a>
									</div>
									</c:when>
								</c:choose>
							</td>
						</c:forEach>
						</table>
		</div>
		
</div>
							
				
</div>
	</section>
</body>
</html>