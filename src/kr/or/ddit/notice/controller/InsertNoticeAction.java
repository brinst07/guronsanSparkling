package kr.or.ddit.notice.controller;

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
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.noticefile.service.INoticeFileService;
import kr.or.ddit.noticefile.service.NoticeFileServiceImpl;
import kr.or.ddit.utiles.FileUploadRequestWrapper;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.LibraryFileVO;
import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.NoticeVO;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;

public class InsertNoticeAction implements ModelDriven<NoticeVO>{
	
	private NoticeVO noticeInfo;
	private String fileName;
	


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String execute()  throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		List<File> files = this.noticeInfo.getFiles();
		List<String> contentType = this.noticeInfo.getFilesContentType();
		List<String> fileNames = this.noticeInfo.getFilesFileName();
		
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		String notice_no = noticeService.insertNotice(noticeInfo);
		
		List<NoticeFileVO> fileItemList = new ArrayList<>();
		
		for(int i = 0; i<files.size(); i++){
			File targetFile = files.get(i);
			if(targetFile.length() > 0){
				
				//파일이 업로드되어 로컬에 저장되는 부분
				File saveFile = new File(GlobalConstant.FILE_PATH,fileNames.get(i));
				
				FileUtils.copyFile(targetFile, saveFile);
				//DB에 파일 정보를 저장하는 부분
				NoticeFileVO fileVO = new NoticeFileVO();
				
				fileVO.setNoticefile_notice_no(notice_no);
				
				String fileName = FilenameUtils.getName(fileNames.get(i));
				
				fileVO.setNoticefile_name(fileName);
				
				String baseName = FilenameUtils.getBaseName(fileName);
				
				String extension = FilenameUtils.getExtension(fileName);
				
				this.fileName = URLEncoder.encode(fileNames.get(i),"utf-8");
				
				String genID = UUID.randomUUID().toString().replace("-", "");
				String saveFileName = baseName+genID+"."+extension;
				
				fileVO.setNoticefile_save_name(saveFileName);
				
				fileVO.setNoticefile_content_type(contentType.get(i));
				
				fileVO.setNoticefile_size(String.valueOf(targetFile.length()));
				
				fileItemList.add(fileVO);
			}
		}
		INoticeFileService service = NoticeFileServiceImpl.getInstance();
		
		service.insertNoticefile(fileItemList);
		return "success";
	}

	@Override
	public NoticeVO getModel() {
		this.noticeInfo = new NoticeVO();
		return this.noticeInfo;
	}
	
	public String getFileName() {
		return fileName;
	}
	
}
