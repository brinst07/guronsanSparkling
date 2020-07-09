package kr.or.ddit.thumbnailfile.dao;

import java.util.List;

import kr.or.ddit.vo.ThumbnailFileVO;

public interface IThumbnailFileDAO {

	void insertThumbnailfile(List<ThumbnailFileVO> thumbnailfileList) throws Exception;

}
