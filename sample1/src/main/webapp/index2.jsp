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
<%
	// 단순이동, 값을 전달(parameter)
	//response.sendRedirect("index3.jsp"); //link 이동
	
	//짐을싸자
	Student student = new Student();
	//	request.setAttribute("student",student);
	// request.getSession().setAttribute(name,value); 세션 접근 다른 방법
	session.setAttribute("student",student);
	session.setMaxInactiveInterval(60*60*2);// 2시간 // 저장시간 정할 수 있음.
	
	// 이동 , 값을 전달(object);
	//pageContext.forward("index3.jsp"); // 이동 시 성춘향 100이뜸
	//response.sendRedirect("index3.jsp"); // 사용시 에러남.
	response.sendRedirect("index3.jsp?name=kim"); 

%>
</body>
</html>