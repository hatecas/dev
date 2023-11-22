package login.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cookie.CookieMaker;

public class LoginModel {

	public static void login(HttpServletRequest req, HttpServletResponse res) {
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");

		if ("jinwoo".equals(user_id) && "1234".equals(user_pw)) {
			req.getSession().setAttribute("userName", "지누");
			CookieMaker.makeCookie(res);

		} else {
			req.setAttribute("msg", "로그인 정보가 일치하지 않습니다.");
		}
	}
	public static void logout(HttpServletRequest req, HttpServletResponse res) {
		req.getSession().removeAttribute("userName");
		CookieMaker.removeCookie(res);
	}
}
