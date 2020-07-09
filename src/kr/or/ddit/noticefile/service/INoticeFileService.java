package kr.or.ddit.noticefile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeFileVO;

public interface INoticeFileService {
	public void insertNoticefile(List<NoticeFileVO> noticefileList);
	public NoticeFileVO noticefileInfo(Map<String, String> params);
}
