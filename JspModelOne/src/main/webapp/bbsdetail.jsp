<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDto mem = (MemberDto)session.getAttribute("login");
	if(mem == null){
		%>
		<script>
		alert("로그인 해 주십시오");
		location.href = "./main.jsp?content=login";
		</script>
		<%
	}
	

	String sseq = request.getParameter("seq");
	int seq = Integer.parseInt(sseq);
	
	BbsDao dao = BbsDao.getInstance();	
	dao.readcount(seq);
	
	BbsDto dto = dao.getBbs(seq);
	
	request.setAttribute("bbs", dto);
%>    
    
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.center{
	margin: auto;
	width: 800px;		
}
th{
	background: royalblue;
	color: white;
}
td{
	text-align: left;
}
</style>

</head>
<body>

<br><br>

<div class="center">

<table class="table table-bordered">
<col width="200"><col width="500">

<tr>
	<th>작성자</th>
	<td>${bbs.id}</td>
</tr>
<tr>
	<th>작성일</th>
	<td><%=dto.getWdate() %></td>	
</tr>
<tr>
	<th>조회수</th>
	<td><%=dto.getReadcount() %></td>	
</tr>
<tr>
	<th>제목</th>
	<td><%=dto.getTitle() %></td>	
</tr>
<tr>	
	<td colspan="2" style="height: 300px; font-size: 120%">
		<textarea rows="12" readonly style="background-color: #ffffff; font-size: 20px" 
cols="15" class="form-control" ><%=dto.getContent() %></textarea>
	</td>
</tr>
</table>

<br>

<button type="button" class="btn btn-primary" onclick="answerBbs(<%=dto.getSeq() %>)">답글</button>

<%
if(mem != null && mem.getId().equals(dto.getId())){
	%>
	<button type="button" class="btn btn-primary" onclick="updateBbs(<%=dto.getSeq() %>)">글수정</button>
	
	<button type="button" class="btn btn-primary" onclick="deleteBbs(<%=dto.getSeq() %>)">글삭제</button>
	<%
}
%>

<script type="text/javascript">
function answerBbs( seq ) {
	location.href = "./main.jsp?content=answer&seq=" + seq;	
}
function updateBbs( seq ) {
	location.href = "./main.jsp?content=bbsupdate&seq=" + seq;
}
function deleteBbs( seq ) {
	location.href = "./main.jsp?content=bbsdelete&seq=" + seq;
}
</script>


</div>

</body>
</html>







