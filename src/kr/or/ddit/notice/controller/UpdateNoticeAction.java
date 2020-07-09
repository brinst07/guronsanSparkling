package kr.or.ddit.notice.controller;

import java.lang.reflect.InvocationTargetException;

import com.opensymphony.xwork2.ModelDriven;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.vo.LibraryVO;
import kr.or.ddit.vo.NoticeVO;


public class UpdateNoticeAction implements ModelDriven<NoticeVO>{
	
	private NoticeVO noticeInfo;
	
	public String execute() {


		INoticeService service = NoticeServiceImpl.getInstance();
		service.updateNotice(this.noticeInfo);
		
		return "success";
		
	}

	@Override
	public NoticeVO getModel() {
		this.noticeInfo = new NoticeVO();
		return this.noticeInfo;
	}




	

}
