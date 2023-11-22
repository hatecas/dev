package cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieMaker {
	
	public static void makeCookie(String type,HttpServletResponse res) {
		Cookie cookie = new Cookie(type,type+"Cookie");
		cookie.setMaxAge(60*60*2);
		res.addCookie(cookie);
	}
	
	public static void removeCookie(String type, HttpServletResponse res) {
		Cookie cookie=new Cookie(type, type+"Cookie");
		cookie.setMaxAge(0);
		res.addCookie(cookie);
	}
	
}
