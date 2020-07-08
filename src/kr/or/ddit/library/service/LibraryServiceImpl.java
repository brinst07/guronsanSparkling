package kr.or.ddit.library.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.freeboardfile.dao.FreeboardFileDAOImpl;
import kr.or.ddit.library.dao.ILibraryDAO;
import kr.or.ddit.library.dao.LibraryDAOImpl;
import kr.or.ddit.libraryfile.dao.ILibraryFileDAO;
import kr.or.ddit.libraryfile.dao.LibraryFileDAOImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.LibraryFileVO;
import kr.or.ddit.vo.LibraryVO;

public class LibraryServiceImpl implements ILibraryService {
	private ILibraryDAO dao;
	private ILibraryFileDAO libraryFileDao;
	private static ILibraryService service = new LibraryServiceImpl();
	
	private LibraryServiceImpl(){
		dao = LibraryDAOImpl.getInstance();
		libraryFileDao = LibraryFileDAOImpl.getInstance();
	}
	
	
	public static ILibraryService getInstance(){
		return (service == null) ? service = new LibraryServiceImpl() : service;
	}


	@Override
	public List<LibraryVO> libraryList(Map<String, String> params) {
		List<LibraryVO> libraryList = null;
		try {
			libraryList = dao.libraryList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return libraryList;
	}


	@Override
	public String insertLibrary(LibraryVO libraryInfo, FileItem[] items) {
		
		String bo_no = null;		
		try {
			bo_no = dao.insertLibrary(libraryInfo);
			
			List<LibraryFileVO> libraryfileList = AttachFileMapper.librarymapper(items, bo_no);
			
			libraryFileDao.insertLibraryfile(libraryfileList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bo_no;
	}


	@Override
	public LibraryVO libraryInfo(Map<String, String> params) {
		LibraryVO libraryInfo = null;
		try {
			libraryInfo = dao.libraryInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return libraryInfo;
	}


	@Override
	public void deleteLibraryboard(Map<String, String> params) {
		try {
			dao.deleteLibraryboard(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	@Override
	public void updateLibrary(LibraryVO libraryInfo) {
		try {
			dao.updateLibrary(libraryInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = null;
		try {
			totalCount = dao.totalCount(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}


	@Override
	public String insertLibraryReply(LibraryVO libraryInfo) {
		  String bo_no = null;
	      try{
	         bo_no = dao.insertLibraryReply(libraryInfo);
	      }catch(Exception e){
	         e.printStackTrace();
	      }
	      return bo_no ;
	}


	@Override
	public int libraryCount() {
		int count = 0;
		try {
			count =  dao.libraryCount();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}


	@Override
	public void modifylibrary(Map<String, String> params) {
		try {
			dao.modifylibrary(params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
