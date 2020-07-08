package kr.or.ddit.zipcode.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.ZipcodeVO;

public class ZipcodeDaoImpl implements IZipcodeDao{
	
	private static IZipcodeDao dao = new ZipcodeDaoImpl();
	private SqlMapClient smc;
	private ZipcodeDaoImpl(){
		smc = SqlMapClientFactory.getSqlMapClient(); 
	}
	
	public static IZipcodeDao getInstance(){
		return (dao == null) ? dao = new ZipcodeDaoImpl() : dao;
	}
	
	@Override
	public List<ZipcodeVO> zipcodeList(Map<String, String> params) throws Exception {
		
		return smc.queryForList("zipcode.zipcodeList",params);
	}

}
