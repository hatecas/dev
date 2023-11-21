package com.tjoeun.ilsan.signin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SigninServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) {
		String name = req.getParameter("user_name");
		String id = req.getParameter("user_id");
		String password=req.getParameter("user_password");
		String password2=req.getParameter("password_check");
		String birth=req.getParameter("user_birth");
		String email=req.getParameter("user_email");
		String tel=req.getParameter("user_tel");
		PrintWriter printWriter;
		
		System.out.println("아이디:"+id+"\n이름:"+name+"\n비밀번호:"+password);
		
		try {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			printWriter = res.getWriter();
		} catch (IOException e) {
			
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		String name = req.getParameter("user_name");
		String id = req.getParameter("user_id");
		String password=req.getParameter("user_password");
		String password2=req.getParameter("password_check");
		String birth=req.getParameter("user_birth");
		String email=req.getParameter("user_email");
		String tel=req.getParameter("user_tel");
		PrintWriter printWriter;
		
		System.out.println("아이디:"+id+"\n이름:"+name+"\n비밀번호:"+password);
		
		try {
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html; charset=UTF-8");
			printWriter = res.getWriter();
		} catch (IOException e) {
			
		}
	}

}
