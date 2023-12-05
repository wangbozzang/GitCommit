package mybatis.factory;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SigletonSessionFactory {
	
	private static SqlSessionFactory sf = null;
	
	private SigletonSessionFactory() {}
	
	public static SqlSessionFactory getSqlSessionFactory() throws IOException {
		if ( null == sf ) {
			String resource = "mybatis/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sf = new SqlSessionFactoryBuilder().build(inputStream);
		}
		return sf;
	}

}
