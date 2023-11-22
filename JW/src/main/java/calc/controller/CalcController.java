package calc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.model.LoginModel;

public class CalcController {
	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if(-1<uri.indexOf("/calc.jw")) {
			req.getRequestDispatcher("/jsp/calc.jsp").forward(req,res);
		}
	}

}
