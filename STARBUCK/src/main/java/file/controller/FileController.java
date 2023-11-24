package file.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if ( -1 < uri.indexOf("/main.star") ) {
			req.getRequestDispatcher("/jsp/file/main.jsp").forward(req, res);
		}
	}
}
