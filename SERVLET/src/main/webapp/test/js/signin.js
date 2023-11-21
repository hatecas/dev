var everything = new Boolean(false);

function name_check() {
	username = document.getElementById('user_name').value;
}

function id_check() {
	userid = document.getElementById('user_id').value;
	if (userid.length == 0) {
		document.getElementById('id_comment').innerHTML = "* 4~12글자만 입력가능합니다."
	}

	else if (userid.length < 4 || userid.length > 12) {
		document.getElementById('id_comment').innerHTML = "아이디 생성 규칙에 어긋납니다."
		everything = false;
	}
	else {
		document.getElementById('id_comment').innerHTML = "* 사용 가능한 이이디입니다."
		everything = true;
	}
}

function pw_check() {
	let check = new Boolean;
	userpw = document.getElementById('user_password').value;
	if (userpw.includes('(' || ')' || '-' || '+')) {
		check = false;
	}
	else if (userpw.length < 4 || userpw.length > 12) {
		check = false;
	}
	else {
		check = true;
	}
	if (userpw.length == 0) {
		document.getElementById('pw_comment').innerHTML = "* !@#$%^&* 포함 4~12글자 입력가능합니다."
	}

	else if (check == false) {
		everything = false;
		document.getElementById('pw_comment').innerHTML = "비밀번호 생성 규칙에 어긋납니다."
	}
	else if (check == true) {
		everything = true;
		document.getElementById('pw_comment').innerHTML = "* 사용 가능한 비밀번호입니다."
		pw_check2();
	}
}

function pw_check2() {
	userpw2 = document.getElementById('password_check').value;
	if (userpw2.length == 0) {
		document.getElementById('pw_comment_check').innerHTML = "비밀번호가 일치하는지 확인합니다."
	}

	else if (userpw == userpw2) {
		everything = true;
		document.getElementById('pw_comment_check').innerHTML = "비밀번호가 일치합니다."
	}
	else if (userpw != userpw2) {
		document.getElementById('pw_comment_check').innerHTML = "* 비밀번호가 일치하지 않습니다."
		everything = false;
	}
}


function birth_check() {
	userbirth = document.getElementById('user_birth').value;
	birth = userbirth.substring(0, 4);
	if (userbirth == "") {
		document.getElementById('birth_comment').innerHTML = "자신의 생년월일을 선택해주세요."
	}

	else if (birth < 1950 || birth >= 2023) {
		document.getElementById('birth_comment').innerHTML = "올바르지 않은 생년월일입니다."
		everything = false;
	}
	else {
		document.getElementById('birth_comment').innerHTML = "* 올바른 생년월일입니다."
		everything = true;
	}
}

function email_check() {
	useremail = document.getElementById('user_email').value;
	if(useremail.length==0)
	{
		document.getElementById('email_comment').innerHTML = "@을 포함한 올바른 형식의 이메일 주소를 입력해주세요."
	}
	else if (useremail.includes('@') == false) {
		document.getElementById('email_comment').innerHTML = "올바르지 않은 이메일 주소입니다."
		everything = false;
	}
	else {
		document.getElementById('email_comment').innerHTML = "* 사용 가능한 이메일 주소입니다."
		everything = true;
	}
}

function tel_check() {
	let check = new Boolean;
	usertel = document.getElementById('user_tel').value;
	if (usertel.length != 11) {
		check = false;
	}
	else if (isNaN(usertel) == true) {
		check = false;
	}
	else {
		check = true;
	}
	if(usertel.length==0){
		document.getElementById('tel_comment').innerHTML = "-를 제외한 숫자 11자만으로 입력해주세요."
	}
	else if (check == false) {
		document.getElementById('tel_comment').innerHTML = "올바르지 않은 전화번호입니다."
		everything = false;
	}
	else if (check == true) {
		everything = true;
		document.getElementById('tel_comment').innerHTML = "* 사용 가능한 전화번호입니다."
		usertel = usertel.substring(0, 3) + "-" + usertel.substring(3, 7) + "-" + usertel.substring(7, 11);
	}

}

function check() {
	let check = new Boolean;
	if (document.querySelector('input[name="agreement"]:checked').value == 'agree' && document.querySelector('input[name="agreement2"]:checked').value == 'agree') {
		check = true;
	}
	else {
		check = false;
	}
	if (everything == true && check == true) {
		confirm("회원가입하시겠습니까?")
	}
	else if (check == false) {	
		alert("모든 약관에 동의하셔야합니다.")
	}
	else if (everything == false) {
		alert("올바른 값을 기입하지 않은 항목이 있습니다.")
	}

	console.log(check);
	console.log(username);
	console.log(userid);
	console.log(userpw);
	console.log(userpw2);
	console.log(userbirth);
	console.log(useremail);
	console.log(usertel);
}
