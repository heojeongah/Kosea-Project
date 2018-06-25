<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</head>
<body>
<c:if test="${ITEM_NUM!=null }">
<script type="text/javascript">
$(function(){
	swal( '${PRODUCT_ITEM.p_name }', "${ITEM_NUM } 개의 상품을 담았습니다 !", "success");
});
</script>
</c:if>
<form action="../cart/addCart.html" method="get">
	<!-- Product Detail -->
	<div class="container bgwhite p-t-35 p-b-80">
		<div class="flex-w flex-sb">
			<div class="w-size13 p-t-30 respon5">
				<div class="wrap-slick3 flex-sb flex-w">
					<div class="wrap-slick3-dots"></div>
					<div class="slick3">
						<div class="item-slick3" data-thumb="../upload/${PRODUCT_ITEM.p_image1 }">
							<div class="wrap-pic-w">
								<img src="../upload/${PRODUCT_ITEM.p_image1 }" alt="IMG-PRODUCT">
							</div>
						</div>
					</div>
				</div>
			</div>
		

			<div class="w-size14 p-t-30 respon5">
				<p class="s-text5 p-t-10">
					상품코드 : ${PRODUCT_ITEM.p_code}
				</p>
				<h4 class="product-detail-name m-text16 p-b-13">
					${PRODUCT_ITEM.p_name}
				</h4>

				<span class="m-text17">
					${PRODUCT_ITEM.p_price}
				</span>
				<div class="p-b-15 p-t-30">
					<span class="s-text15 m-r-35">브랜드</span>
					<span class="s-text15">${PRODUCT_ITEM.p_brand}</span>
				</div>
				<div class="p-b-15 p-t-10">
					<span class="s-text15 m-r-35">배송비</span>
					<span class="s-text15">무료 배송</span>
				</div>
				<!--  -->
				<div class="p-t-33 p-b-60">
					<div class="flex-m flex-w p-b-10">
						<div class="s-text15 w-size15 t-center">
							Size
						</div>

						<div class="rs2-select2 rs3-select2 bo4 of-hidden w-size16">
							<select class="selection-2" name="size">
								<option>Choose an option</option>
								<c:forEach var="item" items="${ITEMS }">
									<option>${item.p_size }</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="flex-r-m flex-w p-t-10">
						<div class="w-size16 flex-m flex-w">
							<div class="flex-w bo5 of-hidden m-r-22 m-t-10 m-b-10">
								<button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
									<i class="fs-12 fa fa-minus" aria-hidden="true"></i>
								</button>
								<input class="size8 m-text18 t-center num-product" type="number" name="o_amount" value="1">
								<button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
									<i class="fs-12 fa fa-plus" aria-hidden="true"></i>
								</button>
							</div>
								<input type="hidden" value="${PRODUCT_ITEM.p_name }" name="p_name">
							<div class="btn-addcart-product-detail size9 trans-0-4 m-t-10 m-b-10">
								<!-- Button -->
								<input type="hidden" value="${PRODUCT_ITEM.p_code }" name="p_code"/>
								<button type="submit"
								class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4">
									Add to Cart
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="p-b-45">
					<span class="s-text8 m-r-35">SKU: MUG-01</span>
					<span class="s-text8">Categories: Mug, Design</span>
				</div>
			</div>
	
			
			<div class="wrap-pic-w">
				<img src="../upload/${PRODUCT_ITEM.p_image2 }" alt="IMG-PRODUCT">
			</div>
			<div class="wrap-pic-w">
				<img src="../upload/${PRODUCT_ITEM.p_image3 }" alt="IMG-PRODUCT">
			</div>
		<div class="container-table-cart pos-relative">
		<div class="wrap-table-shopping-cart bgwhite">
			<table class="table-shopping-cart" id="contents">
				<tr class="table-head">
					<th class="column-1 title">사진</th>
					<th class="column-2">제목</th>
					<th class="column-3">만족도</th>
					<th class="column-3">작성자</th>
					<th class="column-1">작성일</th>
					<th class="column-6"> &nbsp;    </th>
				</tr>
<c:if test="${ !empty COMMENTS }">
<c:forEach var="comment" items="${COMMENTS }">
				<tr class="table-row">
					<td class="title">
						<div class="cart-img-product b-rad-4 o-f-hidden">
						<img class="m-l-10" src="../upload/${comment.c_image}"
							width="120" height="120"/>
						</div>
					</td>
					<td class="title">${comment.title }</td>
					<td class="title">${comment.w_grade }</td>
					<td class="title">${comment.c_id }</td>
					<td class="title">${comment.w_date }</td>
												
					<td class="title">
					<c:if test="${sessionScope.loginUser==comment.comment_id  }">
						<div class="w-size25">
							<!-- Button -->
							<a href="../comment/delete.html?code=${comment.comment_id }&c_id=${comment.c_id }"
								class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
								삭 제</a>
						</div>
					</c:if>
					&nbsp;
					</td>
				</tr>
				<tr class="table-row">
					<td colspan="6" class="conts">→${comment.content}</td>
				</tr>
				
					
</c:forEach>
</c:if>
			</table>
		</div>
	</div>
		
		</div>
		
	</div>
	


	<div id="dropDownSelect2"></div>

<script type="text/javascript">

//initialize with defaults
$(function () {
	$('#contents tr').hide();
	$('#contents').find('.title').parent().show(); 
	$('#contents .title').parent().click(function(){ 
		$('#contents tr').hide(); 
		$('#contents').find('.title').parent().show();
		$('#contents').find('.title').css('background-color', '#fff'); 
		var tr = $('#contents tr'); 
		var rindex = $(this).parent().children().index(this); 
		$(this).children().css('background-color', '#f7f7f7');
		for(var i = rindex; i < rindex + 2; i++){
			$(tr[i]).show();
		}
	});
});


</script>

<!--===============================================================================================-->
	<script type="text/javascript">
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect2')
		});
// 		$('.btn-addcart-product-detail').each(function(){
// 			var nameProduct = $('.product-detail-name').html();
// 			$(this).on('click', function(){
// 				swal(nameProduct, "is added to cart !", "success");
// 			});
// 		});
		
		
// 	function addSuccess(form){
// 		var nameProduct = $('.product-detail-name').html();
// 		alert("성공");
// 		if(swal(nameProduct, "is added to cart !", "success")){
// 			return true;
// 		}else{
// 			return false;
// 		}
// 	}
	</script>

</form>
</body>
</html>








