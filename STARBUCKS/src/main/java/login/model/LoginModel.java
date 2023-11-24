package login.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cookie.CookieMaker;

public class LoginModel {

	public static void login(HttpServletRequest req, HttpServletResponse res) {
		String userId = req.getParameter("user_id");
		String userPw = req.getParameter("user_pw");
		if ( "jinwoo".equals(userId) && "1234".equals(userPw) ) {
			req.getSession().setAttribute("userName","이진우");
			CookieMaker.makeCookie(res);
		} else {
			req.setAttribute("msg", "아이디 또는 비밀번호를 다시 확인해주세요.");
		}
	}
	
	public static void logout(HttpServletRequest req, HttpServletResponse res) {
		req.getSession().removeAttribute("userName");
		CookieMaker.removeCookie(res);
	}
	
}
	