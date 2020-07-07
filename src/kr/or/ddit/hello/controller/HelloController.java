package kr.or.ddit.hello.controller;

// 커맨드 디자인 패턴이 적용된 커맨드 컨트롤러 
// Struts 프레임워크 : 액션 클래스
public class HelloController {
	// 스트러츠 프레임워크 : 액션 메서드
	// 반환값 : <action>
	//				<result name="액션 메서드의 반환값과 맵핑되는 값">
	// 반환값이 view를 결정한다.
	public String execute(){
		System.out.println("HelloController의 execute() 콜백");
//		if(true){
//			return "success";
//		}else{
//			return "login";
//		}
			return "success";
	}
}
