<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//JSP MODEL 1 사용법


		//DB 접근이 언제든 가능
		int number= 1001;
		String name = "홍길동";
//		String json = "{ \"number\":" + number + ", \"name\":'" + name + "' }";
String json = "{ \"number\":" + number + ", \"name\":\"" + name + "\" }";
	//	System.out.println(json);
		out.println(json);
		
%>