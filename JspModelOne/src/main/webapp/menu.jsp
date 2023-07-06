<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<style type="text/css">
.navbar-nav > li > a { font-size: 18px; }
</style>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-primary sticky-top">
	<div class="container">
	<div class="collapse navbar-collapse" id="navbar-content">
       <ul class="navbar-nav mr-auto">	
          <li class="nav-item">
            <a href="./main.jsp?content=home" class="navbar-brand" style="padding: 14px 14px">Home</a>
          </li>
          <li class="nav-item">
            <a href="./main.jsp?content=bbslist" class="navbar-brand" style="padding: 14px 14px">게시판</a>
          </li>
          <li class="nav-item">
            <a href="./main.jsp?content=calendarList" class="navbar-brand" style="padding: 14px 14px">일정관리</a>
          </li>
		</ul>
	</div>
	</div>
</nav>

</body>
</html>