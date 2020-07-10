package kr.or.ddit.qna.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class QnaFormAction {

	public String execute(){
		
		HttpServletRequest request = ServletActionContext.getRequest();

		// content-header
		request.setAttribute("boardlist", "QnA게시판");
		request.setAttribute("boardview", "게시글 등록");
		request.setAttribute("boardhref", "/user/qna/qnaList.do");
		
		
		
		return "success";
	}
}
