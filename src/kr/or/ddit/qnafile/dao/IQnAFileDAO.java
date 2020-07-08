package kr.or.ddit.qnafile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.QnAFileVO;

public interface IQnAFileDAO {
	public void insertQnafile(List<QnAFileVO> qnafileList) throws Exception;
	public QnAFileVO qnafileInfo(Map<String, String> params) throws Exception;
}
