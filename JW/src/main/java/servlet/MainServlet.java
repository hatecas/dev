package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import index.controller.IndexController;
import login.controller.LoginController;
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
	}
}
