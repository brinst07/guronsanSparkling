package kr.or.ddit.library.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LibraryVO;

import org.apache.commons.fileupload.FileItem;

public interface ILibraryService {
	public List<LibraryVO> libraryList(Map<String, String> params);
	public String insertLibrary(LibraryVO libraryInfo);
	public LibraryVO libraryInfo(Map<String, String> params);
	public void deleteLibraryboard(Map<String, String> params);
	public void updateLibrary(LibraryVO libraryInfo);
	public String totalCount(Map<String, String> params);
	public String insertLibraryReply(LibraryVO libraryInfo);
	public int libraryCount();
	public void modifylibrary(Map<String, String> params);
}
