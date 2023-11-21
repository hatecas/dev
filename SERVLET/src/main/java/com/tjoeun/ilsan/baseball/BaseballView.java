package com.tjoeun.ilsan.baseball;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseballView {

	private static BaseballView bv;

	private BaseballView() {
	}

	public static BaseballView getInstance() {
		if (bv == null) {
			bv = new BaseballView();
		}
		return bv;
	}

	public Boolean result(HttpServletRequest req, HttpServletResponse res) {

		Boolean check = true;

		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter printWriter;
		for (int i = 0; i < BaseballModel.getInstance().num_user.length; i++) {
			if (BaseballModel.getInstance().num_user[i] < 0 || BaseballModel.getInstance().num_user[i] > 9) {
				check = false;
				BaseballModel.getInstance().msg = "0~9에 해당하는 숫자를 입력해주세요.";
			}
			for (int j = 0; j < i; j++) {
				if (BaseballModel.getInstance().num_user[i] == BaseballModel.getInstance().num_user[j]) {
					check = false;
					BaseballModel.getInstance().msg = "중복된 숫자가 존재합니다.";
				}
			}
		}
		return check;
	}
}
