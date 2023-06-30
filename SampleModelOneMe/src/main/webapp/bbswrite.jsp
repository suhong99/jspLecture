<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
 
 <h1>글쓰기</h1>
 <div align="center">
 <form action="bbswriteAf.jsp" method="post" >
	제목 : <input type="text" name="title" id="title" size="20" placeholder="제목" style="width:'300px'"><br>
	내용 : <textarea rows=6 style="width:'300px'" name="content" id="content" placeholder="내용"></textarea>	
<br>
<input type="submit" value="작성완료">
</form>
 </div>


</body>
</html>