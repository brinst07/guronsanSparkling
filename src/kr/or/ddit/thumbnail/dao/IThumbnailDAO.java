package kr.or.ddit.thumbnail.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LibraryVO;
import kr.or.ddit.vo.ThumbnailVO;

public interface IThumbnailDAO {
	public List<ThumbnailVO> thumbnailList(Map<String, String> params) throws Exception;

	public String totalCount(Map<String, String> params)throws Exception;

	public String insertThumbnail(ThumbnailVO thumbnailInfo)throws Exception;

	public ThumbnailVO thumbnailInfo(Map<String, String> params)  throws Exception;
	public void deleteThumbnail(Map<String, String> params)  throws Exception;
	public void updateThumbnail(ThumbnailVO thumbnailInfo)  throws Exception;
	public void updateThumbnailHit(String thumbnail_no) throws Exception;
}
