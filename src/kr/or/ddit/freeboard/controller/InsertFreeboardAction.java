package kr.or.ddit.freeboard.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.freeboard.service.FreeboardServiceImpl;
import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.freeboardfile.service.FreeboardFileServiceImpl;
import kr.or.ddit.freeboardfile.service.IFreeboardFileService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.utiles.FileUploadRequestWrapper;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.LibraryFileVO;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;

public class InsertFreeboardAction implements ModelDriven<FreeboardVO>{
	
	private FreeboardVO freeboardInfo;
	private String fileName;
	


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String execute()  throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		List<File> files = this.freeboardInfo.getFiles();
		List<String> contentType = this.freeboardInfo.getFilesContentType();
		List<String> fileNames = this.freeboardInfo.getFilesFileName();
		
		
		IFreeboardService freeboardService = FreeboardServiceImpl.getInstance();
		
		String bo_no = freeboardService.insertFreeboard(freeboardInfo);
		
		List<FreeFileVO> fileItemList = new ArrayList<>();
		
		for(int i = 0; i<files.size(); i++){
			File targetFile = files.get(i);
			if(targetFile.length() > 0){
				
				//파일이 업로드되어 로컬에 저장되는 부분
				File saveFile = new File(GlobalConstant.FILE_PATH,fileNames.get(i));
				
				FileUtils.copyFile(targetFile, saveFile);
				//DB에 파일 정보를 저장하는 부분
				FreeFileVO fileVO = new FreeFileVO();
				
				fileVO.setFreefile_bo_no(bo_no);
				
				String fileName = FilenameUtils.getName(fileNames.get(i));
				
				fileVO.setFreefile_name(fileName);
				
				String baseName = FilenameUtils.getBaseName(fileName);
				
				String extension = FilenameUtils.getExtension(fileName);
				
				this.fileName = URLEncoder.encode(fileNames.get(i),"utf-8");
				
				String genID = UUID.randomUUID().toString().replace("-", "");
				String saveFileName = baseName+genID+"."+extension;
				
				fileVO.setFreefile_save_name(saveFileName);
				
				fileVO.setFreefile_content_type(contentType.get(i));
				
				fileVO.setFreefile_size(String.valueOf(targetFile.length()));
				
				fileItemList.add(fileVO);
				
				
				
				
			}
		}
		IFreeboardFileService service = FreeboardFileServiceImpl.getInstance();
		
		service.insertFreefile(fileItemList);
		return "success";
	}

	@Override
	public FreeboardVO getModel() {
		this.freeboardInfo = new FreeboardVO();
		return this.freeboardInfo;
	}
	
	public String getFileName() {
		return fileName;
	}
	
}
