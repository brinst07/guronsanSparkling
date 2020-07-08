package kr.or.ddit.library.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.library.service.ILibraryService;
import kr.or.ddit.library.service.LibraryServiceImpl;


public class DeleteLibraryAction {
	
	private String library_no;
	
	public String execute() {
		Map<String, String> params = new HashMap<String, String>();
		ILibraryService service = LibraryServiceImpl.getInstance();
		params.put("library_no", library_no);
		
		service.deleteLibraryboard(params);
		
		return "success";
		
		
	}

	public void setLibrary_no(String library_no) {
		this.library_no = library_no;
	}
	
	

}
