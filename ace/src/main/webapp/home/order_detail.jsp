<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 변경</title>
	<section class="bgwhite p-t-66 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
				<div class="leftbar p-r-20 p-r-0-sm">

					<h4 class="m-text14 p-b-7">마이페이지</h4>

					<ul class="p-b-54">
						<li class="p-t-4"><a href="#" class="s-text13 active1">
								주문/배송 현황 </a></li>

						<li class="p-t-4"><a href="../home/update_info.html"
							class="s-text13"> 개인 정보 변경 </a></li>

						<li class="p-t-4"><a href="../home/change.html"
							class="s-text13"> 비밀번호 변경 </a></li>
					</ul>
				</div>
			</div>
		
			<div class="col-md-8 p-b-30">
				<h4 align="left" class="m-text26 p-b-36 p-t-15">주문 정보</h4>
				<table class="table">
					<tr class="table-head">
						<td>주문일자</td><td class="column-1">${DETAIL.o_date }</td>
					</tr>
				    <tr class="table-row">
						<td>주문번호</td><td  class="column-1">${DETAIL.o_code }</td>
					</tr>
					<tr class="table-row">
						<td>주문처리상태</td><td  class="column-1">${DETAIL.d_state }</td>
					</tr>
				</table>

				<h4 align="left" class="m-text26 p-b-36 p-t-15">배송지 정보</h4>
						<table class="table">
							<tr class="table-head">
								<td>수취인</td><td class="column-1">${DETAIL.d_name }</td>
							</tr>
							<tr class="table-row">
								<td>주소</td><td class="column-1">${DETAIL.d_addr }</td>
							</tr>
							<tr class="table-row">
								<td>연락처</td><td class="column-1">${DETAIL.d_phone }</td>
							</tr>
						</table>
		
				<h4 align="left" class="m-text26 p-b-36 p-t-15">결제 정보</h4>
						<table class="table">
							<tr class="table-head">
								<td>총 주문금액</td><td class="column-1">${DETAIL.o_total }원</td>
							</tr>
						</table>
		
					<h4 align="left" class="m-text26 p-b-36 p-t-15">주문 상품 정보</h4>
						<table class="table-shopping-cart">
						<tr class="table-head">
							<th>이미지</th>
							<th>상품명</th> 
							<th>판매가</th>
							<th>수량</th>
							<th>합계금액</th>
							<th>처리상태</th>
							<th>　&nbsp;　</th>
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
							<td class="column-3">${order.p_price }원</td>
							<td class="column-3">${order.o_amount }</td>
							<td class="column-3">${order.p_price*order.o_amount }원</td>
							<td class="column-3">${order.d_state }</td>
							<td>
								<c:choose>
									<c:when test="${order.d_state=='배송완료' }">
									<div class="w-size25">
										<a href="../comment/writeForm.html?ol_code=${order.ol_code }&p_code=${order.p_code}"
											class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
											후기작성</a>
									</div>
									</c:when>
									<c:when test="${order.d_state=='배송준비중'&&order.o_state=='미결제' }">
									<div class="w-size25">
										<a href="../order/itemCancel.html?ol_code=${order.ol_code }&o_code=${order.o_code }"
											class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
											주문취소</a>
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