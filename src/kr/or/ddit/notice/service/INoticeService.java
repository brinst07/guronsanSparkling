package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.NoticeVO;

public interface INoticeService {
	public List<NoticeVO> noticeList(Map<String, String> params);
	public String insertNotice(NoticeVO noticeInfo, FileItem[] items);
	public NoticeVO noticeInfo(Map<String, String> params);
	public String totalCount(Map<String, String> params);
	public List<NoticeVO> userNoticeList(Map<String, String> params);
	public void updateNotice(NoticeVO noticeInfo);
	public void deleteNotice(Map<String, String> params);



}
