package kr.or.ddit.noticefile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.noticefile.dao.INoticeFileDAO;
import kr.or.ddit.noticefile.dao.NoticeFileDAOImpl;
import kr.or.ddit.vo.NoticeFileVO;

public class NoticeFileServiceImpl implements INoticeFileService{
	private static INoticeFileService service = new NoticeFileServiceImpl();
	private INoticeFileDAO dao;
	
	private NoticeFileServiceImpl(){
		dao = NoticeFileDAOImpl.getInstance();
	}
	
	public static INoticeFileService getInstance(){
		return (service == null) ? service = new NoticeFileServiceImpl() : service;
	}

	@Override
	public void insertNoticefile(List<NoticeFileVO> noticefileList) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public NoticeFileVO noticefileInfo(Map<String, String> params) {
		NoticeFileVO noticefileInfo = null;
		
		try {
			noticefileInfo = dao.noticefileInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return noticefileInfo;
	}
}
