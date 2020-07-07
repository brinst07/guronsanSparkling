package kr.or.ddit.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.MemberVO;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class FileAction implements Action,ModelDriven<MemberVO> {

	// interceptor-ref = "fileUpload"
	// 클라이언트로부터 전송되는 폼필드(mem_id, mem_pass, mem_name) 와
	// 전송되는 파일을 MultipartRequestWrapper 자원을 활용가능
	
	private MemberVO memberInfo;
	private String fileName;
	
	@Override
	public String execute() throws Exception {
		
		MultiPartRequestWrapper wrapper = (MultiPartRequestWrapper) ServletActionContext.getRequest();
		
//		String mem_id = wrapper.getParameter("mem_id");
//		String mem_pass = wrapper.getParameter("mem_pass");
//		String mem_name = wrapper.getParameter("mem_name");
//		
//		File[] files = wrapper.getFiles("files");
//		String[] contentTypes = wrapper.getContentTypes("files");
//		String[] fileNames = wrapper.getFileNames("files");
		
		List<File> files = this.memberInfo.getFiles();
		List<String> contentType = this.memberInfo.getFilesContentType();
		List<String> fileNames = this.memberInfo.getFilesFileName();
		
		for(int i = 0; i<files.size(); i++){
			File targetFile = files.get(i);
			if(targetFile.length() > 0){
				File saveFile = new File(GlobalConstant.FILE_PATH,fileNames.get(i));
				
				FileUtils.copyFile(targetFile, saveFile);
				this.fileName = URLEncoder.encode(fileNames.get(i),"utf-8");
			}
		}
		
		return SUCCESS;
	}

	@Override
	public MemberVO getModel() {
		this.memberInfo = new MemberVO();
		return this.memberInfo;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileName() {
		return fileName;
	}
	
	private String contentDisposition;
	private long contentLength;
	private InputStream inputStream;
	
	public String getContentDisposition() {
		return contentDisposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public String fileDownload(){
		File downloadFile = new File(GlobalConstant.FILE_PATH, this.fileName);
		this.contentDisposition = "attachment;fileName=" + this.fileName;
		this.contentLength = downloadFile.length();
		
		try {
			this.inputStream = new FileInputStream(downloadFile);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "success";
	}
}
