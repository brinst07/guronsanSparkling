package kr.or.ddit.member.controller;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.ModelDriven;

public class InsertMemberInfo implements ModelDriven<MemberVO> {
	
	private MemberVO vo;
	private String message;
	
	public String execute(){
		IMemberService service = IMemberServiceImpl.getInstance();
		service.insertMember(this.vo);
		this.message = "회원가입이 완료되었습니다.";
		return "success";
	}
	
	public String getMessage() {
		return message;
	}

	public void setVo(MemberVO vo) {
		this.vo = vo;
	}

	@Override
	public MemberVO getModel() {
		
		this.vo = new MemberVO();
		
		return this.vo;
	}

}
