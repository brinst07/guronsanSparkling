package kr.or.ddit.noticefile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeFileVO;

public interface INoticeFileDAO {
	public void insertNoticefile(List<NoticeFileVO> noticefileList) throws Exception;
	public NoticeFileVO noticefileInfo(Map<String, String> params) throws Exception;
}
