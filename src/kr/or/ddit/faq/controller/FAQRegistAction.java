package kr.or.ddit.faq.controller;

import kr.or.ddit.faq.service.FAQServiceImpl;
import kr.or.ddit.faq.service.IFAQService;
import kr.or.ddit.vo.FAQVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class FAQRegistAction implements ModelDriven<FAQVO>, Action {

	private FAQVO vo;
	
	private String message;
	
	@Override
	public String execute() throws Exception {
		
		IFAQService service = FAQServiceImpl.getInstance();
		
		service.insertFAQ(vo);
		
		this.message = "성공적으로 입력되었습니다.";
		
		return SUCCESS;
	}

	public String getMessage() {
		return message;
	}

	@Override
	public FAQVO getModel() {
		vo = new FAQVO();
		return vo;
	}

}
