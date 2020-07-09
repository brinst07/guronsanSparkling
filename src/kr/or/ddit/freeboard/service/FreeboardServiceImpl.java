package kr.or.ddit.freeboard.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.freeboard.dao.FreeboardDAOImpl;
import kr.or.ddit.freeboard.dao.IFreeboardDAO;
import kr.or.ddit.freeboardfile.dao.FreeboardFileDAOImpl;
import kr.or.ddit.freeboardfile.dao.IFreeboardFileDAO;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.FreeboardVO;


public class FreeboardServiceImpl implements IFreeboardService {

	private static IFreeboardService service = new FreeboardServiceImpl();
	private IFreeboardFileDAO freefileDao; 
	private IFreeboardDAO dao;

	private FreeboardServiceImpl() {
		dao = FreeboardDAOImpl.getInstance();
		freefileDao = FreeboardFileDAOImpl.getInstance();
	}

	public static IFreeboardService getInstance() {
		return (service == null) ? service = new FreeboardServiceImpl() : service;
	}

	@Override
	public List<FreeboardVO> freeboardList(Map<String, String> params) {
		List<FreeboardVO> freeboardList = null;
		try {
			freeboardList = dao.freeboardList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return freeboardList;
	}

	@Override
	public String insertFreeboard(FreeboardVO freeboardInfo) {
		String bo_no = null;
		
		try {
			bo_no = dao.insertFreeboard(freeboardInfo);
//			List<FreeFileVO> freefileList = AttachFileMapper.mapper(items, bo_no);
//			
//			freefileDao.insertFreefile(freefileList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bo_no;
	}

	@Override
	public FreeboardVO freeboardInfo(Map<String, String> params) {
		FreeboardVO freeboardInfo = null;
		try {
			freeboardInfo = dao.freeboardInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return freeboardInfo;
	}

	@Override
	public void deleteFreeboard(Map<String, String> params) {
		try {
			dao.deleteFreeboard(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateFreeboard(FreeboardVO freeboardInfo) {
		try {
			dao.updateFreeboard(freeboardInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String totalCount(Map<String, String> params){
		String totalCount = null;
		try {
			totalCount = dao.totalCount(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	@Override
	   public String insertFreeboardReply(FreeboardVO freeboardInfo) {
	      String bo_no = null;
	      try{
	         bo_no = dao.insertFreeboardReply(freeboardInfo);
	      }catch(Exception e){
	         e.printStackTrace();
	      }
	      return bo_no ;
	   }

	@Override
	public void updateFreeboardHit(String bo_no) {
		try {
			dao.updateFreeboardHit(bo_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
