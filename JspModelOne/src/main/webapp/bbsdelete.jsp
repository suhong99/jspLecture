<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BbsDao dao = BbsDao.getInstance();
	
	boolean process = dao.deleteBbs(seq);
	if(process){
		%>
		<script>
			alert("삭제 성공!");
			location.href ="bbslist.jsp";
		</script>
		<%
		
	}else{
		%>
		<script>
		alert("삭제 실패~");
		location.href="bbsdetail.jsp?seq=" + <%=seq %>;
		</script>
		<%
	}
%>