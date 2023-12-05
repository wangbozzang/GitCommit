package city.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import city.dao.CityMapper;

public class CityModel {

	public static List<HashMap> selectCity(SqlSessionFactory sqlSessionFactory, HashMap map) {
		List<HashMap> cityNames = null;
		try (SqlSession session = sqlSessionFactory.openSession()) {
			//xml 을 바로 호출하는 방식(단점은 휴먼미스테이크/오타가 날수 있다)
//			cityNames = session.selectList("city.dao.CityMapper.selectCity", map);
			//가장 많이 사용하는 방식(xml에 매핑되는 인터페이스로 호출)			
			CityMapper mapper = session.getMapper(CityMapper.class);
			cityNames = mapper.selectCity(map);
		}
		return cityNames;
	}
}  
