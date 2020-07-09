package kr.or.ddit.qna.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.qna.service.IQnAService;
import kr.or.ddit.qna.service.QnAServiceImpl;
import kr.or.ddit.qnafile.service.IQnAFileService;
import kr.or.ddit.qnafile.service.QnAFileServiceImpl;
import kr.or.ddit.vo.QnAFileVO;
import kr.or.ddit.vo.QnAVO;

import com.opensymphony.xwork2.ModelDriven;

public class InsertQnaAction implements ModelDriven<QnAVO>{
	private QnAVO qnaInfo;
	private String fileName;
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		List<File> files = this.qnaInfo.getFiles();
		List<String> contentType = this.qnaInfo.getFilesContentType();
		List<String> fileNames = this.qnaInfo.getFilesFileName();
		
		IQnAService qnaService = QnAServiceImpl.getInstance();
		
		String qna_no = qnaService.insertQna(qnaInfo);
		
		List<QnAFileVO> fileItemList = new ArrayList<>();
		
		for(int i = 0; i<files.size(); i++){
			File targetFile = files.get(i);
			if(targetFile.length() > 0){
				File saveFile = new File(GlobalConstant.FILE_PATH, fileNames.get(i));
				FileUtils.copyFile(targetFile, saveFile);
				
				QnAFileVO fileVO = new QnAFileVO();
				
				fileVO.setQnafile_qna_no(qna_no);
				
				String fileName = FilenameUtils.getName(fileNames.get(i));
				
				fileVO.setQnafile_name(fileName);
				
				String baseName = FilenameUtils.getBaseName(fileName);
				
				String extension = FilenameUtils.getExtension(fileName);
				
				this.fileName = URLEncoder.encode(fileNames.get(i),"utf-8");
				
				String genID = UUID.randomUUID().toString().replace("-", "");
				String saveFileName = baseName+genID+"."+extension;
				
				fileVO.setQnafile_save_name(saveFileName);
				fileVO.setQnafile_content_type(contentType.get(i));
				fileVO.setQnafile_size(String.valueOf(targetFile.length()));
				fileItemList.add(fileVO);
				
			}
			
		}
		IQnAFileService service = QnAFileServiceImpl.getInstance();
		
		service.insertQnafile(fileItemList);
		return "success";
		
	}
	
	@Override
	public QnAVO getModel() {
		qnaInfo = new QnAVO();
		
		return qnaInfo;
	}


	public String getFileName() {
		return fileName;
	}

}
