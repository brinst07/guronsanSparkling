package kr.or.ddit.qna.controller;

import kr.or.ddit.qna.service.IQnAService;
import kr.or.ddit.qna.service.QnAServiceImpl;
import kr.or.ddit.vo.QnAVO;

import com.opensymphony.xwork2.ModelDriven;

public class UpdateQnaAction implements ModelDriven<QnAVO>{
	private QnAVO qnaInfo;
	
	public String execute(){
		IQnAService qnaService = QnAServiceImpl.getInstance();
		qnaService.updateQna(qnaInfo);
		
		return "success";
	}
	
	
	@Override
	public QnAVO getModel() {
		qnaInfo = new QnAVO();
		
		return qnaInfo;
	}
	
}
