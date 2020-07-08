package kr.or.ddit.faq.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.faq.service.FAQServiceImpl;
import kr.or.ddit.faq.service.IFAQService;

import com.opensymphony.xwork2.Action;

public class DeleteFAQAction implements Action {
	
	private String faq_no;
	
	@Override
	public String execute() throws Exception {
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("faq_no", faq_no);
		
		IFAQService service = FAQServiceImpl.getInstance();
		
		service.deleteFAQ(params);
		
		return SUCCESS;
	}

	public void setFaq_no(String faq_no) {
		this.faq_no = faq_no;
	}

}
