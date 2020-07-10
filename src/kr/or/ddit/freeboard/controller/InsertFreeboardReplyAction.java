package kr.or.ddit.freeboard.controller;

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
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.FreeboardVO;

import com.opensymphony.xwork2.ModelDriven;

public class InsertFreeboardReplyAction implements ModelDriven<FreeboardVO>{
	private FreeboardVO freeboardInfo;
	
	public String execute(){
		IFreeboardService service = FreeboardServiceImpl.getInstance();
		service.insertFreeboardReply(freeboardInfo);
		
		return "success";
	}
	@Override
	public FreeboardVO getModel() {
		this.freeboardInfo = new FreeboardVO();
		return this.freeboardInfo;
	}
	
	

}
