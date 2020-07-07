package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;

public class MemberViewAction implements Action{

	private String mem_id;
	private MemberVO member;
	

	@Override
	public String execute() throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("mem_id", this.mem_id);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		
		member = service.memberInfo(params);
		
		return SUCCESS;
		
	}
	

	
	public MemberVO getMember() {
		return member;
	}



	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
}
