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
	/* 
	
		내장(암시)객체 : new 를 통해서 생성하지 않고 바로 사용할 수 있는 객체
		out 		-> java코드를 web에 출력하는 객체
		request 	-> 매개변수의 값을 취득시 getParameter
						객체를 저장할 시에 사용 setAttribute(잠시저장), getAttribute(불러오기)
						
		response	-> 웹페이지간에 이동 sendRedirect
						Character 인코딩을 설정
		session		->	원하는 시간까지 저장
		pageContext	-> 웹페이지간에 이동 forward
		
	*/
	
	System.out.println("Hello JSP");
	out.println("<p>Hello JSP</p>"); // 아래 <p>와 같음
%>
<p>Hello JSP </p>

<%
//한글일때 인코딩
request.setCharacterEncoding("utf-8");

//request(=요청)
// http://localhost:9000/sample1/index1.jsp?name=%ED%99%8D%EA%B8%B8%EB%8F%99&age=24&hobby=%EA%B7%B8%EB%A6%BC&hobby=%EC%98%81%ED%99%94
String name = request.getParameter("name");
String age = request.getParameter("age");
String hobby[] = request.getParameterValues("hobby");

Student student = new Student();
request.setAttribute("student",student); // student이름으로 student객체를 저장하겠따.
Student st = (Student)request.getAttribute("student"); // getAttribute는 무조건 객체반환해서 캐스트 변환

System.out.println(st.print());
%>

<p>이름 : <%=name%></p>
<p>나이:<%=age %></p>
<%
for(int i=0; i<hobby.length;i++){
	%>
	<p>취미 : <%=hobby[i] %> </p>
	<% 
}
%>
</body>
</html>