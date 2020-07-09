package kr.or.ddit.thumbnail.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.thumbnail.service.IThumbnailService;
import kr.or.ddit.thumbnail.service.ThumbnailServiceImpl;

public class DeleteThumbnailAction {
	private String thumbnail_no;
	
	
	
	public String execute(){
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("thumbnail_no", thumbnail_no);

		IThumbnailService service = ThumbnailServiceImpl.getInstance();
		service.deleteThumbnail(params);
		
		
		return "success";
	}



	public void setThumbnail_no(String thumbnail_no) {
		this.thumbnail_no = thumbnail_no;
	}
}
