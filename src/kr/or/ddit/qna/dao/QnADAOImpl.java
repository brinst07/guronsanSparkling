package kr.or.ddit.qna.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.QnAVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class QnADAOImpl implements IQnADAO{
	
	private static IQnADAO dao = new QnADAOImpl();
	private SqlMapClient smc;
	
	private QnADAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	
	}
	public static IQnADAO getInstance(){
		return (dao == null) ? dao = new QnADAOImpl() : dao;
	}
	@Override
	public List<QnAVO> qnaList(Map<String, String> params) throws Exception {
		return smc.queryForList("qna.qnaList", params);
	}
	@Override
	public String insertQna(QnAVO qnaInfo) throws Exception {
		return (String) smc.insert("qna.insertQna", qnaInfo);
	}
	@Override
	public QnAVO qnaInfo(Map<String, String> params) throws Exception {
		return (QnAVO) smc.queryForObject("qna.qnaInfo", params);
	}
	@Override
	public void updateQna(QnAVO qnaInfo) throws Exception {
		smc.update("qna.updateQna", qnaInfo);
		
	}
	@Override
	public void deleteQna(Map<String, String> params) throws Exception {
		smc.update("qna.deleteQna", params);
	}
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) smc.queryForObject("qna.totalCount", params);
	}

	@Override
	   public String insertQnaReply(QnAVO qnaInfo)
	         throws Exception {
	      //freeboardInfo : 댓글정보(bo_title, bo_nickname, bo_pwd, bo_mail, bo_content, bo_writer, bo_ip)
	      //                부모 게시글 정보 (bo_group, bo_seq, bo_depth)
	      String qna_no = "";
	      try{
	         smc.startTransaction();
	         String qna_seq;
	         if("0".intern() == qnaInfo.getQna_seq().intern()){
	        	 qna_seq = (String) smc.queryForObject("qna.incrementSeq", qnaInfo);
	         }else{
	        	smc.update("qna.updateSeq", qnaInfo);
	        	qna_seq = String.valueOf(Integer.parseInt(qnaInfo.getQna_seq()) + 1);
	         }
	         qnaInfo.setQna_seq(qna_seq);
	         
	         String qna_depth = String.valueOf(Integer.parseInt(qnaInfo.getQna_depth()) + 1);
	         qnaInfo.setQna_depth(qna_depth);

	         qna_no = (String) smc.insert("qna.insertQnaReply", qnaInfo);
	         
	         smc.commitTransaction();
	      }finally{
	    	  smc.endTransaction();
	      }
	      return qna_no;
	   }
	@Override
	public String qnaReplyCheck(String parameter) throws Exception {
		return (String) smc.queryForObject("qna.qnaReplyCheck",parameter);
	}
	@Override
	public void updateQnaHit(String qna_no) throws Exception {
		smc.update("qna.updateQnaHit", qna_no);
	}
}
