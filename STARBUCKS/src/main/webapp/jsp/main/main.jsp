<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>스타벅스</title>
		<style>
			#output{
				display:block;
				white-space:pre-wrap;
			}
		</style>
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
		<!-- https://velog.io/@virtualplastic/JSP-Servlet-%ED%8C%8C%EC%9D%BC-%EC%97%85%EB%A1%9C%EB%93%9C -->
		<div>
			<form id="frmUpload" method="post" enctype="multipart/form-data"
				action="<c:url value='/file/upload.star'/>">
				<input id="file" type="file" name="uploadFile" multiple>
				<output id="output"></output>
				<br> <input id="btnUpload" type="button" value="업로드">
			</form>
		</div>
		<script>
				const input = document.getElementById('file')
				const output = document.getElementById('output')
		
				document.getElementById('file').addEventListener('input', (event) => {
				  const files = event.target.files
				  output.textContent = Array.from(files).map(file => file.name).join('\n')
				})
				
				document.getElementById('btnUpload').addEventListener('click', function(){
					document.getElementById('frmUpload').submit();
				});
			</script>
	</body>
	</html>