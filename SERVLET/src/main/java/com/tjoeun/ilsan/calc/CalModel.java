package com.tjoeun.ilsan.calc;

import javax.servlet.http.HttpServletRequest;

public class CalModel {

	private static CalModel cm;

	private CalModel() {
	}

	public static CalModel getInstance() {
		if (cm == null) {
			cm = new CalModel();
		}
		return cm;
	}

	public int calculator(HttpServletRequest req) {
		String operation = req.getParameter("operation");
		int num1 = Integer.parseInt(req.getParameter("num1"));
		int num2 = Integer.parseInt(req.getParameter("num2"));
		int result = 0;
		if (operation.equals("plus")) {
			result = num1 + num2;
		} else if (operation.equals("minus")) {
			result = num1 - num2;
		} else if (operation.equals("multiply")) {
			result = num1 * num2;
		} else if (operation.equals("divide")) {
			result = num1 / num2;
		}
		
		return result;
	}

}
