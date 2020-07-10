package kr.or.ddit.thumbnailfile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ThumbnailFileVO;

public interface IThumbnailFileService {
	public void insertThumbnailfile(List<ThumbnailFileVO> thumbfileList);
	public ThumbnailFileVO thumbnailFileInfo(Map<String, String> params);
}
