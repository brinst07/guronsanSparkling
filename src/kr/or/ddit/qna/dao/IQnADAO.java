package kr.or.ddit.qna.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.QnAVO;

public interface IQnADAO {
	public List<QnAVO> qnaList(Map<String, String> params) throws Exception;
	public String insertQna(QnAVO qnaInfo) throws Exception;
	public QnAVO qnaInfo(Map<String, String> params) throws Exception;

	public void updateQna(QnAVO qnaInfo) throws Exception;
	public void deleteQna(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
	public String insertQnaReply(QnAVO qnaInfo) throws Exception;
	public String qnaReplyCheck(String parameter) throws Exception;
	public void updateQnaHit(String qna_no) throws Exception;
}
