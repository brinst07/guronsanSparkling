package kr.or.ddit.libraryfile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.freeboardfile.dao.FreeboardFileDAOImpl;
import kr.or.ddit.freeboardfile.dao.IFreeboardFileDAO;
import kr.or.ddit.freeboardfile.service.FreeboardFileServiceImpl;
import kr.or.ddit.freeboardfile.service.IFreeboardFileService;
import kr.or.ddit.libraryfile.dao.ILibraryFileDAO;
import kr.or.ddit.libraryfile.dao.LibraryFileDAOImpl;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.LibraryFileVO;

public class LibraryFileServiceImpl implements ILibraryFileService {

	private static ILibraryFileService service = new LibraryFileServiceImpl();
	private ILibraryFileDAO dao;
	
	private LibraryFileServiceImpl(){
		dao = LibraryFileDAOImpl.getInstance();
	}

	public static ILibraryFileService getInstance() {
		return (service == null) ? service = new LibraryFileServiceImpl() : service;
	}

	@Override
	public void insertLibraryfile(List<LibraryFileVO> libraryFileList) {
		try {
			dao.insertLibraryfile(libraryFileList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public LibraryFileVO libraryFileInfo(Map<String, String> params) {
		LibraryFileVO libraryFileInfo = null;
		
		try {
			libraryFileInfo = dao.libraryFileInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return libraryFileInfo;
	}

	@Override
	public List<LibraryFileVO> libraryFileList(int libraryfile_library_no) {
		List<LibraryFileVO> list = null;
		try {
			list = dao.libraryFileList(libraryfile_library_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
