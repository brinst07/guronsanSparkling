package kr.or.ddit.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class LogoutAction implements Action {

	@Override
	public String execute() throws Exception {
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		session.invalidate();
		
		return SUCCESS;
	}

}
