package kr.or.ddit.library.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;

import kr.or.ddit.freeboard.service.FreeboardServiceImpl;
import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.freeboardfile.service.FreeboardFileServiceImpl;
import kr.or.ddit.freeboardfile.service.IFreeboardFileService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.library.service.ILibraryService;
import kr.or.ddit.library.service.LibraryServiceImpl;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.LibraryVO;

import com.opensymphony.xwork2.ModelDriven;

public class InsertLibraryReplyAction implements ModelDriven<LibraryVO>{
	private LibraryVO libraryInfo;
	
	public String execute(){
		ILibraryService service = LibraryServiceImpl.getInstance();
		service.insertLibraryReply(libraryInfo);
		
		return "success";
	}
	@Override
	public LibraryVO getModel() {
		this.libraryInfo = new LibraryVO();
		return this.libraryInfo;
	}
	
	

}
