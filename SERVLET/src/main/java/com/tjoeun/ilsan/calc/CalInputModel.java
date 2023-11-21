package com.tjoeun.ilsan.calc;

import javax.servlet.http.HttpServletRequest;

public class CalInputModel {

	private static CalInputModel cm;

	private CalInputModel() {
	}

	public static CalInputModel getInstance() {
		if (cm == null) {
			cm = new CalInputModel();
		}
		return cm;
	}



}
