package kr.or.ddit.library.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.library.service.ILibraryService;
import kr.or.ddit.library.service.LibraryServiceImpl;
import kr.or.ddit.libraryfile.service.ILibraryFileService;
import kr.or.ddit.libraryfile.service.LibraryFileServiceImpl;
import kr.or.ddit.vo.LibraryFileVO;
import kr.or.ddit.vo.LibraryVO;

public class LibraryViewAction {
	
	private String library_no;
	private LibraryVO libraryInfo;
	private List<LibraryFileVO> filelist;
	
	public String execute() {
				
		Map<String, String> params = new HashMap<String, String>();
		params.put("library_no", this.library_no);
		
		ILibraryService service = LibraryServiceImpl.getInstance();
		service.updateLibraryHit(library_no);
		this.libraryInfo = service.libraryInfo(params);
		
		ILibraryFileService service2 = LibraryFileServiceImpl.getInstance();
		 	
		/*int libraryfile_library_no = Integer.parseInt(vo.getLibrary_no());
		
		filelist = service2.libraryFileList(libraryfile_library_no);*/

		
		return "success";
		
	}

	

	public void setLibrary_no(String library_no) {
		this.library_no = library_no;
	}


	

	public LibraryVO getLibraryInfo() {
		return libraryInfo;
	}



	public List<LibraryFileVO> getFilelist() {
		return filelist;
	}

	
}
