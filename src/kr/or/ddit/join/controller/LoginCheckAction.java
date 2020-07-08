package kr.or.ddit.join.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.vo.MemberVO;

import org.apache.struts2.ServletActionContext;
// /StrutsToddler/user/join/loginCheck.do
//		?mem_id=a001&mem_pass=asdfasdf

public class LoginCheckAction {
	// 클라이언트로부터 전송되는 쿼리스트링 취득시 해당 쿼리스트링의 키와 일치하는 전역변수 선언 및 setter
	// 선언하면 setter를 통해서 해당 전역변수 쿼리스트링 값이 주입
	private String mem_id;
	private String mem_pass;
	
	// 액션 클래스에서 View(jsp) 또는 다른 액션 대상의 리다이렉트 처리시 전달되는 값은 전역변수 선언 및 값 할당 후
	// 해당 전역변수의 getter를 통해 ValueStack에 저장 후 스트럿츠 설정파일(리다이렉트 또는 포워딩 처리와 무관) 및 View에서 EL 표기법으로 접근 활용이 가능
	// ValueStack - HttpServletRequest의 확장된 스트럿츠 프레임워크의 저장영역
	//				request.setAttribute() 처리와 동일
	private String message;
	
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
//		HttpServletResponse response = ServletActionContext.getResponse();
		mem_id = CryptoGenerator.decryptRSA(session, mem_id);
		mem_pass = CryptoGenerator.decryptRSA(session, mem_pass);
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("mem_pass", mem_pass);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		
		MemberVO memberInfo = service.memberInfo(params);
		
		
		
		
		
		
		
		
		
		
		if(memberInfo == null){
			this.message = "회원이 아닙니다.";
//			try {
//				//	<![CDATA[/user/join/loginForm.do?message=${message}]]> 같이 사용할떄 사용한다.
//				//this.message = URLEncoder.encode("회원이 아닙니다.","utf-8");
//			} catch (UnsupportedEncodingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			return "loginForm";
		}else if(memberInfo.getMem_id().equals("admin")){
			session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
			return null;
		}else{
			session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
			return "success";
		}
	}
	
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}

	public String getMessage() {
		return message;
	}

}
