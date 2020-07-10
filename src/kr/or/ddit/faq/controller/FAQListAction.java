package kr.or.ddit.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.faq.service.FAQServiceImpl;
import kr.or.ddit.faq.service.IFAQService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.FAQVO;

import com.opensymphony.xwork2.Action;

public class FAQListAction implements Action{
	
	private List<FAQVO> faqList;
	
	private String currentPage;
	
	private String pagination;

	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		request.setCharacterEncoding("UTF-8");
		
		if(this.currentPage == null){
			currentPage = "1";
		}
		
		IFAQService service = FAQServiceImpl.getInstance();
		
		Map<String, String> params = new HashMap<String,String>();
		
		Map<String, String[]> mapobject = request.getParameterMap();
		
		for (String mapkey : mapobject.keySet()){
	        String[] list = mapobject.get(mapkey);
	        params.put(mapkey, list[0]);
	    }
				
		int totalCount = Integer.parseInt(service.totalCount(params));		
		
		int count = 10;
		
		RolePaginationUtil pagination = new RolePaginationUtil(request, Integer.parseInt(currentPage), totalCount, count);
		
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		
		this.faqList = service.FAQList(params);
		
		this.pagination = pagination.getPagingHtmls();
		request.setAttribute("boardtitle", "자주하는질문");

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
		
}
