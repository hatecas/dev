<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input{
	margin-right:10px;
	width:50px;
	height:30px;
}
</style>
</head>
<body>
	<div>
		<form id="frmBase" action="http://192.168.200.128/baseball/baseball.do" style="display: flex; justify-content: center; align-items: center; height: 100vh;"
			method="post">
			<input type="number" min="0" max="9" name="num1"> <input
				type="number" min="0" max="9" name="num2"> <input
				type="number" min="0" max="9" name="num3"> <input
				type="number" min="0" max="9" name="num4"> <input
				type="button" id="btnConfirm" value="확인">
		</form>
	</div>
	<script>
		document.getElementById('btnConfirm').addEventListener('click', function(event) {
			document.getElementById('frmBase').submit();
			})
	</script>

</body>
</html>