package kr.or.ddit.freeboardfile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeFileVO;

public interface IFreeboardFileService {
	public void insertFreefile(List<FreeFileVO> freefileList);
	public FreeFileVO freefileInfo(Map<String, String> params);
}
