package kr.or.ddit.freeboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class FreeboardReplyFormAction {
	public String execute() {
		// content-header
		HttpServletRequest request = ServletActionContext.getRequest();

		request.setAttribute("boardlist", "자유게시판");
		request.setAttribute("boardhref", "/user/freeboard/freeboardList.do");
		request.setAttribute("boardview", "댓글등록");

		return "success";
	}
}
