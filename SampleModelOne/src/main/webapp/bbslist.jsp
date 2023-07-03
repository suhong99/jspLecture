<%@page import="util.BbsUtil"%>
<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 검색
	String choice = request.getParameter("choice");
	String search = request.getParameter("search");
	if(choice == null){
		choice = "";
	}
	if(search == null){
		search = "";
	}
	
	// (현재)페이지 넘버
	String sPageNumber = request.getParameter("pageNumber");
	int pageNumber = 0;
	if(sPageNumber != null && sPageNumber.equals("") == false){
		pageNumber = Integer.parseInt(sPageNumber);
	}

	BbsDao dao = BbsDao.getInstance();	
	// List<BbsDto> list = dao.getBbsList();
	// List<BbsDto> list = dao.getBbsSearchList(choice, search);
	List<BbsDto> list = dao.getBbsPageList(choice, search, pageNumber);
	
	// 글의 총수
	int count = dao.getAllBbs(choice, search);
	// 페이지를 계산
	int pageBbs = count / 10;	// 10개씩 1페이지		21 -> 3페이지
	if((count % 10) > 0){
		pageBbs = pageBbs + 1;	// -> 3
	}
	
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
					<%= BbsUtil.arrow(bbs.getDepth()) %>			
					<%= BbsUtil.titleDot(bbs.getTitle()) %>
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


<%
	for(int i = 0;i < pageBbs; i++){	// 0 1 2 3 ~
		if(pageNumber == i){	// 현재 페이지
			%>
			<span style="font-size: 15pt;color: blue;font-weight: bold;">
				<%=i + 1 %>
			</span>			
			<%
		}
		else{	// 그밖에 페이지
			%>
			<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
				style="font-size: 15pt;color: #000; font-weight: bold;">
				[<%=i + 1 %>]
			</a>			
			<%
		}		
	}
%>

<br><br>
<div class="form-row align-items-center d-flex justify-content-center align-items-center container">
<select id="choice" class="form-control" style="width:auto;">
	<option value="">검색</option>
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<div class="col-sm-3 my-1" style="width:auto;">
	<input type="text" id="search" class="form-control" value="<%= search%>">
</div>

<button type="button" onclick="searchBtn()" class="btn btn-primary">검색</button>
</div>

<br><br>
<a href="bbswrite.jsp">글쓰기</a>

</div>

<script type="text/javascript">
// Java -> JavaScript
let search = "<%=search%>";
if(search!=""){
	let obj = document.getElementById("choice");
	obj.value= "<%=choice %>";
	obj.setAttribute("selected", "selected");
}
function searchBtn() {
	let choice = document.getElementById("choice").value;
//	let choice = $("#choice").val();
	let search = document.getElementById("search").value;
	/*
	if(choice.trim() == ""){
		alert("카테고리를 선택해 주십시오");
		return;
	}
	if(search.trim() == ""){
		alert("검색어를 입력해 주십시오");
		return;
	}
	*/
	location.href = "bbslist.jsp?choice=" + choice + "&search=" + search;
}

function goPage( pageNum ) {
				 
		let choice = $("#choice").val();
		let search = $("#search").val();

	location.href = "bbslist.jsp?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
}


</script>


</body>
</html>











