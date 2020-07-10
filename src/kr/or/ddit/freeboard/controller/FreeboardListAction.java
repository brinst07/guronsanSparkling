package kr.or.ddit.freeboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.sun.net.httpserver.Authenticator.Success;

import kr.or.ddit.freeboard.service.FreeboardServiceImpl;
import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.FreeboardVO;

public class FreeboardListAction {
	
	private String currentPage;
	private String search_keyword;
	private String search_keycode;
	private List<FreeboardVO> freeboardList;
	private RolePaginationUtil pagination;

	
	public String execute() {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		

		if (currentPage == null) {
			currentPage = "1";
		}

		

		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);

		IFreeboardService freeService = FreeboardServiceImpl.getInstance();

		String totalCount = freeService.totalCount(params);
		pagination = new RolePaginationUtil(request,
				Integer.parseInt(currentPage), Integer.parseInt(totalCount),10);

		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));

		freeboardList = freeService.freeboardList(params);	
		request.setAttribute("boardtitle", "자유게시판");
		return "success";
	
	}



	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}



	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}



	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}



	public List<FreeboardVO> getFreeboardList() {
		return freeboardList;
	}



	public RolePaginationUtil getPagination() {
		return pagination;
	}
}