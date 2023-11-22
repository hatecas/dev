<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	//String menu = (String)request.getAttribute("menu");
	//int amount = (Integer)request.getAttribute("amount");
	//String sum = (String)request.getAttribute("sum");
%>
<fmt:setLocale value="ko_kr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타벅스</title>
</head>
<body name="body">
	<div>
		<ul>
			<li><a href="<c:url value='/'/>">첫화면으로</a></li>
		</ul>
	</div>
	<div>
		<h2>고객님 주문하신 음식이 나왔습니다.</h2>
	</div>
	<div>
		<h3>
			결제하실 금액은
			<fmt:formatNumber value="${sum }" type="currency" />원 입니다.
		</h3>
	</div>
	<div>
		<%
			//for (int i = 0 ; i < amount ; i++) {
		%>
		<c:set var="image" value="0" />
		<c:forEach begin="1" end="${amount }">
			<span>
				<c:set var="image" value="${image+1}" /> 
					<c:choose>
					<c:when test="${image%10==0}">
						<img style="width: 100px; border: 3px solid yellow;" src="<c:url value='/images/starbucks/${menu }.jpg'/>"> ${image }개<br>
					</c:when>
					<c:otherwise>
						<img style="width: 70px" src="<c:url value='/images/starbucks/${menu }.jpg'/>">
					</c:otherwise>
				</c:choose>
			</span>
		</c:forEach>
		<%	
			//}
		%>
	</div>
</body>
</html>