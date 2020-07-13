package kr.or.ddit.library.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class LibraryReplyFormAction {
	public String execute() {
		// content-header
		HttpServletRequest request = ServletActionContext.getRequest();

		request.setAttribute("boardlist", "자료실");
		request.setAttribute("boardhref", "/user/library/libraryList.do");
		request.setAttribute("boardview", "댓글등록");

		return "success";
	}
}
