package login.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginModel {

	public static void login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String user_id=req.getParameter("user_id");
		String user_pw=req.getParameter("user_pw");
		
		if("admin".equals(user_id)&&"1234".equals(user_pw)) {
			req.getSession().setAttribute("user_name", "User");
		} else {
			req.setAttribute("msg", "로그인 정보가 일치하지 않습니다.");
			req.getRequestDispatcher("/jsp/index.jsp").forward(req, res);
		}
	}
	
}
