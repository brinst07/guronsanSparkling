package kr.or.ddit.notice.controller;

import java.lang.reflect.InvocationTargetException;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.vo.NoticeVO;


public class UpdateNoticeAction {
	
	private NoticeVO noticeInfo;
	
	public String execute() {


		INoticeService service = NoticeServiceImpl.getInstance();
		service.updateNotice(this.noticeInfo);
		
		return "success";
		
	}

	public NoticeVO getNoticeInfo() {
		this.noticeInfo = new NoticeVO();
		return this.noticeInfo;
	}
	
	

}
