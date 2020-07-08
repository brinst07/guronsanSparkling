package kr.or.ddit.qnafile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.qna.dao.IQnADAO;
import kr.or.ddit.qna.dao.QnADAOImpl;
import kr.or.ddit.vo.QnAFileVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class QnAFileDAOImpl implements IQnAFileDAO{

	private static IQnAFileDAO dao = new QnAFileDAOImpl();
	private SqlMapClient smc;
	
	private QnAFileDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	
	}
	public static IQnAFileDAO getInstance(){
		return (dao == null) ? dao = new QnAFileDAOImpl() : dao;
	}
	@Override
	public void insertQnafile(List<QnAFileVO> qnafileList) throws Exception{
		try {
			smc.startTransaction();
			
			for(QnAFileVO qnafileInfo : qnafileList){
				smc.insert("qnafile.insertQnafile", qnafileInfo);
			}
			
			smc.commitTransaction();
		}finally{
			smc.endTransaction();
		}
	}
	@Override
	public QnAFileVO qnafileInfo(Map<String, String> params) throws Exception{
		return (QnAFileVO) smc.queryForObject("qnafile.qnafileInfo", params);
	}
}
