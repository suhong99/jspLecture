<%@page import="dto.MemberDto"%>
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
%> 
    
<!DOCTYPE html>
<html>
<head>
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

<br><br>

<div class="center">

<form id="frm" method="post">

<table class="table table-bordered">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td>
		<% if(mem != null){ %>
		<input type="text" id="id" name="id" class="form-control" value="<%=mem.getId() %>" readonly="readonly">
		<% } %>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" id="title" name="title" class="form-control"placeholder="제목을 기입">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="15" cols="50" class="form-control" id="content" name="content" placeholder="내용을 기입"></textarea>
	</td>
</tr>

</table>
<br>
<!-- <input type="submit" value="글쓰기"> -->
<button type="button" class="btn btn-primary">글쓰기</button>

</form>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("button").click(function(){
		// 제목이 비었는지?
		if( $("#title").val().trim() == ""){
			alert("제목을 기입해 주십시오");
			return;
		}				
		// 내용이 비었는지?
		if( $("#content").val().trim() == "" ){
			alert("내용을 기입해 주십시오");
			return;
		}
		
		$("#frm").attr("action", "./main.jsp?content=bbswriteAf").submit();		
	});
})
</script>

</body>
</html>







