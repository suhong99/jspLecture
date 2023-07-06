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
</head>
<body>

<br><br>
<div class="center">

<div class="form-row align-items-center d-flex justify-content-center align-items-center container">
<select id="choice" class="form-control" style="width:auto;">
	<option value="">검색</option>
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<div class="col-sm-3 my-1" style="width:auto;">
	<input type="text" id="search" class="form-control" value="<%=search %>">
</div>

<button type="button" onclick="searchBtn()" class="btn btn-primary">검색</button>
</div>
<br>

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
			
			<%
			if(bbs.getDel() == 0){
				%>				
				<td style="text-align: left;">
					<a href="./main.jsp?content=bbsdetail&seq=<%=bbs.getSeq() %>">
						<%=BbsUtil.arrow(bbs.getDepth()) %>
						<%=BbsUtil.titleDot(bbs.getTitle()) %>
					</a>
				</td>
				<% 
			}else{
			%>
				<td style="text-align: left;">
					<%=BbsUtil.arrow(bbs.getDepth()) %>
					<font color="#ff0000"> ****** 이 글은 작성자에 의해서 삭제되었습니다</font>
				</td>			
			<%
			}
			%>
			
			<td><%=bbs.getReadcount() %></td>
			<td><%=bbs.getId() %></td>
		</tr>
		<% 
	}
}
%>
</tbody>

</table>
<br>

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
				style="font-size: 15pt;color: #000; font-weight: bold; text-decoration: none;">
				[<%=i + 1 %>]
			</a>			
			<%
		}		
	}
%>

<br>
<br><br>
<a href="./main.jsp?content=bbswrite">글쓰기</a>

</div>

<script type="text/javascript">
let search = "<%=search %>"; 	// 문자열일 경우
if(search != ""){
	let obj = document.getElementById("choice");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
} 

function searchBtn() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	location.href = "./main.jsp?content=bbslist&choice=" + choice + "&search=" + search;
	
}

function goPage( pageNum ) {
	let choice = $("#choice").val();
	let search = $("#search").val();

	location.href = "./main.jsp?content=bbslist&choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
}
</script>

</body>
</html>











