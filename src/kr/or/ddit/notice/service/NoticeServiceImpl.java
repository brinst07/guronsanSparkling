package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.freeboardfile.dao.IFreeboardFileDAO;
import kr.or.ddit.notice.dao.INoticeDAO;
import kr.or.ddit.notice.dao.NoticeDAOImpl;
import kr.or.ddit.noticefile.dao.INoticeFileDAO;
import kr.or.ddit.noticefile.dao.NoticeFileDAOImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService{
	private static INoticeService service = new NoticeServiceImpl();
	private INoticeDAO dao;
	private INoticeFileDAO noticefileDao; 
	private NoticeServiceImpl(){
		dao = NoticeDAOImpl.getInstance();
		noticefileDao = NoticeFileDAOImpl.getInstance();
	}
	
	public static INoticeService getInstance(){
		return (service == null) ? service = new NoticeServiceImpl() : service;
	}




	@Override
	public NoticeVO noticeInfo(Map<String, String> params) {
		NoticeVO noticeInfo = null;
		
		try {
			noticeInfo = dao.noticeInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticeInfo;
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = null;
		try {
			totalCount = dao.totalCount(params);
		} catch (Exception e){
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public List<NoticeVO> userNoticeList(Map<String, String> params) {
		List<NoticeVO> noticeList = null;
		try {
			noticeList = dao.userNoticeList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return noticeList;
	}

	@Override
	public void updateNotice(NoticeVO noticeInfo) {

		try {
			dao.updateNotice(noticeInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteNotice(Map<String, String> params) {
		try {
			dao.deleteNotice(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	@Override
	public List<NoticeVO> noticeList(Map<String, String> params) {
		List<NoticeVO> noticeList = null;
		
		try {
			noticeList = dao.noticeList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return noticeList;
	}

	@Override
	public String insertNotice(NoticeVO noticeInfo) {
		String notice_no = null;
		
		try {
			notice_no = dao.insertNotice(noticeInfo);
			
//			List<NoticeFileVO> noticefileList = AttachFileMapper.noticemapper(items, notice_no);
//			noticefileDao.insertNoticefile(noticefileList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return notice_no;
	}
	

	
	
}
