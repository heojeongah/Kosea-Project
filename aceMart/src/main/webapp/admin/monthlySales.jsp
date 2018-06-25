<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"
   uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

</head>
<body>

<script>
  var list = new Array();
  <c:forEach items="${LIST}" var="item">
  list.push("${item}");
  </c:forEach>
</script>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
 				<div class="card-header" data-background-color="purple">
                    <h4 class="title">월별 판매 관리</h4>
                    <p class="category"></p>
                </div>
                <div class="card-content table-responsive">
				<div id="graph" style="height: 300px;"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

new Morris.Line({
     // ID of the element in which to draw the chart.
     element: 'graph',
     // Chart data records -- each entry in this array corresponds to a point on
     // the chart.
     data: [
     {month: "2018-01", value: list[0]},
     {month: "2018-02", value: list[1]},
     {month: "2018-03", value: list[2]},
     {month: "2018-04", value: list[3]},
     {month: "2018-05", value: list[4]},
     {month: "2018-06", value: list[5]},
     {month: "2018-07", value: list[6]},
     {month: "2018-08", value: list[7]},
     {month: "2018-09", value: list[8]},
     {month: "2018-10", value: list[9]},
     {month: "2018-11", value: list[10]},
     {month: "2018-12", value: list[11]}
   ],
     // The name of the data record attribute that contains x-values.
     xkey: 'month',
     // A list of names of data record attributes that contain y-values.
     ykeys: ['value'],
     // Labels for the ykeys -- will be displayed when you hover over the
     // chart.
     labels: ['month'],
     parseTime:false
   });
</script>
</body>
</html>