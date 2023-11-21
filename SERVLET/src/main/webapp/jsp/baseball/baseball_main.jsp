<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자 야구</title>
<style>
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
	<form id="frmBase"
		action="http://192.168.200.128/baseball/baseball_set.do" method="post"
		style="display: flex; justify-content: center; align-items: center; height: 100vh;">
		<input type="button" id="btnStart" value="게임 시작" onclick="numRandom()"
			class="btn"> <input type="hidden" value="0" name="num_com0"
			id="num_com0"> <input type="hidden" value="1" name="num_com1"
			id="num_com1"> <input type="hidden" value="2" name="num_com2"
			id="num_com2"> <input type="hidden" value="3" name="num_com3"
			id="num_com3">
	</form>
	<script>
		document.getElementById('btnStart').addEventListener('click',
				function(event) {
					event.preventDefault();
					document.getElementById('frmBase').submit();
				})
		function getRandomInt(min, max) {
			// min과 max 사이의 랜덤 정수 생성
			min = Math.ceil(min);
			max = Math.floor(max);
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

		let num_com = new Array(4);
		function numRandom() {
			for (let i = 0; i < num_com.length; i++) {
				num_com[i] = getRandomInt(0, 9)
				for (let j = 0; j < i; j++) {
					if (num_com[i] === num_com[j]) {
						i--;
					}
				}
				document.getElementById('num_com' + i).value = num_com[i];
				console.log(num_com[i])
			}

		}
	</script>
</body>
</html>