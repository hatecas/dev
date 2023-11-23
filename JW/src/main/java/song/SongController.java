package song;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SongController {
	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (-1 < uri.indexOf("song.jw")) {
			req.getRequestDispatcher("/jsp/song/song.jsp").forward(req,res);
		}
	}
}
