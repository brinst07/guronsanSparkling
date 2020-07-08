package kr.or.ddit.freeboardfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FreeFileVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class FreeboardFileDAOImpl implements IFreeboardFileDAO {
	
	private static IFreeboardFileDAO dao = new FreeboardFileDAOImpl();
	private SqlMapClient smc;
	
	private FreeboardFileDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFreeboardFileDAO getInstance(){
		return (dao == null) ? new FreeboardFileDAOImpl() : dao;
	}

	@Override
	public void insertFreefile(List<FreeFileVO> freefileList) throws Exception {
		try{
			smc.startTransaction();
			
			for(FreeFileVO freefileInfo : freefileList){
				smc.insert("freefile.insertFreefile", freefileInfo);
			}
			
			smc.commitTransaction();
		}finally{
			smc.endTransaction();
		}
		
		
	}

	@Override
	public FreeFileVO freefileInfo(Map<String, String> params) throws Exception{
		return (FreeFileVO) smc.queryForObject("freefile.freefileInfo", params);
	}
	

}
