<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JW Server</title>
</head>
<body>
	<div>
		<h1>Welcome to JW PlayGround</h1>
	</div>
	<c:if test="${sessionScope.user_name eq null}">
	<div>
		<span>${msg}</span> 
	</div>
	<div>
		<form id="frmLogin" method="post" action="<c:url value='/login.jw'/>">
			<input type="text" name="user_id" placeholder="아이디" required><br>
			<input type="password" name="user_pw" placeholder="비밀번호" required><br>
			<input type="button" value="회원가입" id="btnSignin">
			<input type="button" value="로그인" id="btnLogin">
		</form>
	</div>	
	</c:if>
	<c:if test="${sessionScope.user_name ne null}">
		<span>${user_id}</span>
	
	</c:if>
	
	<script>
		let btnLogin=document.getElementById('btnLogin');
		if(btnLogin!=null){
			btnLogin.addEventListener('click',function(){
				document.getElementById('frmLogin').submit();
			});
		}
		
		let btnSignin=document.getElementById('btnSignin');
		btnSignin.addEventListener('click',function(){
			location.href="<c:url value='/signin.jw'/>";
		})
	</script>
</body>
</html>