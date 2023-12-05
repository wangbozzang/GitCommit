package starbucks.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import starbucks.model.StarbucksModel;

public class StarbucksController {

	public static void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if ( -1 < uri.indexOf("/menu.star") ) {
			req.getRequestDispatcher("/jsp/starbucks/menu.jsp").forward(req, res);
		}
		if ( -1 < uri.indexOf("/stock.star") ) {
			PrintWriter out = res.getWriter();
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			out.print(StarbucksModel.checkStock(req));
			out.flush();
		}
		if ( -1 < uri.indexOf("/order.star") ) {
			StarbucksModel.makeFood(req);
			req.getRequestDispatcher("/jsp/starbucks/order.jsp").forward(req, res);
		}
		if ( -1 < uri.indexOf("/orderList.star") ) {
			StarbucksModel.selectOrderList(req);
			req.getRequestDispatcher("/jsp/starbucks/order_list.jsp").forward(req, res);
		}
	}
}
