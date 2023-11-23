package calc.input.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalcInputController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (-1 < uri.indexOf("/calc_input.jw")) {
			req.getRequestDispatcher("/jsp/calc/calc_compute.jsp").forward(req,res);
		}
	}
}
