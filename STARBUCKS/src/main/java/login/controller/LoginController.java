package login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.model.LoginModel;

public class LoginController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if ( -1 < uri.indexOf("/login.star") ) {
			LoginModel.login(req);
			req.getRequestDispatcher("/jsp/index.jsp").forward(req, res);
		}
		if ( -1 < uri.indexOf("/logout.star") ) {
			LoginModel.logout(req);
			req.getRequestDispatcher("/jsp/index.jsp").forward(req, res);
		}
		
	}

}
