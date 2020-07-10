package kr.or.ddit.freeboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.freeboard.service.FreeboardServiceImpl;
import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.vo.FreeboardVO;

public class FreeboardViewAction {
	private String bo_no;
	private FreeboardVO freeboardInfo;
	
	public String execute(){
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("bo_no", bo_no);
		
		IFreeboardService freeService = FreeboardServiceImpl.getInstance();
		freeService.updateFreeboardHit(bo_no);
		freeboardInfo = freeService.freeboardInfo(params);
		
		
		//content-header
		HttpServletRequest request = ServletActionContext.getRequest();
		
		request.setAttribute("boardlist", "자유게시판");
		request.setAttribute("boardhref", "/user/freeboard/freeboardList.do");		
		request.setAttribute("boardview", "상세보기");

		return "success";
	}

	public void setBo_no(String bo_no) {
		this.bo_no = bo_no;
	}

	public FreeboardVO getFreeboardInfo() {
		return freeboardInfo;
	}
}
