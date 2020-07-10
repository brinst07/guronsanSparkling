package kr.or.ddit.qna.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.QnAVO;

public interface IQnAService {
	public List<QnAVO> qnaList(Map<String, String> params);
	public String insertQna(QnAVO qnaInfo);
	public QnAVO qnaInfo(Map<String, String> params);
	public void updateQna(QnAVO qnaInfo);
	public void deleteQna(Map<String, String> params);
	public String totalCount(Map<String, String> params);
	public String insertQnaReply(QnAVO qnaInfo);
	public String qnaReplyCheck(String parameter);
	public void updateQnaHit(String qna_no);
}
