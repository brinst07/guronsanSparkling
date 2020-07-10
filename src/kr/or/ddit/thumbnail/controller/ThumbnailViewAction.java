package kr.or.ddit.thumbnail.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.thumbnail.service.IThumbnailService;
import kr.or.ddit.thumbnail.service.ThumbnailServiceImpl;
import kr.or.ddit.vo.ThumbnailVO;

public class ThumbnailViewAction {
	private String thumbnail_no;
	private ThumbnailVO  thumbnailInfo;
	
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String, String> params = new HashMap<String, String>();
		params.put("thumbnail_no", thumbnail_no);
		
		IThumbnailService thumbnailService = ThumbnailServiceImpl.getInstance();
		thumbnailService.updateThumbnailHit(thumbnail_no);
		thumbnailInfo = thumbnailService.thumbnailInfo(params);
		
		
		
		//content-header
		request.setAttribute("boardlist", "썸네일게시판");
		request.setAttribute("boardview", "상세보기");
		request.setAttribute("boardhref", "/user/thumbnail/thumbnailList.do");

		return "success";
	}


	public void setThumbnail_no(String thumbnail_no) {
		this.thumbnail_no = thumbnail_no;
	}


	public ThumbnailVO getThumbnailInfo() {
		return thumbnailInfo;
	}
}
