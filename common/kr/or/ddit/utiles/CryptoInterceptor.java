package kr.or.ddit.utiles;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CryptoInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		Map<String, String> publicKeyMap = CryptoGenerator.generatePairKey(session);
		request.setAttribute("publicKeyMap", publicKeyMap);
		
		// 해당 요청을 처리하는 액션 클래스의 액션 메서드가 호출
		String returnValue = actionInvocation.invoke();
		//return 안하면 정지된다.
		return returnValue;
	}

}
