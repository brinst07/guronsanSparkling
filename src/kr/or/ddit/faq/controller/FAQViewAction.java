package kr.or.ddit.faq.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.faq.service.FAQServiceImpl;
import kr.or.ddit.faq.service.IFAQService;
import kr.or.ddit.vo.FAQVO;

import com.opensymphony.xwork2.Action;

public class FAQViewAction implements Action {
	
	private String faq_no;
	
	private FAQVO faqInfo;
	
	@Override
	public String execute() throws Exception {
		
		IFAQService service = FAQServiceImpl.getInstance();
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("faq_no", faq_no);
		
		this.faqInfo = service.faqInfo(params);
		
		return SUCCESS;
	}

	public FAQVO getFaqInfo() {
		return faqInfo;
	}

	public void setFaq_no(String faq_no) {
		this.faq_no = faq_no;
	}

}
