package kr.or.ddit.faq.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.FAQVO;
import kr.or.ddit.vo.NoticeVO;

public interface IFAQService {
	public List<FAQVO> userFAQList(Map<String, String> params);
	public String totalCount(Map<String, String> params);
	public FAQVO faqInfo(Map<String, String> params);
	public List<FAQVO> FAQList(Map<String, String> params);
	public String insertFAQ(FAQVO faqInfo);
	public void updateFAQ(FAQVO faqInfo);
	public void deleteFAQ(Map<String, String> params);
	public void updateFAQhit(Map<String, String> params);
}
