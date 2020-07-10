package kr.or.ddit.library.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class LibraryFormAction {

	public String execute() {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("boardlist", "자료실");
		request.setAttribute("boardview", "상세보기");
		request.setAttribute("boardhref", "/user/library/libraryList.do");
		
		return "success";	
	}

	
}
