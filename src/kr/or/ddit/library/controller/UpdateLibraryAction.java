package kr.or.ddit.library.controller;

import java.lang.reflect.InvocationTargetException;

import com.opensymphony.xwork2.ModelDriven;

import kr.or.ddit.library.service.ILibraryService;
import kr.or.ddit.library.service.LibraryServiceImpl;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.vo.LibraryVO;
import kr.or.ddit.vo.NoticeVO;


public class UpdateLibraryAction implements ModelDriven<LibraryVO>{
	
	private LibraryVO libraryInfo;
	
	public String execute() {


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
