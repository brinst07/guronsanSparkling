package kr.or.ddit.library.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.library.service.ILibraryService;
import kr.or.ddit.library.service.LibraryServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.LibraryVO;

public class LibraryListAction {

	private String currentPage;
	private String search_keycode;
	private String search_keyword;
	private String count;
	private RolePaginationUtil pagination;
	private List<LibraryVO> libraryList;
	private String pagingHTML;

	public String execute() {

		HttpServletRequest request = ServletActionContext.getRequest();

		ILibraryService service = LibraryServiceImpl.getInstance();

		if (currentPage == null) {
			currentPage = "1";
		}

		if (count == null) {
			count = "10";
		}
		int totalCount = service.libraryCount();

		pagination = new RolePaginationUtil(request,
				Integer.parseInt(currentPage), totalCount, 10);
		// 한페이지에 몇개의 게시물을 출력할 것인지

		// pagination.setBlockCount(Integer.parseInt(count));

		Map<String, String> params = new HashMap<String, String>();
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);

		libraryList = service.libraryList(params);
		pagingHTML = pagination.getPagingHtmls();
		request.setAttribute("boardtitle", "자료실");

		// content-header
		request.setAttribute("boardlist", "자료실");
		request.setAttribute("boardhref", "/user/library/libraryList.do");

		return "success";

	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public RolePaginationUtil getPagination() {
		return pagination;
	}

	public List<LibraryVO> getLibraryList() {
		return libraryList;
	}

	public String getPagingHTML() {
		return pagingHTML;
	}

}
