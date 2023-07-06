<%@page import="dto.CalendarDto"%>
<%@page import="dao.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int seq = Integer.parseInt( request.getParameter("seq") );
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

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
<%
CalendarDao dao = CalendarDao.getInstance();
CalendarDto dto = dao.getDay(seq);

// date
String year = dto.getRdate().substring(0, 4);
String month = dto.getRdate().substring(4, 6);
String day = dto.getRdate().substring(6, 8);

String date = year + "-" + month + "-" + day;

// time
String hour = dto.getRdate().substring(8, 10);
String min = dto.getRdate().substring(10);

String time = hour + ":" + min;
%>

<h1>일정수정</h1>

<div class="center">

<form action="calupdateAf.jsp" method="post">

<table class="table table-bordered">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td align="left">
		<%=dto.getId() %>
		<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
	</td>
</tr>
<tr>
	<th>일정</th>
	<td>
		<div class="input-group triple-input">
			<input type="date" name="date" class="form-control" value="<%=date %>">&nbsp;
			<input type="time" name="time" class="form-control" value="<%=time %>">
		</div>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" size="60" name="title" class="form-control" value="<%=dto.getTitle() %>">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="15" cols="60" name="content" class="form-control" ><%=dto.getContent() %></textarea>
	</td>
</tr>
</table>

<input type="submit" value="수정완료" class="btn btn-primary">

</form>

</div>

</body>
</html>








