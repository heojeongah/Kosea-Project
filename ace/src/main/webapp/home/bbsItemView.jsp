<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<section class="bgwhite p-t-66 p-b-60">
	<div class="container">
<div class="col-md-8 p-b-30">
				<h4 align="left" class="m-text26 p-b-36 p-t-15">�Խñ� �б�</h4>
<table class="table">
	<tr class="table-head">
		<td class="column-5">�۹�ȣ</td><td class="column-2">${QNA_ITEM.qna_id }</td>
	</tr>
	<tr class="table-head">
		<td class="column-5">������</td><td class="column-2">${QNA_ITEM.title }</td>
	</tr>
	<tr class="table-head">
		<td class="column-5">�ۼ���</td><td class="column-2">${QNA_ITEM.c_id }</td>
	</tr>	
	<tr class="table-head">
		<td class="column-5">�ۼ���</td><td class="column-2">${QNA_ITEM.w_date }</td>
	</tr>
		<tr class="table-head">
		<td class="column-5">�۳���</td><td class="column-2">
		<textarea rows="10" cols="70" readonly="readonly">${QNA_ITEM.content }</textarea>
		</td>
		</tr>
<tr><td colspan="2">
	<a href="javascript:goModify()">[����]</a>
	<a href="javascript:goDelete()">[����]</a>
	<a href="../qna/read.html">[���]</a>
	</td></tr>	
</table>
					</div>
				</div>
				
<%-- 	<tr><td>�۹�ȣ</td><td>${QNA_ITEM.qna_id }</td></tr> --%>
<%-- 	<tr><td>������</td><td>${QNA_ITEM.title }</td></tr> --%>
<%-- 	<tr><td>�ۼ���</td><td>${QNA_ITEM.c_id }</td></tr> --%>
<%-- 	<tr><td>�ۼ���</td><td>${QNA_ITEM.w_date }</td></tr> --%>
<%-- 	<tr><td>�۳���</td><td>${QNA_ITEM.content }</td></tr> --%>
	

<script type="text/javascript">

function goModify(){
	document.move.action="../qna/writeModify.html";
	document.move.submit();
}
function goDelete(){
	var result=confirm("������ �����Ͻðڽ��ϱ�?");
	if(result == false) return false;
	document.move.action="../qna/delete.html";
	document.move.submit();
}
</script>

<form name="move" method="post">
	<input type="hidden" name="qna_id" 
		value="${QNA_ITEM.qna_id}"/>
	<input type="hidden" name="parentid"
		value="${QNA_ITEM.parent_id }"/>
	<input type="hidden" name="groupid"
		value="${QNA_ITEM.group_id }"/>
</form>
	</section>
</body>
</html>






