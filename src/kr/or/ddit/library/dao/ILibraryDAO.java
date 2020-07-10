package kr.or.ddit.library.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LibraryVO;

import org.apache.commons.fileupload.FileItem;

public interface ILibraryDAO {
	public List<LibraryVO> libraryList(Map<String, String> params)  throws Exception;
	public String insertLibrary(LibraryVO libraryInfo)  throws Exception;
	public LibraryVO libraryInfo(Map<String, String> params)  throws Exception;
	public void deleteLibraryboard(Map<String, String> params)  throws Exception;
	public void updateLibrary(LibraryVO libraryInfo)  throws Exception;
	public String totalCount(Map<String, String> params)  throws Exception;
	public String insertLibraryReply(LibraryVO libraryInfo)  throws Exception;
	public int libraryCount() throws Exception;
	public void modifylibrary(Map<String, String> params) throws Exception;
	public void updateLibraryHit(String library_no) throws Exception;
}
