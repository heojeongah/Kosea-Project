<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
 	uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<style>
input[type="file"] {
 display:block;
}
.imageThumb {
	 max-height: 100px;
	 max-width: 100px;
	 margin: 10px 10px 0 0;
	 padding: 1px;
 }
</style>
<body>
                        
 <div class="container-fluid">
     <div class="row">
         <div class="col-md-12">
             <div class="card">
             <form:form modelAttribute="product" action="../product/add.html" 
              method="post" enctype="multipart/form-data">
                 <div class="card-header" data-background-color="purple">
                     <h4 class="title">상품 등록</h4>
                     <p class="category"></p>
                 </div>
                 <div class="card-body">
                 <div class="row">
                 	<div class="card-content">
        			 <div class="col-md-7">
                         <div class="row">
                             <div class="col-md-6">
                                 <div class="form-group label-floating">
                                     <label class="control-label">상품코드</label>
                                     <form:input path="p_code"  cssClass="form-control"/>
                                 </div>
                             </div>
                         </div>   
                         
                         <div class="row">
                             <div class="col-md-9">
                                 <div class="form-group label-floating">
                                     <label class="control-label">상품명</label>
                                     <form:input path="p_name" cssClass="form-control"/>
                                 </div>
                             </div>
                         </div>
	                     <div class="row">
                             <div class="col-md-3">
                                 <div class="form-group label-floating">
                                     <label class="control-label">가격</label>
                                     <form:input path="p_price" cssClass="form-control"/>
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="col-md-4">
                                 <div class="form-group label-floating">
                                     <label class="form-text">브랜드</label>
										<select class="form-control" id="selectBox" name="p_brand">
										    <option value="" disabled selected>브랜드</option>
										<c:forEach items="${brands }" var="br">
											<option>${br}</option>
										</c:forEach>
										</select>
                                 </div>
                             </div>
                             <div class="col-md-4">
                                 <div class="form-group label-floating">
                                     <label class="form-text">분류</label>
										<select  class="form-control" name="p_type">
										    <option value="" disabled selected>분류</option>
										<c:forEach items="${types }" var="tp">
											<option>${tp}</option>
										</c:forEach>
										</select>
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                         <div class="col-md-2">
                            <div class="form-group label-floating">
                         	<label id="div-size" class="form-text">사이즈</label>
								<select class="form-control" name="p_size">
								<c:set var="shoeSize" value="230"></c:set>
								<c:forEach var="shoe" begin="0" end="10">
									<option>${shoeSize}</option>
									<c:set var="shoeSize" value="${shoeSize + 5}" />
								</c:forEach>
								</select>
                            </div>
                         </div>
                         <div class="col-md-2">
                            <div id="div-count" class="form-group label-floating">
                            <label class="form-text">수량</label>
								<select class="form-control" name="p_stack">
								<c:forEach var="count" begin="1" end="10">
									<option>${count}</option>
								</c:forEach>
								</select>
                            </div>
                         </div>
                       </div>
					</div>
                    <div class="col-md-5">
						 <div class="fileinput fileinput-new text-center" data-provides="fileinput">
						   <div class="fileinput-new thumbnail img-raised">
							<img src="https://rawgit.com/bludit/themes-repository/master/templates/screenshot.png" alt="...">
						   </div>
						   <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
						   <div class="fileinput-etc"></div>
						   <div>
							<span class="btn btn-raised btn-round btn-rose btn-file">
							   <span class="fileinput-new">Select image</span>
							   <span class="fileinput-exists">Change</span>
							   <input type="file" id="files" name="image" multiple />
							</span>
						        <a href="#pablo" id="remove" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput">
						        <i class="fa fa-times"></i> Remove</a>
						   </div>
						</div>
                    </div>
                    </div>
				</div>
				</div>
				<div class="card-footer">
                    <input type="submit" class="btn btn-primary pull-right" value="등록"/>
                    <div class="clearfix"></div></div>
                    </form:form>
             </div>
         </div>
	</div>
</div>
<br/>
<script type="text/javascript">

$(document).ready(function() {
// 	$('#size-add').click(function(){
// 		 $("<select></select>",{
// 		 class : "form-control",
// 		 id:"count"
// 		 }).insertAfter("#div-size");
// 		 for(int cnt=1;cnt<=10;cnt++){
// 		 	$('#size-add').append("<option>"+cnt+"</option>");
// 		 }
// 	});
	 if(window.File && window.FileList && window.FileReader) {
		 $("#files").on("change",function(e) {
		 var files = e.target.files ,
		 filesLength = files.length ;
		 for (var i = 1; i < filesLength ; i++) {
			 var f = files[i]
			 var fileReader = new FileReader();
			 fileReader.onload = (function(e) {
			 var file = e.target;
			 $("<img></img>",{
			 class : "imageThumb",
			 src : e.target.result,
			 title : file.name
			 }).insertAfter(".fileinput-etc");
		 });
		 fileReader.readAsDataURL(f);
		 }
	});
	 } else { alert("Your browser doesn't support to File API") }
});

$(function(){
	$('#remove').filter(function(){return this.href==location.href}).parent().addClass('active').siblings().removeClass('active')
	$('#remove').click(function(){
//		alert($('#selectBox option:selected').val());
		$('.imageThumb').remove();	
	})
})
	 
	  
</script>
</body>
</html>