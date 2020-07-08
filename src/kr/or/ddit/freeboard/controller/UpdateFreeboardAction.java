package kr.or.ddit.freeboard.controller;

import kr.or.ddit.freeboard.service.FreeboardServiceImpl;
import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.vo.FreeboardVO;

import com.opensymphony.xwork2.ModelDriven;

public class UpdateFreeboardAction implements ModelDriven<FreeboardVO>{
	private FreeboardVO freeboardInfo;
	
	public String execute(){
		IFreeboardService freeService = FreeboardServiceImpl.getInstance();
		freeService.updateFreeboard(freeboardInfo);
		
		return "success";
	}
	
	@Override
	public FreeboardVO getModel() {
		freeboardInfo = new FreeboardVO();
		
		return freeboardInfo;
	}

}
