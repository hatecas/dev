<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Hello Index</title>
<style>

.button-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 20px; /* 원하는 간격 설정 */
}

.btn {
	margin-bottom: 20px; /* 각 버튼 사이의 간격 설정 */
	font-size: 25px;
	padding: 15px 30px;
	border: 3px solid gold;
	background-color: transparent;
	color: gold;
	text-transform: uppercase;
	letter-spacing: 5px;
	font-weight: bold;
	position: relative;
	transition: all 0.4s;
	overflow: hidden;
	width: 300px;
	height: 60px;
}

.btn:focus {
	outline: none;
}

.btn::before {
	content: "";
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: gold;
	top: 100%;
	left: 0px;
	transition: 0.4s;
	z-index: -1;
}

.btn:hover::before {
	transform: translateY(-100%);
}

.btn:hover {
	color: #3c3e70;
}
</style>

</head>

<body>
	<div style="margin-bottom: 50px; width:50%; margin-left:auto; margin-right:auto;">
		<hr>
		<h2 style="text-align: center">${sessionScope.user_name}님 반갑습니다.</h2>
		<hr>
	</div>
	<div class="button-container">
		<div>
			<input type="button" id="btnCalc" value="calculator" class="btn">
		</div>
		<div>
			<input type="button" id="btnBase" value="Baseball" class="btn">
		</div>
		<div>
			<input type="button" id="btnSong" value="Song" class="btn">
		</div>
	</div>
	<script>
		document
				.getElementById('btnCalc')
				.addEventListener(
						"click",
						function() {
							location.href = '/calc/compute_input.do';
						})
		document
				.getElementById('btnBase')
				.addEventListener(
						"click",
						function() {
							location.href = '/jsp/baseball/baseball_main.jsp';
						})
		document.getElementById('btnSong').addEventListener("click",
				function() {
					location.href = '/song/song.html';
				})
	</script>
</body>

</html>
