package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberViewAction {
	// /StrutsToddler/user/member/memberView.do?mem_id=a001
	private String mem_id;
	private MemberVO memberInfo;

	public String memberView(){
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", this.mem_id);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		this.memberInfo = service.memberInfo(params);
		
		return "success";
	}
	
	public MemberVO getMemberInfo() {
		return memberInfo;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
}
