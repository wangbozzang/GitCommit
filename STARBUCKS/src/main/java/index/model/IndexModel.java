package index.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class IndexModel {

	public static boolean checkSession(HttpServletRequest req) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Object unObj = session.getAttribute("userName");
		if ( null == unObj ) {
			return false;
		} else {
			return true;
		}
	}
	
}
