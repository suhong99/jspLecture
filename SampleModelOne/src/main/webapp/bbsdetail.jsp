<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
	int seq = Integer.parseInt(request.getParameter("seq"));

	BbsDao dao = BbsDao.getInstance();
	BbsDto bbs = dao.getBbsBySeq(seq);	
    dao.updateReadCount(seq);


%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>
<div class="center">

<table class="table table-hover">
<col width="70"><col width="600">
<tbody>

	<tr>
		<th>작성자</th>
		<td><%=bbs.getId() %></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td><%=bbs.getWdate() %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=bbs.getReadcount() %></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><%=bbs.getTitle() %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><%=bbs.getContent() %></td>
	</tr>

</tbody>

</table>

<br><br>

</div>
</body>
</html>