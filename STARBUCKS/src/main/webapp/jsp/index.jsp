<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>스타벅스</title>
	</head>
	<body>
		<div>
			<h1>스타벅스에 오신걸 환영합니다!</h1>
		</div>
		<c:if test="${null eq sessionScope.userName}">
		<div>
			<span>${msg }</span>
		</div>
		
		<div>
			<form id="frmLogin" method="post" action="<c:url value='/login.star'/>">
				<input type="text" name="user_id" placeholder="아이디" required><br>
				<input type="text" name="user_pw" placeholder="암호" required><br>
				<input type="submit" value="로그인">
			</form>
		</div>
		
		</c:if>
		<c:if test="${null ne sessionScope.userName}">
			<div>
				<span>${userName}님</span>
				<span>
					<input type="button" id="btnLogout" value="로그아웃">
				</span>
			</div>
		<div>
			<ul>
				<li><a href="<c:url value='/starbucks/menu.star'/>">메뉴</a></li>
			</ul>
		</div>
		</c:if>
		<script>
			let btnLogin = document.getElementById('btnLogin');
			if ( null != btnLogin ) {
				btnLogin.addEventListener('click',function(){
					document.getElementById('frmLogin').submit();
				});
			}
			let btnLogout = document.getElementById('btnLogout');
			if ( null != btnLogout ) {
				btnLogout.addEventListener('click',function(){
					location.href = "<c:url value='/logout.star'/>";
				});
			}
		</script>
	</body>
</html>