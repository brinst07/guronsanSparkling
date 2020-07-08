package kr.or.ddit.zipcode.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ZipcodeVO;
import kr.or.ddit.zipcode.dao.IZipcodeDao;
import kr.or.ddit.zipcode.dao.ZipcodeDaoImpl;

public class ZipcodeServiceImpl implements IZipcodeService{
	private static IZipcodeService service = new ZipcodeServiceImpl();
	private IZipcodeDao dao;
	
	private ZipcodeServiceImpl(){
		dao = ZipcodeDaoImpl.getInstance();
	}
	
	public static IZipcodeService getInstance(){
		return (service==null) ? service = new ZipcodeServiceImpl() : service;
	}
	
	@Override
	public List<ZipcodeVO> zipcodeList(Map<String, String> params) {
		List<ZipcodeVO> list =null;
		try {
			list = dao.zipcodeList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
