package com.tjoeun.ilsan.calc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalInputController{

	private static CalInputController cc;

	private CalInputController() {}

	public static CalInputController getInstance() {
		if (cc == null) {
			cc = new CalInputController();
		}
		return cc;
	}
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri=req.getRequestURI();
		if("/calc/compute_input.do".equals(uri)) {
			RequestDispatcher rd=req.getRequestDispatcher("/jsp/calc/calc_compute.jsp");
			rd.forward(req,res);
		}
	}
}
