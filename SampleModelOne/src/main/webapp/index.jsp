<%@page import="db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	DBConnection.initConnection();

	response.sendRedirect("login.jsp");
//	response.sendRedirect("login_css.jsp");
%>

<!-- 
<script>
location.href = "login.jsp";
</script>
 -->