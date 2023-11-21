package com.tjoeun.ilsan.baseball;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseballModel {

	int[] num_com = new int[4]; // 필드
	int[] num_user = new int[4];
	int strike;
	int ball;
	int out;
	String msg;

	private static BaseballModel bm; // 여기부터

	private BaseballModel() {
	}

	public static BaseballModel getInstance() {
		if (bm == null) {
			bm = new BaseballModel();
		}
		return bm;
	} // 여기까지 싱글톤 패턴

	public void com(HttpServletRequest req) {
		for (int i = 0; i < 4; i++) {
			num_com[i] = Integer.parseInt(req.getParameter("num_com" + i));
			out=0;
		}
	}

	public void user(HttpServletRequest req, HttpServletResponse res) { // 유저의 입력값을 받아서 숫자 가져오기

		strike=0;
		ball=0;
		msg="";
		
		for (int i = 0; i < num_user.length; i++) {
			num_user[i] = Integer.parseInt(req.getParameter("num" + (i + 1)));
		}

		if (BaseballView.getInstance().result(req, res) == true) { // 유저가 입력한 숫자가 이상이 없을 시에 컴퓨터 숫자와 비교
			for (int i = 0; i < 4; i++) {
				if (num_user[i] == num_com[i]) {
					strike++;
				}
			}

			for (int i = 0; i < 4; i++) {
				for (int j = 0; j < 4; j++) {
					if (num_user[i] == num_com[j]) {
						ball++;
					}
				}
			}

			if (strike > 0) {
				ball -= strike;
			}

			if (ball == 0&&strike==0) {
				out++;
			}

			if (strike == 4) {
				msg = "축하드립니다! 정답입니다!";
			}
			if(out==3) {
				msg="3아웃!";
			}

			req.setAttribute("strike", strike);
			req.setAttribute("ball", ball);
			req.setAttribute("out", out);
			req.setAttribute("msg", msg);

			System.out.println(num_user[0] + "," + num_user[1] + "," + num_user[2] + "," + num_user[3]);
			System.out.println(num_com[0] + "," + num_com[1] + "," + num_com[2] + "," + num_com[3]);
			System.out.println(out + "아웃");
			System.out.println(strike + "스트라이크");
			System.out.println(ball + "볼");
		}else if(BaseballView.getInstance().result(req, res) == false) {
			req.setAttribute("strike", strike);
			req.setAttribute("ball", ball);
			req.setAttribute("out", out);
			req.setAttribute("msg", msg);
		}
	}
}
