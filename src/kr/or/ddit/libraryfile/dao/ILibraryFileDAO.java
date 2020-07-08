package kr.or.ddit.libraryfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LibraryFileVO;

public interface ILibraryFileDAO {
	public void insertLibraryfile(List<LibraryFileVO> libraryFileList)  throws Exception;;
	public LibraryFileVO libraryFileInfo(Map<String, String> params)  throws Exception;;
	public List<LibraryFileVO> libraryFileList(int libraryfile_library_no) throws Exception;
}
