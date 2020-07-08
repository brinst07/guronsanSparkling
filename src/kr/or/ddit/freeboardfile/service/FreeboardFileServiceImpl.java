package kr.or.ddit.freeboardfile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.freeboardfile.dao.FreeboardFileDAOImpl;
import kr.or.ddit.freeboardfile.dao.IFreeboardFileDAO;
import kr.or.ddit.vo.FreeFileVO;

public class FreeboardFileServiceImpl implements IFreeboardFileService {
	private static IFreeboardFileService service = new FreeboardFileServiceImpl();
	private IFreeboardFileDAO dao;
	
	private FreeboardFileServiceImpl(){
		dao = FreeboardFileDAOImpl.getInstance();
	}

	public static IFreeboardFileService getInstance() {
		return (service == null) ? service = new FreeboardFileServiceImpl() : service;
	}

	@Override
	public void insertFreefile(List<FreeFileVO> freefileList) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FreeFileVO freefileInfo(Map<String, String> params) {
		FreeFileVO freefileInfo = null;
		
		try {
			freefileInfo = dao.freefileInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return freefileInfo;
	}
}
