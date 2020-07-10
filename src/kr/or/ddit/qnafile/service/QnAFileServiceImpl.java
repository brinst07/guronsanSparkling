package kr.or.ddit.qnafile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.qna.dao.IQnADAO;
import kr.or.ddit.qna.dao.QnADAOImpl;
import kr.or.ddit.qna.service.IQnAService;
import kr.or.ddit.qna.service.QnAServiceImpl;
import kr.or.ddit.qnafile.dao.IQnAFileDAO;
import kr.or.ddit.qnafile.dao.QnAFileDAOImpl;
import kr.or.ddit.vo.QnAFileVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class QnAFileServiceImpl implements IQnAFileService{
	
	private static IQnAFileService service = new QnAFileServiceImpl();
	private IQnAFileDAO dao;
	
	public QnAFileServiceImpl(){
		dao = QnAFileDAOImpl.getInstance();
	}
	
	public static IQnAFileService getInstance(){
		return (service == null)? service = new QnAFileServiceImpl() : service;
	}

	@Override
	public void insertQnafile(List<QnAFileVO> qnafileList) {
		try {
			dao.insertQnafile(qnafileList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public QnAFileVO qnafileInfo(Map<String, String> params) {
		QnAFileVO qnafileInfo = null;
		
		try {
			qnafileInfo = dao.qnafileInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qnafileInfo;
	}
}
