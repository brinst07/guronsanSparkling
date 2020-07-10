package kr.or.ddit.thumbnail.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.qnafile.service.IQnAFileService;
import kr.or.ddit.qnafile.service.QnAFileServiceImpl;
import kr.or.ddit.vo.LibraryVO;
import kr.or.ddit.vo.ThumbnailVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class ThumbnailDAOImpl implements IThumbnailDAO {
	private static IThumbnailDAO dao = new ThumbnailDAOImpl();
	private SqlMapClient smc;
	
	private ThumbnailDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	
	}
	public static IThumbnailDAO getInstance(){
		return (dao == null) ? dao = new ThumbnailDAOImpl() : dao;
	}
	@Override
	public List<ThumbnailVO> thumbnailList(Map<String, String> params)
			throws Exception {
		return smc.queryForList("thumbnail.thumbnailList",params);
	}
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) smc.queryForObject("thumbnail.totalCount", params);
	}
	@Override
	public String insertThumbnail(ThumbnailVO thumbnailInfo) throws Exception {
		return (String) smc.insert("thumbnail.insertThumbnail",thumbnailInfo);
	}
	
	@Override
	public ThumbnailVO thumbnailInfo(Map<String, String> params)
			throws Exception {
		return  (ThumbnailVO) smc.queryForObject("thumbnail.thumbnailInfo", params);
	}
	@Override
	public void deleteThumbnail(Map<String, String> params) throws Exception {
		smc.update("thumbnail.deleteThumbnail", params);
	}
	@Override
	public void updateThumbnail(ThumbnailVO thumbnailInfo) throws Exception {
		smc.update("thumbnail.updateThumbnail", thumbnailInfo);
	}
	@Override
	public void updateThumbnailHit(String thumbnail_no) throws Exception {
		smc.update("thumbnail.updateThumbnailHit", thumbnail_no);
	}
}
