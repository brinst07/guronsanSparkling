package kr.or.ddit.thumbnailfile.service;

import kr.or.ddit.thumbnailfile.dao.IThumbnailFileDAO;
import kr.or.ddit.thumbnailfile.dao.ThumbnailFileDAOImpl;


public class ThumbnailFileServiceImpl implements IThumbnailFileService{
	private static IThumbnailFileService service = new ThumbnailFileServiceImpl();
	private IThumbnailFileDAO dao;
	
	public ThumbnailFileServiceImpl(){
		dao = ThumbnailFileDAOImpl.getInstance();
	}
	
	public static IThumbnailFileService getInstance(){
		return (service == null)? service = new ThumbnailFileServiceImpl() : service;
	}
}
