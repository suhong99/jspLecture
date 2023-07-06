<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
String content = request.getParameter("content");
if(content == null){
	content = "home";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<style type="text/css">
*{
	margin : 0;
}
</style>
</head>
<body>
<div  align="center">
<table style="width : 800px" border="1">
<tr>
	<td>
		<jsp:include page="header.jsp" flush="false"></jsp:include>
	</td>
</tr>
<tr>
	<td>
		<jsp:include page="menu.jsp" flush="false"/>
	</td>
</tr>
<tr>
	<td>
		<jsp:include page='<%=content + ".jsp" %>' flush="false"/>
	</td>
</tr>
<tr>
	<td>
		<jsp:include page="footer.jsp" flush="false"/>
	</td>
</tr>
</table>
</div>
</body>
</html>