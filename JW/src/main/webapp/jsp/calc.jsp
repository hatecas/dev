<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Calculator</title>
</head>

<body>
	<div>
		<form id="frmCalc" action="http://192.168.200.128/calc/compute.do" method="post">
			<input type="number" name="num1" id="" placeholder="number1"><br>
			<input type="number" name="num2" id="" placeholder="number2"><br>
			<select name="operation" id="operation">
				<option value="plus">Plus</option>
				<option value="minus">Minus</option>
				<option value="multiply">Multiply</option>
				<option value="divide">Divide</option>
			</select>			
			<input type="button" id="btnConfirm" value="confirm">
		</form>
	</div>
	<script>
		document.getElementById('btnConfirm').addEventListener('click', function () {
			document.getElementById('frmCalc').submit();
		});

	</script>

</body>

</html>