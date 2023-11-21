package com.tjoeun.ilsan;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("HelloServlet");
		PrintWriter printWriter;
		try {
			printWriter = res.getWriter();
			printWriter.write("HelloServlet");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
