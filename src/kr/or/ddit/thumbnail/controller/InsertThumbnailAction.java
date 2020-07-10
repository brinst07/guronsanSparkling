package kr.or.ddit.thumbnail.controller;

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
import kr.or.ddit.thumbnail.service.IThumbnailService;
import kr.or.ddit.thumbnail.service.ThumbnailServiceImpl;
import kr.or.ddit.thumbnailfile.service.IThumbnailFileService;
import kr.or.ddit.thumbnailfile.service.ThumbnailFileServiceImpl;
import kr.or.ddit.utiles.FileUploadRequestWrapper;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.LibraryFileVO;
import kr.or.ddit.vo.ThumbnailFileVO;
import kr.or.ddit.vo.ThumbnailVO;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;

public class InsertThumbnailAction implements ModelDriven<ThumbnailVO>{
	
	private ThumbnailVO thumbnailInfo;
	private String fileName;
	


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String execute()  throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		List<File> files = this.thumbnailInfo.getFiles();
		List<String> contentType = this.thumbnailInfo.getFilesContentType();
		List<String> fileNames = this.thumbnailInfo.getFilesFileName();
		
		
		IThumbnailService thumbnailservice = ThumbnailServiceImpl.getInstance();
		String bo_no = thumbnailservice.insertThumbnail(thumbnailInfo);
		
		List<ThumbnailFileVO> fileItemList = new ArrayList<>();
		
		for(int i = 0; i<files.size(); i++){
			File targetFile = files.get(i);
			if(targetFile.length() > 0){
				
				//파일이 업로드되어 로컬에 저장되는 부분
				File saveFile = new File(GlobalConstant.FILE_PATH,fileNames.get(i));
				
				FileUtils.copyFile(targetFile, saveFile);
				//DB에 파일 정보를 저장하는 부분
				ThumbnailFileVO fileVO = new ThumbnailFileVO();
				
				fileVO.setThumbfile_thumbnail_no(bo_no);
				
				String fileName = FilenameUtils.getName(fileNames.get(i));
				
				fileVO.setThumbfile_name(fileName);
				
				String baseName = FilenameUtils.getBaseName(fileName);
				
				String extension = FilenameUtils.getExtension(fileName);
				
				this.fileName = URLEncoder.encode(fileNames.get(i),"utf-8");
				
				String genID = UUID.randomUUID().toString().replace("-", "");
				String saveFileName = baseName+genID+"."+extension;
				
				fileVO.setThumbfile_save_name(saveFileName);
				
				fileVO.setThumbfile_content_type(contentType.get(i));
				
				fileVO.setThumbfile_size(String.valueOf(targetFile.length()));
				
				fileItemList.add(fileVO);
			}
		}
		IThumbnailFileService service = ThumbnailFileServiceImpl.getInstance();
		service.insertThumbnailfile(fileItemList);
		
		
		
		return "success";
	}


	public String getFileName() {
		return fileName;
	}

	@Override
	public ThumbnailVO getModel() {
		this.thumbnailInfo = new ThumbnailVO();
		return this.thumbnailInfo;
	}
	
}
