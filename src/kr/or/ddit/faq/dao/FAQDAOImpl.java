package kr.or.ddit.faq.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FAQVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class FAQDAOImpl implements IFAQDAO {
	
	private static IFAQDAO dao = new FAQDAOImpl();
	private SqlMapClient smc;
	
	private FAQDAOImpl(){
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFAQDAO getInstance(){
		return (dao == null) ? dao = new FAQDAOImpl() : dao;
	}

	@Override
	public List<FAQVO> userFAQList(Map<String, String> params) throws Exception {
		
		return smc.queryForList("faq.userFAQList",params);
	}
	
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) smc.queryForObject("faq.totalCount", params);

	}

	@Override
	public FAQVO faqInfo(Map<String, String> params) throws Exception {
		return (FAQVO) smc.queryForObject("faq.faqInfo",params);
	}

	@Override
	public List<FAQVO> FAQList(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertFAQ(FAQVO faqInfo) throws Exception {
		return (String) smc.insert("faq.insertFAQ", faqInfo);
	}

	@Override
	public void updateFAQ(FAQVO faqInfo) throws Exception {
		smc.update("faq.updateFAQ", faqInfo);
	}

	@Override
	public void deleteFAQ(Map<String, String> params) throws Exception {
		smc.update("faq.deleteFAQ", params);
	}

	@Override
	public void updateFAQhit(Map<String, String> params) throws Exception {
		smc.update("faq.updateFAQhit",params);
	}

}
