package kr.or.ddit.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.views.util.TextUtil;

import kr.or.ddit.faq.service.FAQServiceImpl;
import kr.or.ddit.faq.service.IFAQService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.FAQVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.util.TextUtils;

public class FAQListAction implements Action{
	
	private List<FAQVO> faqList;
	
	private String currentPage;
	
	private String pagination;
	
	private String search_keyword;
	
	private String search_keycode;

	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
				
		if(this.currentPage == null){
			currentPage = "1";
		}
		
		IFAQService service = FAQServiceImpl.getInstance();
		
		Map<String, String> params = new HashMap<String,String>();
		
		if(StringUtils.isEmpty(search_keycode)){
			params.put("search_keycode", String.valueOf(session.getAttribute("search_keycode")));
			
			params.put("search_keyword", String.valueOf(session.getAttribute("search_keyword")));
		}else{
			
			params.put("search_keycode", this.search_keycode);
			
			params.put("search_keyword", this.search_keyword);			
		}
		
		int totalCount = Integer.parseInt(service.totalCount(params));		
		
		int count = 10;
		
		RolePaginationUtil pagination = new RolePaginationUtil(request, Integer.parseInt(currentPage), totalCount, count);
		
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		
		this.faqList = service.FAQList(params);
		
		this.pagination = pagination.getPagingHtmls();
		
		request.setAttribute("boardtitle", "자주하는질문");
		
		
		session.setAttribute("search_keyword", params.get("search_keyword"));
		
		session.setAttribute("search_keycode", params.get("search_keycode"));
		
		return SUCCESS;
	}

	public List<FAQVO> getFaqList() {
		return faqList;
	}
	
	public String getPagination() {
		return pagination;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearch_keyword() {
		return search_keyword;
	}

	public String getSearch_keycode() {
		return search_keycode;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}
		
	
}
