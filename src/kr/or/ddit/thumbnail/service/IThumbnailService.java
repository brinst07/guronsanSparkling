package kr.or.ddit.thumbnail.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.LibraryVO;
import kr.or.ddit.vo.ThumbnailVO;

public interface IThumbnailService {
	public List<ThumbnailVO> thumbnailList(Map<String, String> params);

	public String totalCount(Map<String, String> params);

	public String insertThumbnail(ThumbnailVO thumbnailInfo);
	public ThumbnailVO thumbnailInfo(Map<String, String> params);
	public void deleteThumbnail(Map<String, String> params);
	public void updateThumbnail(ThumbnailVO thumbnailInfo);
	public void updateThumbnailHit(String thumbnail_no);
	
}
