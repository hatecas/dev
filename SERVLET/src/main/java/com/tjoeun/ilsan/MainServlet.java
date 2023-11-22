package com.tjoeun.ilsan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjoeun.ilsan.baseball.BaseballController;
import com.tjoeun.ilsan.calc.CalController;
import com.tjoeun.ilsan.calc.CalInputController;

import cookie.CookieMaker;


public class MainServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("MainServlet - doGet");
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("MainServlet - doPost");
		String uri = req.getRequestURI();
		System.out.println(uri);
		String url = req.getRequestURL().toString();
		System.out.println(url);
		if(-1<uri.indexOf("/index.do")) {
			com.tjoeun.ilsan.index.IndexController.service(req, res);
		}	
		if (uri.startsWith("/calc/compute.do")) {
			CookieMaker.makeCookie("cal",res);
			CalController.getInstance().service(req, res);
		}
		if (uri.startsWith("/calc/compute_input.do")) {
			CalInputController.getInstance().service(req, res);
		}
		if(uri.startsWith("/baseball/baseball_set.do")) {
			CookieMaker.makeCookie("baseball",res);
			BaseballController.getInstance().service(req, res);
		}
		if(uri.startsWith("/baseball/baseball.do")) {
			BaseballController.getInstance().service(req, res);
		}

	}
}