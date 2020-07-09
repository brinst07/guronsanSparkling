package kr.or.ddit.thumbnailfile.dao;

import java.util.List;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.thumbnail.service.IThumbnailService;
import kr.or.ddit.thumbnail.service.ThumbnailServiceImpl;
import kr.or.ddit.vo.LibraryFileVO;
import kr.or.ddit.vo.ThumbnailFileVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class ThumbnailFileDAOImpl implements IThumbnailFileDAO{
	
	private static IThumbnailFileDAO dao = new ThumbnailFileDAOImpl();
	private SqlMapClient smc;
	
	private ThumbnailFileDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	public static IThumbnailFileDAO getInstance(){
		return (dao == null) ? dao = new ThumbnailFileDAOImpl() : dao;
	}
	
	
	@Override
	public void insertThumbnailfile(List<ThumbnailFileVO> thumbnailfileList)
			throws Exception {
		try{
			smc.startTransaction();
			
			for(ThumbnailFileVO thumbnailfileInfo : thumbnailfileList){
				smc.insert("thumbfile.insertThumbnailfile", thumbnailfileInfo);
			}
			smc.commitTransaction();
		}finally{
			smc.endTransaction();
		}
	}
}
