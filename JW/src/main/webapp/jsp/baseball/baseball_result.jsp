<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String msg=(String)request.getAttribute("msg");
    int strike=(Integer)request.getAttribute("strike");
    int ball=(Integer)request.getAttribute("ball");
    int outt=(Integer)request.getAttribute("out");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(msg==""){
	%>
	<%=outt %>아웃 <%=strike %>스트라이크 <%=ball %>볼
	<%
		}else{
	%>
	<%=msg %>
	<%
		}
	%>
	
	<input type="button" id="btnReturn" value="돌아가기">
		<script>
		document.getElementById('btnReturn').addEventListener("click",function(){
			location.href='/jsp/baseball/baseball_play.jsp';
		})
	</script>
</body>
</html>