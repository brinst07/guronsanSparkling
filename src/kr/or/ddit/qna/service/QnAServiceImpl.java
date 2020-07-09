package kr.or.ddit.qna.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.qna.dao.IQnADAO;
import kr.or.ddit.qna.dao.QnADAOImpl;
import kr.or.ddit.qnafile.dao.IQnAFileDAO;
import kr.or.ddit.qnafile.dao.QnAFileDAOImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.QnAFileVO;
import kr.or.ddit.vo.QnAVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class QnAServiceImpl implements IQnAService {
	private static IQnAService service = new QnAServiceImpl();
	private IQnAFileDAO fileDao;
	private IQnADAO dao;
	
	public QnAServiceImpl(){
		dao = QnADAOImpl.getInstance();
		fileDao = QnAFileDAOImpl.getInstance();
	}
	
	public static IQnAService getInstance(){
		return (service == null)? service = new QnAServiceImpl() : service;
	}

	@Override
	public List<QnAVO> qnaList(Map<String, String> params) {
		List<QnAVO> qnaList = null;
		try {
			qnaList = dao.qnaList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qnaList;
	}

	@Override
	public String insertQna(QnAVO qnaInfo) {
		String qna_no = null;
		try {
			qna_no = dao.insertQna(qnaInfo);
			
//			List<QnAFileVO> qnafileList = AttachFileMapper.qnaMapper(items, qna_no);
//			
//			fileDao.insertQnafile(qnafileList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qna_no;
	}

	@Override
	public QnAVO qnaInfo(Map<String, String> params) {
		QnAVO qnaInfo = null;
		try {
			qnaInfo = dao.qnaInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qnaInfo;
	}

	@Override
	public void updateQna(QnAVO qnaInfo) {
		try {
			dao.updateQna(qnaInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteQna(Map<String, String> params) {
		try {
			dao.deleteQna(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = null;
		try {
			totalCount = dao.totalCount(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}


	@Override
	public String insertQnaReply(QnAVO qnaInfo, FileItem[] items) {
		String qna_no = null;
		
		try {
			qna_no = dao.insertQnaReply(qnaInfo);
			
			List<QnAFileVO> qnafileList = AttachFileMapper.qnaMapper(items, qna_no);
			
			fileDao.insertQnafile(qnafileList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qna_no;
	}

	@Override
	public String qnaReplyCheck(String parameter) {
		String check = null;
			try {
				check = dao.qnaReplyCheck(parameter);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return check;
	}

	@Override
	public void updateQnaHit(String qna_no) {
		try {
			dao.updateQnaHit(qna_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
