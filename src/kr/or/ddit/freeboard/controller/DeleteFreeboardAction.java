package kr.or.ddit.freeboard.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.freeboard.service.FreeboardServiceImpl;
import kr.or.ddit.freeboard.service.IFreeboardService;

public class DeleteFreeboardAction {
	private String bo_no;
	
	public String execute() {
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("bo_no", bo_no);

		IFreeboardService service = FreeboardServiceImpl.getInstance();
		service.deleteFreeboard(params);
		
		return "success";
	}

	public void setBo_no(String bo_no) {
		this.bo_no = bo_no;
	}
}
