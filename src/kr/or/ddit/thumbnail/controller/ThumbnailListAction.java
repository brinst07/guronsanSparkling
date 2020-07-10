package kr.or.ddit.thumbnail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.thumbnail.service.IThumbnailService;
import kr.or.ddit.thumbnail.service.ThumbnailServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.ThumbnailVO;

public class ThumbnailListAction {
	private String currentPage;
	private String search_keyword;
	private String search_keycode;
	private List<ThumbnailVO> thumbnailList;
	private RolePaginationUtil pagination;
	
	
	public String execute(){		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		if(currentPage == null){
			currentPage = "1";
		}
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
			
		IThumbnailService thumbnailService = ThumbnailServiceImpl.getInstance();
		
		String totalCount = thumbnailService.totalCount(params);
		
		pagination = new RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount),10);
		
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		
		
		thumbnailList = thumbnailService.thumbnailList(params);
		request.setAttribute("boardtitle", "썸네일게시판");
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

	public List<ThumbnailVO> getThumbnailList() {
		return thumbnailList;
	}

	public RolePaginationUtil getPagination() {
		return pagination;
	}

	
}
