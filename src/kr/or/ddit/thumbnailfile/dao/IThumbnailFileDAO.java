package kr.or.ddit.thumbnailfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.ThumbnailFileVO;

public interface IThumbnailFileDAO {

	void insertThumbnailfile(List<ThumbnailFileVO> thumbnailfileList) throws Exception;

	public ThumbnailFileVO thumbnailFileInfo(Map<String, String> params) throws Exception;
}
