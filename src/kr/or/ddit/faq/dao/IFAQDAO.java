package kr.or.ddit.faq.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.FAQVO;
import kr.or.ddit.vo.NoticeVO;

public interface IFAQDAO {
	public List<FAQVO> userFAQList(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
	public FAQVO faqInfo(Map<String, String> params) throws Exception;
	public List<FAQVO> FAQList(Map<String, String> params) throws Exception;
	public String insertFAQ(FAQVO faqInfo) throws Exception;
	public void updateFAQ(FAQVO faqInfo) throws Exception;
	public void deleteFAQ(Map<String, String> params) throws Exception;
}

