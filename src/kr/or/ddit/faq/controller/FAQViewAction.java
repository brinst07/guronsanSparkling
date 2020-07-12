package kr.or.ddit.faq.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.faq.service.FAQServiceImpl;
import kr.or.ddit.faq.service.IFAQService;
import kr.or.ddit.vo.FAQVO;

import com.opensymphony.xwork2.Action;

public class FAQViewAction implements Action {

	private String faq_no;

	private FAQVO faqInfo;
	
	private String search_keycode;
	
	private String search_keyword;
	


	@Override
	public String execute() throws Exception {

		IFAQService service = FAQServiceImpl.getInstance();

		Map<String, String> params = new HashMap<String, String>();

		params.put("faq_no", faq_no);

		service.updateFAQhit(params);

		this.faqInfo = service.faqInfo(params);

		// content-header
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("boardlist", "자주하는질문게시판");
		request.setAttribute("boardview", "상세보기");
		request.setAttribute("boardhref", "/user/faq/faqList.do");

		return SUCCESS;
	}

	public FAQVO getFaqInfo() {
		return faqInfo;
	}

	public void setFaq_no(String faq_no) {
		this.faq_no = faq_no;
	}

	public String getSearch_keycode() {
		return search_keycode;
	}
	
	public String getSearch_keyword() {
		return search_keyword;
	}
	
	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}
	
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	
}
