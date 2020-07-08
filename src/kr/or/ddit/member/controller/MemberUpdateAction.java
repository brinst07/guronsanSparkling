package kr.or.ddit.member.controller;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class MemberUpdateAction implements ModelDriven<MemberVO> , Action{
	
	private MemberVO vo;
	private String message;
	

	@Override
	public String execute() throws Exception {
		IMemberService service = IMemberServiceImpl.getInstance();
		
		int count = service.updateAdminMember(vo);
		
		if(count>0){
			this.message = "성공적으로 수정되었습니다.";
		}else{
			this.message = "성공에 실패하였습니다.";
		}
		
		return SUCCESS;
	}

	@Override
	public MemberVO getModel() {
		this.vo = new MemberVO();
		return vo;
	}
	
	public String getMessage() {
		return message;
	}
	
}
