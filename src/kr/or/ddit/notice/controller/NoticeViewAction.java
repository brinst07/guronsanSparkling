package kr.or.ddit.notice.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.vo.NoticeVO;

public class NoticeViewAction {
	
	private String notice_no;
	private NoticeVO noticeInfo;
	
	public String execute(){
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("notice_no", notice_no);
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		noticeInfo = noticeService.noticeInfo(params);
		
		return "success";
		
	}

	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}

	public NoticeVO getNoticeInfo() {
		return noticeInfo;
	}

}
