package kr.or.ddit.qna.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.qna.service.IQnAService;
import kr.or.ddit.qna.service.QnAServiceImpl;
import kr.or.ddit.vo.QnAVO;

public class QnaViewAction {
	private String qna_no;
	private QnAVO qnaInfo;
	
	public String execute(){
		Map<String, String> params = new HashMap<String, String>();
		params.put("qna_no", qna_no);
		
		IQnAService qnaService = QnAServiceImpl.getInstance();
		qnaService.updateQnaHit(qna_no);
		qnaInfo = qnaService.qnaInfo(params);
		
		String addr = null;
		if(qnaInfo.getQna_depth().equals("1")){
			addr = "qnaReply";
		}else{
			addr = "qna";
		}
		
		return addr;
	}

	public QnAVO getQnaInfo() {
		return qnaInfo;
	}

	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}
}
