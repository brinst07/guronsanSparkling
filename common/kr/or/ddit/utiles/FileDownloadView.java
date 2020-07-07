package kr.or.ddit.utiles;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import kr.or.ddit.global.GlobalConstant;
//파일 다운로드 처리 jsp 내
//FileDownloadView.fileDownload(pageContext, "a.png");

public class FileDownloadView {
	public static void fileDownload(PageContext pageContext,String realName, String donwloadFileName)throws IOException{
		HttpServletResponse response = (HttpServletResponse) pageContext.getResponse();
		JspWriter out = pageContext.getOut();
		
		File downloadFile = new File(GlobalConstant.FILE_PATH,donwloadFileName);
		
		if(downloadFile.exists()){
			realName = URLEncoder.encode(realName, "UTF-8");
			
			response.setHeader("Content-Disposition", "attachment;fileName=" + realName);
			response.setContentType("application.octet-stream");
			
			response.setContentLength((int)downloadFile.length());
			
			// jsp 요청시 해당 jsp는 servlet 클래스로 천이(자스퍼 엔진)
			// jsp는 out이 존재하고 , servlet 클래스 내 PrintWriter 상속받은 JspWriter 가 존재하며, 
			// out 기본객체의 OutputStream 초기화(JSP 파일 내 다운로드 처리시만 선언)
			
			byte[] buffer = new byte[(int)downloadFile.length()];
			
			BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(downloadFile));
			
			BufferedOutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			
			int readCnt = 0;
			while((readCnt = inputStream.read(buffer))!= -1){
				outputStream.write(buffer);
			}
			
			inputStream.close();
			outputStream.close();
			
		}
	}
}
