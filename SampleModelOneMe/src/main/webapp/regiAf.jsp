<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%			
				request.setCharacterEncoding("utf-8");
   				String id = request.getParameter("id");
   				String pwd = request.getParameter("pw");
   				String name = request.getParameter("name");
   				String email = request.getParameter("email");

   				MemberDao dao = MemberDao.getInstance();
   				
   				MemberDto dto =new MemberDto(id,pwd,name,email,0);
   				boolean isS = dao.addMember(dto);
   				
   				if(isS == true){//가입성공!
   					%>
   					<script type ="text/javascript">
   					alert("가입에 성공하셨습니다|");
   					location.href ="login.jsp";
   					</script>
   					<%
   				}else {//가입실패
   					%>
   					<script type ="text/javascript">
   					alert("가입에 실패하셨습니다|");
   					location.href ="regi.jsp";
   					</script>
   					<%
   				}
   %>