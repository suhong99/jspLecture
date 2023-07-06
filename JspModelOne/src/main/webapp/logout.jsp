<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	session.removeAttribute("login");	
%>
<script>
location.href = "./main.jsp?content=login";
</script>

