<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");
%>

<div style="height: 100px;" class="center">
<h1>header</h1><br><br>
	<% 	if(login == null){ %>	<!-- 로그인이 안된 경우 -->
		<div align="right">
			<a href="./main.jsp?content=login">login</a>		
		</div>
	<%	}else{ %>				<!-- 로그인이 된 경우 -->
		<div align="right">
		 	<a href="logout.jsp">logout</a>		
		</div>
	<% 	} %>
</div>