package kr.or.ddit.join.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class LogoutAction implements Action{
	
	private String message;
	
	public String getMessage() {
		return message;
	}

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.invalidate();
		this.message = URLEncoder.encode("로그아웃되었습니다.","utf-8");
		return SUCCESS;
	}

}
