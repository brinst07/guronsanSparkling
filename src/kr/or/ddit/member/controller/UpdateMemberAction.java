package kr.or.ddit.member.controller;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.ModelDriven;

public class UpdateMemberAction implements ModelDriven<MemberVO>{
	
	private MemberVO memberInfo;
	
	public String execute(){
		IMemberService service = IMemberServiceImpl.getInstance();
		service.updateMemberInfo(this.memberInfo);
		return "success";
	}

	@Override
	public MemberVO getModel() {
		// 인터셉터 선언 순서를 기초로 실행
		// 인터셉터 ModelDriven 역할
		// 		클라이언트로부터 전송되는 대량의 쿼리스트링을 VO와 맵핑을 하기 위해
		// 		해당 VO의 인스턴스를 ValueStack에 배치.
		// 인터셉터 params의 역할
		//		(action의 default 인터셉터(생략가능))
		//		* 기타 인터셉터와 병행 활용시시에는 생략불가
		//		ValueStack에 배치된 인스턴스화가 완료되어진 VO를 대상으로
		//		쿼리스트링의 값을 주입
		this.memberInfo = new MemberVO();
		return this.memberInfo;
	}
}
