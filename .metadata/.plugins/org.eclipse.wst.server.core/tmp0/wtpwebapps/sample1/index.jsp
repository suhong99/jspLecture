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
<!-- html 주석문 (jsp에도 사용은 가능  -->
<%-- jsp 주석문 --%> 
<%--
	Java Server page --> DB접근이 용이(업제든접근 가능)
	EJB -> Spring frame work-> Spring Boot
	
	Servlet = java(html)
	JSP  = html(java)
 --%>
 <h3>Hello JSP</h3>
 <p>welcome to JSP world</p>
 <%
	// java영역
	// script + applet = scriptlet
	
	/*
	 범위 주석문
	*/
	// int number=0;
 %>
 
<!-- <p>counter : 1</p>
<p>counter : 2</p>
<p>counter : 3</p>
<p>counter : 4</p>
<p>counter : 5</p>
<p>counter : 6</p> -->

<%

for(int i = 1; i<=10; i++){
	%>
	<p>카운터 :<%= i %>> </p>
	<%
}
%>

<%-- scriptlet 영역의 종류 --%>

<%-- 선언부(전역변수,함수) --%>
<%!
 int glNumber=0;

void func(){
	System.out.println("func() 호출");
}
int plus(int a, int b){
	return a+b;
}

class Human{
	private int number;
	private String name;
	
	public Human(){
		number =1;
		name="홍길동";
	}
	public String print(){
		return number+" " +name;
	}
}

%>
<%-- 코드부(지역변수, 코드 로직) --%>
<%
 int number = 0;
glNumber++;
number++;
// 코드부에선 함수 선언은 안됨. 호출
func();
//404 없다 , 500 구문에러
//NullPointerException
Human h= new Human();
Student st = new Student();
%>
<%-- 값 , 리턴이 없는 함수 사용불가.--%>
glNumber:<%=glNumber %>
number:<%= number %>
더하기 : <%=plus(1,2) %>

<%= h.print() %>
<%=st.print() %>
</body>
</html>