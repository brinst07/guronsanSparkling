package kr.or.ddit.listener;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

public class CustomServletRequestListener implements
		ServletRequestAttributeListener, ServletRequestListener {

	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {
		// HttpServletRequest가 GC되기 전에 전파되는 이벤트 청취자 리스너
		// 서버의 클라이언트 요청에 따른 응답 처리 완료 시 HttpServletReqeust가 GC됨.

	}

	@Override
	public void requestInitialized(ServletRequestEvent arg0) {
		// HttpServletRequest가 인스턴스될때마다 전파되는 이벤트 청취자 리스너
		// 클라이언트의 요청이 웹 애플리케이션 서버에 전달때 마다 시점에 인스턴스화.

	}

	@Override
	public void attributeAdded(ServletRequestAttributeEvent arg0) {
		// HttpServletRequest.setAttribute(키, 값) 저장 시 마다 전파되는 이벤트 청취자.

	}

	@Override
	public void attributeRemoved(ServletRequestAttributeEvent arg0) {
		//  HttpServletRequest.setAttribute(키) 삭제 시 마다 전파되는 이벤트 청취자.

	}

	@Override
	public void attributeReplaced(ServletRequestAttributeEvent arg0) {
		// HttpServletRequest.setAttribute(기존 동일키, 상이값) 갱신 시 마다 전파되는 이벤트 청취자.
	}

}
