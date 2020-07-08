package kr.or.ddit.faq.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.faq.dao.FAQDAOImpl;
import kr.or.ddit.faq.dao.IFAQDAO;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FAQVO;
import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.NoticeVO;

public class FAQServiceImpl implements IFAQService {
	
	private static IFAQService service = new FAQServiceImpl();
	private IFAQDAO faqDAO;

	private FAQServiceImpl() {
		faqDAO = FAQDAOImpl.getInstance();
	}

	public static IFAQService getInstance() {
		return (service == null) ? service = new FAQServiceImpl() : service;
	}

	@Override
	public List<FAQVO> userFAQList(Map<String, String> params) {
		List<FAQVO> list = null;
		try {
			list = faqDAO.userFAQList(params);
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = null;
		try {
			totalCount = faqDAO.totalCount(params);
		} catch (Exception e){
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public FAQVO faqInfo(Map<String, String> params) {
		FAQVO vo = null;
		try {
			vo = faqDAO.faqInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public List<FAQVO> FAQList(Map<String, String> params) {
		List<FAQVO> FAQList = null;
		try {
			FAQList = faqDAO.userFAQList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return FAQList;
	}



	@Override
	public void updateFAQ(FAQVO faqInfo) {
		try {
			faqDAO.updateFAQ(faqInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteFAQ(Map<String, String> params) {
		try {
			faqDAO.deleteFAQ(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String insertFAQ(FAQVO faqInfo) {
		String faq_no = null;
		
		try {
			faq_no = faqDAO.insertFAQ(faqInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return faq_no;
	}
	
	

}


