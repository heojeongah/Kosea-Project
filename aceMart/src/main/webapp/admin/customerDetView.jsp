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
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>ACE Mart</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Bootstrap core CSS     -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
<!--  Material Dashboard CSS    -->
<link href="../assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="../assets/css/demo.css" rel="stylesheet" />
<!--     Fonts and icons     -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons" rel='stylesheet'>
<!--   Core JS Files   -->
<script src="../assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="../assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="../assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="../assets/js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../assets/js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="../assets/js/material-dashboard.js?v=1.2.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>
<style type="text/css">

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/plugins/piexif.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/plugins/sortable.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/plugins/purify.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/fileinput.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/locales/LANG.js"></script>
<title>��ǰ ��</title>
</head>
<body>

 <div class="container-fluid">
     <div class="row">
         <div class="col-md-12">
             <div class="card">
                 <div class="card-header" data-background-color="purple">
                     <h4 class="title">��ǰ �� ����</h4>
                     <p class="category">������ ���Ͻø� ������ư�� Ŭ���ϼ���</p>
                 </div>
                 <div class="card-body">
                 <div class="row">
                 	<div class="card-content">
        			 <div class="col-md-8">
                         <div class="row">
                             <div class="col-md-6">
                                 <div class="form-group label-floating">
                                     <label class="control-label">��ǰ�ڵ�</label>
                                     <input type="text" disabled="disabled" class="form-control" maxlength="30">${PRODUCT_ITEM.p_code}</input>
                                 </div>
                             </div>
                             <div class="col-md-4">
                                 <div class="form-group label-floating">
                                     <label class="control-label">����</label>
                                     <input type="text" disabled="disabled" class="form-control" maxlength="30">${PRODUCT_ITEM.p_grade}</input>
                                 </div>
                             </div>
                         </div>   
                         <div class="row">
                             <div class="col-md-8">
                                 <div class="form-group label-floating">
                                     <label class="control-label">��ǰ��</label>
                                     <input type="text" disabled="disabled" class="form-control" maxlength="30">${PRODUCT_ITEM.p_name}</input>
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                             <div class="col-md-3">
                                 <div class="form-group label-floating">
                                     <label class="control-label">�귣��</label>
                                     <input type="text" disabled="disabled" class="form-control" maxlength="30">${PRODUCT_ITEM.p_brand}</input>
                                 </div>
                             </div>
                             <div class="col-md-3">
                                 <div class="form-group label-floating">
                                     <label class="control-label">�з�</label>
                                     <input type="text" disabled="disabled" class="form-control" maxlength="30">${PRODUCT_ITEM.p_type}</input>
                                 </div>
                             </div>
                             <div class="col-md-3">
                                 <div class="form-group label-floating">
                                     <label class="control-label">����</label>
                                     <input type="text" disabled="disabled" class="form-control" maxlength="30">${PRODUCT_ITEM.p_price}</input>
                                 </div>
                             </div>
                         </div>
                         <div class="row">
                         <c:if test="${ITEMS!=null}">
                         <div class="col-md-1">
                            <div class="form-group label-floating">
                         	<label class=form-control>������</label>
                            <label class="form-control">����</label>
                            </div>
                         </div>
						 <c:forEach var="item" items="${ITEMS }">
                             <div class="col-md-1">
                            <div class="form-group label-floating">
                                  <label class=form-control>${item.p_size}</label>
                                  <input type="text" disabled="disabled" class="form-control">${item.p_stack}</input>
                            </div>
                             </div>
                         </c:forEach>
                         </c:if>
                         </div>
					</div>
                    <div class="col-md-4">
                        <div class="form-group label-floating">
                                  <input type="text" disabled="disabled" class="form-control">��������</input>
                        </div>
                    </div>
                    </div>
				</div>
				</div>
				<div class="card-footer">
                    <a href="" class="btn btn-primary pull-right">����</a>
                    <div class="clearfix"></div></div>
             </div>
         </div>
	</div>
</div>
<br/>
</body>
</html>