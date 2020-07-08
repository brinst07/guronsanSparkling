package kr.or.ddit.qna.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.qna.service.IQnAService;
import kr.or.ddit.qna.service.QnAServiceImpl;

public class DeleteQnaAction {
	private String qna_no;
	
	public String execute(){
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("qna_no", qna_no);
		
		IQnAService qnaService = QnAServiceImpl.getInstance();
		qnaService.deleteQna(params);
		
		return "success";
	}

	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}
}
