<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="./css/dev2.css">
	<script src="./js/signin.js"></script>
	<script>
		var username, userid, userpw, userpw2, userbirth, birth, useremail, usertel;
	</script>
</head>

<body>
	<header>
		<hr>
		<h1 style="text-align:center;">회원가입</h1>
		<hr>
	</header>
	<main style="text-align: left;">
		<form id="frmSignin" action="http://localhost/SigninServlet" method="post">
			<fieldset style="width: 800px; margin-left: auto; margin-right: auto; border-radius: 10px;">
				<legend style="margin-left: auto; margin-right: auto;">
					<h2>회원가입</h2>
				</legend>
				<div style="margin-left: 50px;">
				<p>
					<label for="user_name">이름</label>
					<input onkeyup="name_check()" type="text" name="user_name" id="user_name" required>
					<br>
				</p>
				<p>
					<label for="user_id">아이디</label>
					<input onkeyup="id_check()" type="text" name="user_id" id="user_id" maxlength="12" required>
					<br>
					<span class="comment" id="id_comment">* 4~12글자만 입력가능합니다.</span>

				</p>
				<p>
					<label for="user_password">비밀번호</label>
					<input onkeyup="pw_check()" type="password" name="user_password" id="user_password" maxlength="12" required>
					<br>
					<span class="comment" id="pw_comment">* !@#$%^&* 포함 4~12글자 입력가능합니다.</span>
				</p>
				<p>
					<label for="password_check">비밀번호 확인</label>
					<input onkeyup="pw_check2()" type="password" name="password_check" id="password_check">
					<br>
					<span class="comment" id="pw_comment_check">비밀번호가 일치하는지 확인합니다.</span>
				</p>
				<p>
					<label for="user_birth">생년월일</label>
					<input onkeyup="birth_check()" type="date" name="user_birth" id="user_birth">
					<br>
					<span class="comment" id="birth_comment">자신의 생년월일을 선택해주세요.</span>
				</p>
				<p>
					<label for="user_email">이메일 주소</label>
					<input onkeyup="email_check()" type="email" name="user_email" id="user_email" placeholder="ex)abcd@gmail.com">
					<br>
					<span class="comment" id="email_comment">@을 포함한 올바른 형식의 이메일 주소를 입력해주세요.</span>
				</p>
				<p>
					<label for="user_tel">전화번호</label>
					<input onkeyup="tel_check()" type="tel" name="user_tel" id="user_tel" placeholder="ex)01012345678">
					<br>
					<span class="comment" id="tel_comment">-를 제외한 숫자 11자만으로 입력해주세요.</span>
				</p>
				</div>

			</fieldset>
			
			<div style="text-align: center; margin-top:10px;">
				<input type="submit" value="확인" id="btnSubmit">
				<input type="reset">
				<br><br>
			</div>
		</form>
	</main>
	<script>
		document.getElementById('btnSubmit').addEventListener('click',function(){
			document.getElementById('frmSignin').submit();
		});		
	</script>
</body>

</html>