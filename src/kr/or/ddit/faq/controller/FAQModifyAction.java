package kr.or.ddit.faq.controller;

import kr.or.ddit.faq.service.FAQServiceImpl;
import kr.or.ddit.faq.service.IFAQService;
import kr.or.ddit.vo.FAQVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class FAQModifyAction implements ModelDriven<FAQVO>, Action {
	
	private FAQVO vo;
	
	@Override
	public String execute() throws Exception {
		
		IFAQService service = FAQServiceImpl.getInstance();
		
		service.updateFAQ(vo);
		
		return SUCCESS;
	}

	@Override
	public FAQVO getModel() {
		this.vo = new FAQVO();
		return vo;
	}

}
