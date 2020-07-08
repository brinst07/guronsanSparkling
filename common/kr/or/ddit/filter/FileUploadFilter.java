package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.utiles.FileUploadRequestWrapper;

import org.apache.commons.lang3.StringUtils;

public class FileUploadFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		// 클라이언트 요청시 컨텐츠 타입
		//		content type - null
		//					       직접 브라우저의 주소창에 URL 입력 후 요청
		//					   location.href = 'URI'
		//					   location.replace('URI')
		//					   <a href='URI'>유알아이</a>
		//					 - application/x-www-form-urlencoded
		//					   <form action='URI'/>	
		//					   ajax
		//					 - multipart/form-data
		//					   <form action='URI' enctype='multipart/form-data' method='post'/>
		String contentType = servletRequest.getContentType();
		if(StringUtils.isNotEmpty(contentType) &&
				contentType.toLowerCase().contains("multipart")){
			FileUploadRequestWrapper wrapper =
					new FileUploadRequestWrapper((HttpServletRequest)servletRequest);
			chain.doFilter(wrapper, servletResponse);
		}else{
			chain.doFilter(servletRequest, servletResponse);
		}
		
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
