package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;

import com.opensymphony.xwork2.Action;

public class DeleteMemberAction implements Action{

	private String mem_id;
	private String message;

	@Override
	public String execute() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", this.mem_id);
		IMemberService service = IMemberServiceImpl.getInstance();
		service.deleteMemberInfo(params);
		this.message = "true";
		return "success";
	}
	
	public String getMessage() {
		return message;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
}
