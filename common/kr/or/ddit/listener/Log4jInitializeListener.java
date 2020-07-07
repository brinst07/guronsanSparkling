package kr.or.ddit.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import kr.or.ddit.utiles.Log4jInitialize;

// 검색해서 설명 보충
// ServletContextAttributeListener : 값을 전달하거나 저장할때 지시자
// ServletContextListener : 생성/GC 될때 지시자

public class Log4jInitializeListener implements
		ServletContextAttributeListener, ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// 서버시작하자마자 Applcation객체가 하나씩 만들어짐 ddit와 servletToddler에 그때 발생한다.
		System.out.println("Application(ServletContent) 최초 인스턴스 시 전파되는 이벤트 청취자 콜백 리스너");
		
		Log4jInitialize.init();
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("Application(ServletContent) GC되기 직전 전파되는 이벤트 청취자 콜백 리스너");

	}


	@Override
	public void attributeAdded(ServletContextAttributeEvent event) {
		System.out.println("application.setAttribute(키,값) 저장시 전파되는 이벤트 청취자 리스너");
		ServletContext application = event.getServletContext();
		
		//application.setAttribute(키,값)
		String key = event.getName();
		Object value = event.getValue();
		
		
	}

	@Override
	public void attributeRemoved(ServletContextAttributeEvent event) {
		System.out.println("application.removeAttribute(키) 삭제시 전파되는 이벤트 청취자 리스너");
		
	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent event) {
		System.out.println("application.setAttribute(기존 동일키, 상이값) 갱신 시 전파되는 이벤트 청취자 리스너");

	}

}
