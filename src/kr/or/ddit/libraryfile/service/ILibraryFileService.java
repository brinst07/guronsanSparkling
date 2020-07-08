package kr.or.ddit.libraryfile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LibraryFileVO;

public interface ILibraryFileService {
	public void insertLibraryfile(List<LibraryFileVO> libraryFileList);
	public LibraryFileVO libraryFileInfo(Map<String, String> params);
	public List<LibraryFileVO> libraryFileList(int libraryfile_library_no);
}
