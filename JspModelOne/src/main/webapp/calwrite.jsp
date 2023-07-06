<%@page import="dto.MemberDto"%>
<%@page import="util.CalendarUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	// 2023-7-5 -> 2023-07-05
	month = CalendarUtil.two(month);
	day = CalendarUtil.two(day);
	
	MemberDto login = (MemberDto)session.getAttribute("login");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정추가</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style type="text/css">
.center{
	margin: auto;
	width: 800px;
	text-align: center;		
}
th{
	background: royalblue;
	color: white;
}
</style>

</head>
<body>

<h2>일정추가</h2>

<div class="center">

<form action="calwriteAf.jsp" method="post">

<table class="table table-bordered">
<col width="200"><col width="500">
<tr>
	<th>아이디</th>
	<td align="left">
		<%=login.getId() %>
		<input type="hidden" name="id" value="<%=login.getId() %>">
	</td>
</tr>
<tr>
	<th>일정</th>
	<td align="left">
		<div class="input-group triple-input">		
			<input type="date" name="date" class="form-control" id="date" style="width: 30%">		
			<input type="time" name="time" class="form-control" id="time" style="width: 30%">
		</div>		
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="80" class="form-control" >
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="15" cols="80" name="content" class="form-control" ></textarea>
	</td>
</tr>
</table>

<input type="submit" value="일정추가" class="btn btn-primary">

</form>
</div>

<script type="text/javascript">
$(document).ready(function(){

	let year = "<%=year %>";
	let month = "<%=month %>";
	let day = "<%=day %>";
	
	// 2023-07-05
	document.getElementById("date").value = year + "-" + month + "-" + day;
	
	let d = new Date();
	document.getElementById("time").value = d.getHours() + ":" + d.getMinutes();
})
</script>


</body>
</html>











