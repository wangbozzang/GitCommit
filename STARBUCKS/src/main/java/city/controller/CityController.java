package city.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import city.model.CityModel;

public class CityController {

	public static void main(String[] args) throws IOException {
		String resource = "mybatis/mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		System.out.println(sqlSessionFactory);
		
		HashMap map = new HashMap();
		map.put("countrycode", "USA");
		List<HashMap> cityList = CityModel.selectCity(sqlSessionFactory, map);
		for ( HashMap cityMap : cityList ) {
			System.out.println((String)cityMap.get("name"));
		}
		
	}

}
