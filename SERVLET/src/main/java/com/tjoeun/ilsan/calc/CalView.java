package com.tjoeun.ilsan.calc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalView {

	private static CalView cv;

	private CalView() {
	}

	public static CalView getInstance() {
		if (cv == null) {
			cv = new CalView();
		}
		return cv;
	}

	public void result(HttpServletRequest req, HttpServletResponse res, int sum) {

		try {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter printWriter = res.getWriter();
			String operation = req.getParameter("operation");
			String operKor = "";
			if (operation.equals("plus")) {
				operKor = "합";
			} else if (operation.equals("minus")) {
				operKor = "뺄셈";
			} else if (operation.equals("multiply")) {
				operKor = "곱셈";
			} else if (operation.equals("divide")) {
				operKor = "나눗셈";
			}
			printWriter.write("두 수의 " + operKor + "은(는) " + sum + "입니다.");
			req.setAttribute("operKor", operKor);
			req.setAttribute("sum", sum);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
