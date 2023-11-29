package index.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if ( -1 < uri.indexOf("/index.star") ) {
			//form submit 로그인
			//req.getRequestDispatcher("/jsp/index.jsp").forward(req, res);
			
			//ajax 로그인
			req.getRequestDispatcher("/jsp/index_ajax.jsp").forward(req, res);
		}
	}
}
