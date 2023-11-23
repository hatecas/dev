package baseball.main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseballMainController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (-1 < uri.indexOf("/baseball_main.jw")) {
			req.getRequestDispatcher("/jsp/baseball/baseball_main.jsp").forward(req,res);
		}
	}
}
