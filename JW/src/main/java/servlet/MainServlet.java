package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import baseball.main.controller.BaseballMainController;
import baseball.play.BaseballPlayController;
import calc.compute.controller.CalcComputeController;
import calc.input.controller.CalcInputController;
import index.controller.IndexController;
import login.controller.LoginController;
import playground.controller.PlaygroundController;
import signin.controller.SigninController;

public class MainServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//URL 주소 출력, uri 받아옴
		System.out.println(req.getRequestURL());
		String uri=req.getRequestURI();
		//uri가 index.jw일경우 index.jsp로 이동
		if(-1<uri.indexOf("/index.jw")) {
			IndexController.service(req, res);
		}
		//uri가 login.jw일경우 login.jsp로 이동
		if(-1<uri.indexOf("/login.jw")) {
			LoginController.service(req, res);
		}
		//uri가 signin.jw일경우 signin.jsp로 이동
		if(-1<uri.indexOf("/signin.jw")) {
			SigninController.service(req, res);
		}
		if(-1<uri.indexOf("/playground.jw")) {
			PlaygroundController.service(req, res);
		}
		//uri가 signin.jw일경우 signin.jsp로 이동
		if(-1<uri.indexOf("/calc_input.jw")) {
			CalcInputController.service(req, res);
		}		
		if(-1<uri.indexOf("/calc_compute.jw")) {
			CalcComputeController.service(req, res);
		}
		if(-1<uri.indexOf("/baseball_main.jw")) {
			BaseballMainController.service(req, res);
		}
		if(-1<uri.indexOf("/baseball_play.jw")) {
			BaseballPlayController.service(req, res);
		}
		if(-1<uri.indexOf("/baseball_result.jw")) {
			BaseballPlayController.service(req, res);
		}

	}
}
