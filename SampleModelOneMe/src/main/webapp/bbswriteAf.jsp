<%@page import="dto.MemberDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
<%
	request.setCharacterEncoding("utf-8");
    // 세션에서 로그인 정보 가져오기
    MemberDto loginDto = (MemberDto) session.getAttribute("login");
    String id = loginDto.getId();
    
    // 파라미터에서 제목과 내용 가져오기
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    System.out.println(id);
    // BbsDao 인스턴스 생성
    BbsDao dao = BbsDao.getInstance();
    
    // BbsDto 객체 생성
    BbsDto dto = new BbsDto(id, title, content);
    
    // 게시글 작성 함수 호출하여 작성 여부 확인
    boolean success = dao.writeBbs(id, title, content);
      if (success) {
       // 작성 성공 시 처리할 코드
    		%>
				<script type ="text/javascript">
				alert("작성에 성공하셨습니다|");
				location.href ="regi.jsp";
				</script>
				<%
    } else {
        // 작성 실패 시 처리할 코드
    	%>
		<script type ="text/javascript">
		alert("작성에 실패하셨습니다|");
		location.href ="bbswrite.jsp";
		</script>
		<%
    }
%>