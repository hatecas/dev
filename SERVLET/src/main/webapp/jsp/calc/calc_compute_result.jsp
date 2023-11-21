<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String operKor=(String)request.getAttribute("operKor");
		int sum=(Integer)request.getAttribute("sum");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	두 수의 <%=operKor %>은(는) <%=sum %>입니다.
	<input type="button" id="btnClick" value="뒤로가기">
	<script>
		document.getElementById('btnClick').addEventListener("click",function(){
			location.href='http://192.168.200.128/calc/compute_input.do';
		})
	</script>
</body>
</html>