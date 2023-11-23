package calc.compute.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calc.compute.model.CalcComputeModel;

public class CalcComputeController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (-1 < uri.indexOf("/calc_compute.jw")) {
			int result=CalcComputeModel.getInstance().calculator(req);
			String msg="두 수의 계산 결과는 "+result+"입니다.";
			req.setAttribute("msg", msg);
			RequestDispatcher rd=req.getRequestDispatcher("/jsp/calc/calc_result.jsp");
			rd.forward(req,res);
		}
	}
}
