package kr.or.ddit.notice.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;

public class DeleteNoticeAction {
	
	private String notice_no;
	
	public String execute() {
				
		Map<String, String> params = new HashMap<String, String>();
		INoticeService service = NoticeServiceImpl.getInstance();
		
		params.put("notice_no", notice_no);

		service.deleteNotice(params);
		
		return "success";
		
	}

	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}

}
