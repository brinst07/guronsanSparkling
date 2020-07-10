package kr.or.ddit.library.controller;

import com.opensymphony.xwork2.ModelDriven;

import kr.or.ddit.library.service.ILibraryService;
import kr.or.ddit.library.service.LibraryServiceImpl;
import kr.or.ddit.vo.LibraryVO;


public class UpdateLibraryAction implements ModelDriven<LibraryVO>{
	
	private LibraryVO libraryInfo;
	
	public String execute() {

		System.out.println(libraryInfo.getLibrary_no());
		ILibraryService service = LibraryServiceImpl.getInstance();
		service.updateLibrary(this.libraryInfo);
		
		return "success";
		
	}

	@Override
	public LibraryVO getModel() {
		this.libraryInfo = new LibraryVO();
		return this.libraryInfo;
	}





	

}
