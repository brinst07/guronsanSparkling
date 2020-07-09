package kr.or.ddit.noticefile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.NoticeFileVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class NoticeFileDAOImpl implements INoticeFileDAO{
	private static INoticeFileDAO dao = new NoticeFileDAOImpl();
	private SqlMapClient smc;
	
	private NoticeFileDAOImpl(){
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static INoticeFileDAO getInstance(){
		return (dao == null) ? dao = new NoticeFileDAOImpl() : dao;
	}

	@Override
	public void insertNoticefile(List<NoticeFileVO> noticefileList)
			throws Exception {
		try{
			smc.startTransaction();
			
			for(NoticeFileVO noticefileInfo : noticefileList){
				smc.insert("noticefile.insertNoticefile", noticefileInfo);
			}
			
			smc.commitTransaction();
		}finally{
			smc.endTransaction();
		}
		
	}

	@Override
	public NoticeFileVO noticefileInfo(Map<String, String> params)
			throws Exception {
		return (NoticeFileVO) smc.queryForObject("noticefile.noticefileInfo", params);

	}
}
