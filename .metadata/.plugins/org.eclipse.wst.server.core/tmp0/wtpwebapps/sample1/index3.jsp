<%@page import="sample1.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>index3</h1>
	<%
	//	Student s= (Student)request.getAttribute("student");
		Student s= (Student)session.getAttribute("student");
	//	//response.sendRedirect("index3.jsp"); //로 이동해도 값을 가져옴
	Student p = (Student)session.getAttribute("student");

	%>

<p><%=s.print() %></p>
<p><%=p.print() %></p>

<%-- <%
 // String name =request.getParameter("name");
%>
 --%>
 <%-- <%= name %> --%>
</body>
</html>