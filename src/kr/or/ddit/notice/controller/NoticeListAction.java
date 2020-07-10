package kr.or.ddit.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.NoticeVO;

public class NoticeListAction {
	
	private String currentPage;
	private String search_keyword;
	private String search_keycode;
	private List<NoticeVO> noticeList;
	private RolePaginationUtil pagination;
	
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}


	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}


	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}


	public List<NoticeVO> getNoticeList() {
		return noticeList;
	}


	public RolePaginationUtil getPagination() {
		return pagination;
	}


	public String execute(){
		
		HttpServletRequest request = ServletActionContext.getRequest();

		
		if(currentPage == null){
			currentPage = "1";
		}
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		
		
		String totalCount = noticeService.totalCount(params);
		
		pagination = new RolePaginationUtil(request, 
											Integer.parseInt(currentPage),
											Integer.parseInt(totalCount), 10);
		
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));

		noticeList = noticeService.noticeList(params);

		
		

		// content-header
		request.setAttribute("boardlist", "공지사항");
		request.setAttribute("boardhref", "/user/notice/noticeList.do");
		
		
		return "success";
		
	}

}
