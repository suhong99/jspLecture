<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	BbsDao dao = BbsDao.getInstance();

	List<BbsDto> list = dao.getBbsList();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
<h1>게시판</h1>
<p>목록</p>

<div align="center">

<table border ="1">
<col width="70"><col width="600"><col width="100"><col width="150">
<thead>
<tr>
	<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
</tr>
</thead>
<tbody>
<%
if(list == null|| list.size()==0){
	%>
	<tr>
		<td colspan = "4"> 작성된 글이 없습니다 </td>
	</tr>
	<%
}else{
	for(int i = 0; i<list.size(); i++){
		BbsDto bbs= list.get(i);
	%>
		<tr>
			<td><%=i +1 %></td>
			<td>
				<%= bbs.getTitle() %>
			</td>
			<td>
				<%= bbs.getReadcount() %>
			</td>
			<td>
				<%= bbs.getId() %>
			</td>
			
		</tr>
	<%
	}
}
%>
</tbody> 
</table>
<br><br>

<a href="bbswrite.jsp">글쓰기</a>
</div>
</body>
</html>