package kr.or.ddit.thumbnail.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.qnafile.dao.IQnAFileDAO;
import kr.or.ddit.qnafile.dao.QnAFileDAOImpl;
import kr.or.ddit.qnafile.service.IQnAFileService;
import kr.or.ddit.qnafile.service.QnAFileServiceImpl;
import kr.or.ddit.thumbnail.dao.IThumbnailDAO;
import kr.or.ddit.thumbnail.dao.ThumbnailDAOImpl;
import kr.or.ddit.thumbnailfile.dao.IThumbnailFileDAO;
import kr.or.ddit.thumbnailfile.dao.ThumbnailFileDAOImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.LibraryVO;
import kr.or.ddit.vo.ThumbnailFileVO;
import kr.or.ddit.vo.ThumbnailVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class ThumbnailServiceImpl implements IThumbnailService {

	private static IThumbnailService service = new ThumbnailServiceImpl();
	private IThumbnailDAO dao;
	private IThumbnailFileDAO thumbfileDao;

	public ThumbnailServiceImpl() {
		dao = ThumbnailDAOImpl.getInstance();
		thumbfileDao = ThumbnailFileDAOImpl.getInstance();
	}

	public static IThumbnailService getInstance() {
		return (service == null) ? service = new ThumbnailServiceImpl()
				: service;
	}

	@Override
	public List<ThumbnailVO> thumbnailList(Map<String, String> params) {
		List<ThumbnailVO> list = null;
		try {
			list = dao.thumbnailList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = null;
		try {
			totalCount = dao.totalCount(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public String insertThumbnail(ThumbnailVO thumbnailInfo) {
		String bo_no = null;

		try {
			bo_no = dao.insertThumbnail(thumbnailInfo);

			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bo_no;

	}

	@Override
	public ThumbnailVO thumbnailInfo(Map<String, String> params) {
		ThumbnailVO thumbnailInfo = null;
		try {
			thumbnailInfo = dao.thumbnailInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return thumbnailInfo;
	}

	@Override
	public void deleteThumbnail(Map<String, String> params) {
		try {
			dao.deleteThumbnail(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateThumbnail(ThumbnailVO thumbnailInfo) {
		try {
			dao.updateThumbnail(thumbnailInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateThumbnailHit(String thumbnail_no) {
		try {
			dao.updateThumbnailHit(thumbnail_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
