package baseball.play;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseballPlayView {

	private static BaseballPlayView bv;

	private BaseballPlayView() {
	}

	public static BaseballPlayView getInstance() {
		if (bv == null) {
			bv = new BaseballPlayView();
		}
		return bv;
	}

	public Boolean result(HttpServletRequest req, HttpServletResponse res) {

		Boolean check = true;

		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter printWriter;
		for (int i = 0; i < BaseballPlayModel.getInstance().num_user.length; i++) {
			if (BaseballPlayModel.getInstance().num_user[i] < 0 || BaseballPlayModel.getInstance().num_user[i] > 9) {
				check = false;
				BaseballPlayModel.getInstance().msg = "0~9에 해당하는 숫자를 입력해주세요.";
			}
			for (int j = 0; j < i; j++) {
				if (BaseballPlayModel.getInstance().num_user[i] == BaseballPlayModel.getInstance().num_user[j]) {
					check = false;
					BaseballPlayModel.getInstance().msg = "중복된 숫자가 존재합니다.";
				}
			}
		}
		return check;
	}
}
