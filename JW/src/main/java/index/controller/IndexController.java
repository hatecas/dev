package index.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri=req.getRequestURI();
		if(-1<uri.indexOf("/index.jw")) {
			req.getRequestDispatcher("/jsp/index.jsp").forward(req,res);
		}
	}
}
