package kr.or.ddit.freeboardfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeFileVO;

public interface IFreeboardFileDAO {
	public void insertFreefile(List<FreeFileVO> freefileList) throws Exception;
	public FreeFileVO freefileInfo(Map<String, String> params) throws Exception;
}
