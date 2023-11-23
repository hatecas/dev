package playground.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.model.LoginModel;

public class PlaygroundController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (-1 < uri.indexOf("/playground.jw")) {
			req.getRequestDispatcher("/jsp/playground.jsp").forward(req, res);
		}
	}
}
