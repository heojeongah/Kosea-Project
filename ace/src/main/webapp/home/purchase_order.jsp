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
<title>�ֹ��� �ۼ�/����</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	 $("#checkAddr").change(function(){
	        if($("#checkAddr").is(":checked")){
	    		$(	"#d_name").val('${customer.c_name}');
	    		$(	"#d_phone").val('${customer.c_phone}');
	    		$(	"#d_addr").val('${customer.c_addr}');
	        }else{
	        }
	    });
	
	$("button").click(function(){
		});
	});

</script>
<section class="cart bgwhite p-t-70 p-b-100">
	<div class="container">
		<h4 align="left" class="m-text26 p-b-36 p-t-15">�ֹ� ��ǰ ����</h4>
					<table class="table-shopping-cart">
					<tr class="table-head">
						<th>�̹���</th>
						<th>��ǰ��</th> 
						<th>�ǸŰ�</th>
						<th>����</th>
						<th>�հ�ݾ�</th>
					</tr>
				<c:forEach var="cart" items="${LIST }">
					<tr>
						<td class="column-3">
							<div class="cart-img-product b-rad-4 o-f-hidden">
							<img src="../upload/${cart.p_image1}"
								width="120" height="80"/>
							</div>
						</td>
						<td class="column-3">${cart.p_name }</td>
						<td class="column-3">${cart.p_price }��</td>
						<td class="column-3">${cart.c_amount }</td>
						<td class="column-3">${cart.p_price*cart.c_amount }��</td>
					</tr>
				</c:forEach>
				</table>
			<h4 align="left" class="m-text26 p-b-36 p-t-15">�ֹ� �� ����</h4>
					<table class="table-shopping-cart">
						<tr class="table-row">
							<td>�̸�</td><td class="column-1">${customer.c_name }</td>
							</tr>
						<tr class="table-row">
							<td>����ó</td><td class="column-2">${customer.c_phone }</td>
							</tr>
						<tr class="table-row">
							<td>�̸��� �ּ�</td><td class="column-3">${customer.c_email }</td>
						</tr>
					</table>
		<form:form modelAttribute="checkOut" class="leave-comment" action="../checkout/purchase.html" method="post">
			<h4 align="left" class="m-text26 p-b-36 p-t-15">����� ����</h4>
			<div align="right">�ֹ��ڿ� ���� <input type="checkbox" id="checkAddr"></div>
					<table class="table">
						<tr class="table-row">
							<td>������</td><td class="column-1">
							<div class="bo4 of-hidden size15 m-b-20">
								<form:input path="d_name"  id="d_name" cssClass="sizefull s-text7 p-l-22 p-r-22" placeholder="�̸�"/>
							</div>
							</td>
						</tr>
						<tr class="table-row">
							<td>����ó</td><td class="column-1">
							<div class="bo4 of-hidden size15 m-b-20">
								<form:input path="d_phone" id="d_phone" cssClass="sizefull s-text7 p-l-22 p-r-22" placeholder="��ȭ��ȣ"/>
							</div>
							</td>
						</tr>
						<tr class="table-row">
							<td>�ּ�</td><td class="column-1">
							<div class="bo4 of-hidden size15 m-b-20">
								<form:input path="d_addr" id="d_addr"  cssClass="sizefull s-text7 p-l-22 p-r-22" placeholder="�ּ�"/>
							</div>
							</td>
						</tr>
					</table>
			<h4 align="left" class="m-text26 p-b-36 p-t-15">���� ����</h4>
					<table class="table">
						<tr class="table-head">
							<td>�� �ֹ��ݾ�</td><td class="column-1">${checkOut.o_total }��</td>
						</tr>
						<tr class="table-head">
							<td>��������</td><td class="column-1">
							<form:select path="o_pay">
							<option>�ſ�ī��</option>   <option>������ü</option>  <option>�޴���</option>   
							<option>������</option>
							</form:select></td>
						</tr>
						<tr class="table-head">
							<td>�� �ֹ��ݾ�</td><td class="column-1">${checkOut.o_total }��</td>
							<form:hidden path="o_total" value="${checkOut.o_total }"/>
						</tr>
					</table>
			<div class="w-size15 m-t-10 m-b-10 m-r-10 m-l-r-auto">
				<input type="submit" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4"  value="�� ��"/>
			</div>
		</form:form>
	</div>
	</section>
</body>
</html>