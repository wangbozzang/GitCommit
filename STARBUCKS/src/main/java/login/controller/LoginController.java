package login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.model.LoginModel;

public class LoginController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		
		//폼 로그인
		if ( -1 < uri.indexOf("/login.star") ) {
			LoginModel.login(req, res);
			req.getRequestDispatcher("/jsp/index.jsp").forward(req, res);
		}
		
		//ajax 로그인
		if ( -1 < uri.indexOf("/loginA.star") ) {
			PrintWriter out = res.getWriter();
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			out.print(LoginModel.loginA(req, res));
			out.flush();
		}
		
		if ( -1 < uri.indexOf("/logout.star") ) {
			LoginModel.logout(req, res);
			req.getRequestDispatcher("/jsp/index.jsp").forward(req, res);
		}
	}
}
