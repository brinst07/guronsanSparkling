package kr.or.ddit.freeboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class FreeboardFormAction {

	public String execute() {

		HttpServletRequest request = ServletActionContext.getRequest();

		// content-header
		request.setAttribute("boardlist", "자유게시판");
		request.setAttribute("boardview", "게시글 등록");
		request.setAttribute("boardhref", "/user/freeboard/freeboardList.do");
		
		return "success";
	}
}
