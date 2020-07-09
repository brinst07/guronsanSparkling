package kr.or.ddit.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.NoticeVO;

public interface INoticeDAO {
	public List<NoticeVO> noticeList(Map<String, String> params) throws Exception;
	public String insertNotice(NoticeVO noticeInfo) throws Exception;
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;

	public List<NoticeVO> userNoticeList(Map<String, String> params) throws Exception;
	public void updateNotice(NoticeVO noticeInfo) throws Exception;
	public void deleteNotice(Map<String, String> params) throws Exception;



}
