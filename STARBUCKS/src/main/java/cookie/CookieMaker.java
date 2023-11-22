package cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieMaker {
	
	static Cookie cookie;
	
	public static void makeCookie(HttpServletResponse res) {
		cookie=new Cookie("BFG", "chocoCookie");
		cookie.setMaxAge(60*60*24);
		res.addCookie(cookie);
	}
	
	public static void removeCookie(HttpServletResponse res) {
		cookie.setMaxAge(0);
		res.addCookie(cookie);
	}
}
