<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="util.BbsUtil"%>

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
<title>게시판목록</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


<style type="text/css">
.center{
	margin: auto;
	width: 1000px;
	text-align: center;
}
th{
	background: royalblue;
	color: white;
} 
tr {
   line-height: 12px;   
}
</style>

</head>
<body>

<h1>게시판</h1>
<br>

<div class="center">

<table class="table table-hover">
<col width="70"><col width="600"><col width="100"><col width="150">
<thead>
<tr>
	<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
</tr>
</thead>

<tbody>
<%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="4">작성된 글이 없습니다</td>
	</tr>
	<%
}else{
	
	for(int i = 0;i < list.size(); i++){
		BbsDto bbs = list.get(i);
		%>
		<tr>
			<td><%=i + 1 %></td>
			<td style="text-align: left;">
				<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
					<%=BbsUtil.titleDot(bbs.getTitle())%>
				</a>
			</td>
			<td><%=bbs.getReadcount() %></td>
			<td><%=bbs.getId() %></td>
		</tr>
		<% 
	}
}
%>
</tbody>

</table>

<br><br>
<a href="bbswrite.jsp"  style="float: right;">글쓰기</a>
<div>
<select id="choice">
	<option value="제목">제목</option>
	<option value="작성자">작성자</option>
</select>
<input type="text" id="search">
<input type="button" onclick="searchBtn()" value ="검색"/>
</div>

</div>
<script type="text/javascript">
function searchBtn(){
	let choice = document.getElementById("choice").value;
	let search= document.getElementById("search").value;
	
	if(choice.trim()==""){
		alert("카테고리를 선택해 주십시오");
		return;
	}
	if(search.trim()==""){
		alert("검색어를 입력해주세용");
		return;
	}
	
	location.href="bbslist.jsp?choice"+choice +"&search"+search;
}
</script>
</body>
</html>



