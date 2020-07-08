package kr.or.ddit.freeboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FreeboardVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class FreeboardDAOImpl implements IFreeboardDAO {
	
	private static IFreeboardDAO dao = new FreeboardDAOImpl();
	private SqlMapClient smc;
	
	private FreeboardDAOImpl(){
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFreeboardDAO getInstance(){
		return (dao == null) ? dao = new FreeboardDAOImpl() : dao;
	}

	@Override
	public List<FreeboardVO> freeboardList(Map<String, String> params) throws Exception {
		return smc.queryForList("freeboard.freeboardList", params);
	}

	@Override
	public String insertFreeboard(FreeboardVO freeboardInfo) throws Exception {
		return (String) smc.insert("freeboard.insertFreeboard", freeboardInfo);
	}

	@Override
	public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception {
		return (FreeboardVO) smc.queryForObject("freeboard.freeboardInfo", params);
	}


	@Override
	public void updateFreeboard(FreeboardVO freeboardInfo) throws Exception {
		smc.update("freeboard.updateFreeboard", freeboardInfo);
	}

	@Override
	public void deleteFreeboard(Map<String, String> params) throws Exception {
		smc.update("freeboard.deleteFreeboard", params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) smc.queryForObject("freeboard.totalCount", params);
	}
	@Override
	   public String insertFreeboardReply(FreeboardVO freeboardInfo)
	         throws Exception {
	      //freeboardInfo : 댓글정보(bo_title, bo_nickname, bo_pwd, bo_mail, bo_content, bo_writer, bo_ip)
	      //                부모 게시글 정보 (bo_group, bo_seq, bo_depth)
	      String bo_no = "";
	      try{
	         smc.startTransaction();
	         String bo_seq;
	         if("0".intern() == freeboardInfo.getBo_seq().intern()){
	            bo_seq = (String) smc.queryForObject("freeboard.incrementSeq", freeboardInfo);
	         }else{
	        	smc.update("freeboard.updateSeq", freeboardInfo);
	            bo_seq = String.valueOf(Integer.parseInt(freeboardInfo.getBo_seq()) + 1);
	         }
	         freeboardInfo.setBo_seq(bo_seq);
	         
	         String bo_depth = String.valueOf(Integer.parseInt(freeboardInfo.getBo_depth()) + 1);
	         freeboardInfo.setBo_depth(bo_depth);

	         bo_no = (String) smc.insert("freeboard.insertFreeboardReply", freeboardInfo);
	         
	         smc.commitTransaction();
	      }finally{
	    	  smc.endTransaction();
	      }
	      return bo_no;
	   }

	@Override
	public void updateFreeboardHit(String bo_no) throws Exception {
		smc.update("freeboard.updateFreeboardHit", bo_no);
	}
}
