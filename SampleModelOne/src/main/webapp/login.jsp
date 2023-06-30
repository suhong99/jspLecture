<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<style type="text/css">
.center{
	margin : auto;
	width: 60%;
	border : 3px solid #0000ff;
	padding : 10px;
}
</style>
</head>
<body>

<h2>login</h2>

<div class = "center">
<form action="loginAF.jsp" method="post">
<table>
<tr>
	<th>아이디</th>
	<td>
		<input type="text" id="id" name="id" size="20"><br>
		<input type="checkbox" id="chk_save_id"> id저장
	</td>
</tr>
<tr>
	<th>패스워드</th>
	<td>
		<input type="password" name="pwd" value="" size="20">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="login">
		<a href="regi.jsp">회원가입</a>
		
	</td>
</tr>

</table>

</form>
</div>
<script type="text/javascript">
/*
 	session : server에 저장. login 정보. Object
 	cookie 	: click에 저장. id 를 저장할 때. pw 저장 String
 	
 */
 
 let user_id = $.cookie("user_id");
 if(user_id != null){ //저장한 아이디가 있음
	$("#id").val(user_id);
 	$("#chk_save_id").prop("checked",true); // 체크박에 체크가 되게 한다.
 }
 
 $("#chk_save_id").click(function(){
	// alert("click");
	if($("#chk_save_id").is(":checked")==true){
		if($("#id").val().trim()==""){
			alert("id를 입력해주세요");
			$("#chk_save_id").prop("checked",false);
		}else{
			//cookie 저장  쿠키는 기한 설정가능
			$.cookie("user_id",$("#id").val().trim(),{expires:7,path:'./'});
		}
	}else{// 쿠키에 저장하지 않음(삭제)
		$.removeCookie("user_id",{path:'./'});
	}
 });
 
 
</script>
</body>
</html>