package baseball.play;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseballPlayController {

	private static BaseballPlayController cc;

	private BaseballPlayController() {
	}

	public static BaseballPlayController getInstance() {
		if (cc == null) {
			cc = new BaseballPlayController();
		}
		return cc;
	}

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if ("/baseball_play.jw".equals(uri)) {
			BaseballPlayModel.getInstance().com(req);
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/baseball/baseball_play.jsp");
			rd.forward(req, res);
		}

		if ("/basball_result.jw".equals(uri)) {
			BaseballPlayModel.getInstance().user(req, res);
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/baseball/baseball_result.jsp");
			rd.forward(req, res);
		}
	}
}
