package starbucks.model;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;

import city.dao.CityMapper;
import cookie.CookieMaker;
import mybatis.factory.SigletonSessionFactory;
import starbucks.dao.OrderInfoMapper;

public class StarbucksModel {
	
	public static String checkStock(HttpServletRequest req) throws JsonSyntaxException, JsonIOException, IOException {
		JsonObject returnJson = null;
		JsonObject json = new Gson().fromJson(req.getReader(), JsonObject.class);
		System.out.println(json);
		JsonObject paramJson= (JsonObject)json.get("param");
		String menu = paramJson.get("menu").getAsString();
		String amount = paramJson.get("amount").getAsString();
		if ( "coffee".equals(menu) ) {
			if ( 50 < Integer.parseInt(amount) ) {
				returnJson = new JsonObject();
				returnJson.addProperty("resultCode", "0");
				JsonObject jo = new JsonObject();
				jo.addProperty("stock", 50);
				returnJson.add("data", jo);
			} else {
				returnJson = new JsonObject();
				returnJson.addProperty("resultCode", "1");
			}
		} else {
			returnJson = new JsonObject();
			returnJson.addProperty("resultCode", "1");
		}
		return new Gson().toJson(returnJson);
	}
	
	public static void makeFood(HttpServletRequest req) throws IOException {
		String menu = req.getParameter("menu");
		String amount = req.getParameter("amount");
		int sum = 0;
		if ("cake".equals(menu)) {
			sum = 5000 * Integer.parseInt(amount);
		}
		if ("coffee".equals(menu)) {
			sum = 5500 * Integer.parseInt(amount);
		}
		if ("sandwich".equals(menu)) {
			sum = 6000 * Integer.parseInt(amount);
		}
		try (SqlSession session = SigletonSessionFactory.getSqlSessionFactory().openSession(false)) {
			OrderInfoMapper mapper = session.getMapper(OrderInfoMapper.class);
			HashMap map = new HashMap();
			map.put("menu", menu);
			map.put("amount", amount);
			map.put("sum", sum);
			map.put("user_id", req.getSession().getAttribute("userName"));
			int result = mapper.insertOrderInfo(map);
			if ( 1 == result ) {
				session.commit();
			}
		}
		
		req.setAttribute("menu", menu);
		req.setAttribute("amount", Integer.parseInt(amount));
		req.setAttribute("sum", String.valueOf(sum));
	}

	
	public static void selectOrderList(HttpServletRequest req) throws IOException {
		String menu = req.getParameter("menu");
		if ( "".equals(menu) ) {
			menu = null;
		}
		String user_id = req.getParameter("user_id");
		if ( "".equals(user_id) ) {
			user_id = null;
		}
		try (SqlSession session = SigletonSessionFactory.getSqlSessionFactory().openSession(false)) {
			OrderInfoMapper mapper = session.getMapper(OrderInfoMapper.class);
			HashMap map = new HashMap();
			map.put("menu", menu);
			map.put("user_id", user_id);
			List<HashMap> orderList = mapper.selectOrderInfo(map);
			req.setAttribute("orderList", orderList);
		}
	}
}
