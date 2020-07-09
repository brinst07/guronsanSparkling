package kr.or.ddit.member.controller;

import com.opensymphony.xwork2.Action;

public class MemberMailAction implements Action {
	
	private String selects;
	private String message;
	
	@Override
	public String execute() throws Exception {
		
		
		
		return null;
	}

	public void setSelects(String selects) {
		this.selects = selects;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
