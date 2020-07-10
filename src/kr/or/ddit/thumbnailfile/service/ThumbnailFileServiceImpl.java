package kr.or.ddit.thumbnailfile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.thumbnailfile.dao.IThumbnailFileDAO;
import kr.or.ddit.thumbnailfile.dao.ThumbnailFileDAOImpl;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.ThumbnailFileVO;


public class ThumbnailFileServiceImpl implements IThumbnailFileService{
	private static IThumbnailFileService service = new ThumbnailFileServiceImpl();
	private IThumbnailFileDAO dao;
	
	public ThumbnailFileServiceImpl(){
		dao = ThumbnailFileDAOImpl.getInstance();
	}
	
	public static IThumbnailFileService getInstance(){
		return (service == null)? service = new ThumbnailFileServiceImpl() : service;
	}

	@Override
	public void insertThumbnailfile(List<ThumbnailFileVO> thumbnailfileList) {
		try {
			dao.insertThumbnailfile(thumbnailfileList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ThumbnailFileVO thumbnailFileInfo(Map<String, String> params) {
		ThumbnailFileVO thumbnailfileInfo = null;
		
		try {
			thumbnailfileInfo = dao.thumbnailFileInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return thumbnailfileInfo;
	}

	
}
