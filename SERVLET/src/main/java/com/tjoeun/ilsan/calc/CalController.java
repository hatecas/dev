package com.tjoeun.ilsan.calc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalController{

	private static CalController cc;

	private CalController() {}

	public static CalController getInstance() {
		if (cc == null) {
			cc = new CalController();
		}
		return cc;
	}
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri=req.getRequestURI();
		if("/calc/compute.do".equals(uri)) {
			int result = CalModel.getInstance().calculator(req);
			CalView.getInstance().result(req,res, result);	
			RequestDispatcher rd=req.getRequestDispatcher("/jsp/calc/calc_compute_result.jsp");
			rd.forward(req,res);
		}
	}
}

//	int sum = Calculator.getInstance().add(Integer.parseInt(req.getParameter("num1")), Integer.parseInt(req.getParameter("num2")));
//
//	System.out.println("CalcServlet - Get");
//
//	System.out.println(sum);
//
//	PrintWriter printWriter;
//	try {
//		res.setCharacterEncoding("UTF-8");
//		res.setContentType("text/html; charset=UTF-8");
//		printWriter = res.getWriter();
//		printWriter.write("두 수의 합은 " + sum + " 입니다.");
//	} catch (IOException e) {
//		e.printStackTrace();
//	}
