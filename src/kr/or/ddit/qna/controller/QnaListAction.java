package kr.or.ddit.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.qna.service.IQnAService;
import kr.or.ddit.qna.service.QnAServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.QnAVO;

public class QnaListAction {
	private String currentPage;
	private String search_keyword;
	private String search_keycode;
	private List<QnAVO> qnaList;
	private RolePaginationUtil pagination;

	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();

		if (currentPage == null) {
			currentPage = "1";
		}

		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);

		IQnAService qnaService = QnAServiceImpl.getInstance();

		String totalCount = qnaService.totalCount(params);
		pagination = new RolePaginationUtil(request,
				Integer.parseInt(currentPage), Integer.parseInt(totalCount), 10);

		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));

		qnaList = qnaService.qnaList(params);
		request.setAttribute("boardtitle", "QnA게시판");

		
		
		
		// content-header
		request.setAttribute("boardlist", "QnA게시판");
		request.setAttribute("boardhref", "/user/qna/qnaList.do");

		return "success";
	}

	public List<QnAVO> getQnaList() {
		return qnaList;
	}

	public RolePaginationUtil getPagination() {
		return pagination;
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
}
