package kr.or.ddit.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.NoticeVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class NoticeDAOImpl implements INoticeDAO{
	private static INoticeDAO dao = new NoticeDAOImpl();
	private SqlMapClient smc;
	
	private NoticeDAOImpl(){
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static INoticeDAO getInstance(){
		return (dao == null) ? dao = new NoticeDAOImpl() : dao;
	}



	@Override
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception {
		return (NoticeVO) smc.queryForObject("notice.noticeInfo", params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) smc.queryForObject("notice.totalCount", params);

	}

	@Override
	public List<NoticeVO> userNoticeList(Map<String, String> params)
			throws Exception {
		return smc.queryForList("notice.userNoticeList",params);
	}

	@Override
	public void updateNotice(NoticeVO noticeInfo) throws Exception {
		smc.update("notice.updateNotice", noticeInfo);		
	}

	@Override
	public void deleteNotice(Map<String, String> params) throws Exception {
		smc.update("notice.deleteNotice", params);
		
	}


	@Override
	public String insertNotice(NoticeVO noticeInfo) throws Exception {
		return (String) smc.insert("notice.insertNotice", noticeInfo);
		/*//freeboardInfo : 댓글정보(bo_title, bo_nickname, bo_pwd, bo_mail, bo_content, bo_writer, bo_ip)
	      //                부모 게시글 정보 (bo_group, bo_seq, bo_depth)
	      String notice_no = "";
	      try{
	         smc.startTransaction();
	         String notice_seq;
	         if("0".intern() == noticeInfo.getNotice_seq().intern()){
	            notice_seq = (String) smc.queryForObject("notice.incrementSeq", noticeInfo);
	         }else{
	        	smc.update("notice.updateSeq", noticeInfo);
	            notice_seq = String.valueOf(Integer.parseInt(noticeInfo.getNotice_seq()) + 1);
	         }
	         noticeInfo.setNotice_seq(notice_seq);
	         
	         String notice_depth = String.valueOf(Integer.parseInt(noticeInfo.getNotice_depth()) + 1);
	         noticeInfo.setNotice_depth(notice_depth);

	         notice_no = (String) smc.insert("notice.insertNoticeReply", noticeInfo);
	         
	         smc.commitTransaction();
	      }finally{
	    	  smc.endTransaction();
	      }
	      return notice_no;*/

	}

	@Override
	public List<NoticeVO> noticeList(Map<String, String> params)
			throws Exception {
		return smc.queryForList("notice.noticeList" ,params);

	}
}
