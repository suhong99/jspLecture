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
</head>
<body>

<h2>일정추가</h2>

<div align="center">

<form action="calwriteAf.jsp" method="post">

<table border="1">
<col width="200"><col width="200">
<tr>
	<th>아이디</th>
	<td>
		<%=login.getId() %>
		<input type="hidden" name="id" value="<%=login.getId() %>">
	</td>
</tr>
<tr>
	<th>일정</th>
	<td>
		<input type="date" name="date" id="date">&nbsp;
		<input type="time" name="time" id="time">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="80">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="80" name="content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="일정추가">
	</td>
</tr>
</table>

</form>

</div>

<script type="text/javascript">
let year = "<%=year %>";
let month = "<%=month %>";
let day = "<%=day %>";

// 2023-07-05
document.getElementById("date").value = year + "-" + month + "-" + day;

let d = new Date();
document.getElementById("time").value = d.getHours() + ":" + d.getMinutes();

</script>


</body>
</html>











