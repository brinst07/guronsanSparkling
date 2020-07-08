package kr.or.ddit.freeboard.controller;

import java.lang.reflect.InvocationTargetException;

import kr.or.ddit.freeboard.service.FreeboardServiceImpl;
import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.utiles.FileUploadRequestWrapper;
import kr.or.ddit.vo.FreeboardVO;

import org.apache.commons.beanutils.BeanUtils;

import com.opensymphony.xwork2.ModelDriven;

public class InsertFreeboardAction implements ModelDriven<FreeboardVO>{
	private FreeboardVO freeboardInfo;
	
	public String execute(){
		//FileUploadRequestWrapper wrapper =  new FileUploadRequestWrapper(request);
		
		freeboardInfo = new FreeboardVO();
		
		
		
//		try {
//			BeanUtils.populate(freeboardInfo, wrapper.getParameterMap());
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		} catch (InvocationTargetException e) {
//			e.printStackTrace();
//		}
//		IFreeboardService service = FreeboardServiceImpl.getInstance();
//		service.insertFreeboard(freeboardInfo, wrapper.getFileItemValues("files"));

		
		return "success";
	}

	@Override
	public FreeboardVO getModel() {
		
		return null;
	}
}
