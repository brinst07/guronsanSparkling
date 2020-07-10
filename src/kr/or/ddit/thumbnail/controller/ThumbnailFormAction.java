package kr.or.ddit.thumbnail.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class ThumbnailFormAction {

	public String execute() {

		HttpServletRequest request = ServletActionContext.getRequest();

		// content-header
		request.setAttribute("boardlist", "썸네일게시판");
		request.setAttribute("boardview", "게시글 등록");
		request.setAttribute("boardhref", "/user/thumbnail/thumbnailList.do");
		
		return "success";
	}
}
