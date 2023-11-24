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
			<ul>
				<li><a href="<c:url value='/'/>">첫화면으로</a></li>
			</ul>
		</div>
		<div>
			<h2>파일 업로드</h2>
		</div>
		<div>
			<form>
				<input type="file"><br>
				<input type="button" value="업로드">
			</form>
		</div>
	</body>
</html>