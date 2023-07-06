<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String message = (String)request.getAttribute("message");
	if(message!=null && message.equals("")== false){
		if(message.equals("MEMBER_YES")){
			%>
			<script>
			alert("성공적으로 가입되었습니다");
			location.href = "./member?param=login"
			</script>
			<%
		}else{
			%>
			<script>
			alert("떙! 다시 가입")
			location.href="./member?param=regi"
			</script>
			<%
		}
	}
%>