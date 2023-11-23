<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%
		String msg=(String)request.getAttribute("msg");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=msg %>
	<input type="button" id="btnClick" value="뒤로가기">
	<script>
		document.getElementById('btnClick').addEventListener("click",function(){
			location.href='/playground.jw';
		})
	</script>
</body>
</html>