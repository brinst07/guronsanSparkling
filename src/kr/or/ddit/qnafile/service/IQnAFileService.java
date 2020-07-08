package kr.or.ddit.qnafile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.QnAFileVO;

public interface IQnAFileService {
	public void insertQnafile(List<QnAFileVO> qnafileList);
	public QnAFileVO qnafileInfo(Map<String, String> params);
}
