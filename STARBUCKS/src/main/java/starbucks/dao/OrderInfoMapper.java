package starbucks.dao;

import java.util.HashMap;
import java.util.List;

public interface OrderInfoMapper {
	
	public int insertOrderInfo(HashMap map);
	
	public List<HashMap> selectOrderInfo(HashMap map);

}
