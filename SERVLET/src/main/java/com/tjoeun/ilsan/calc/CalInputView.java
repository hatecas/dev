package com.tjoeun.ilsan.calc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalInputView {

	private static CalInputView cv;

	private CalInputView() {
	}

	public static CalInputView getInstance() {
		if (cv == null) {
			cv = new CalInputView();
		}
		return cv;
	}

	public void result(HttpServletRequest req, HttpServletResponse res, int sum) {
	}
}
