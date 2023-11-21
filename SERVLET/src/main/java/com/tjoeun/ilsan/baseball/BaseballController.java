package com.tjoeun.ilsan.baseball;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseballController {

	private static BaseballController cc;

	private BaseballController() {
	}

	public static BaseballController getInstance() {
		if (cc == null) {
			cc = new BaseballController();
		}
		return cc;
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if ("/baseball/baseball_set.do".equals(uri)) {
			BaseballModel.getInstance().com(req);
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/baseball/baseball_play.jsp");
			rd.forward(req, res);
		}

		if ("/baseball/baseball.do".equals(uri)) {
			BaseballModel.getInstance().user(req, res);
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/baseball/baseball_result.jsp");
			rd.forward(req, res);
		}
	}
}
