package kr.or.ddit.qna.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.qna.service.IQnAService;
import kr.or.ddit.qna.service.QnAServiceImpl;
import kr.or.ddit.vo.QnAVO;

public class QnaViewAction {
	private String qna_no;
	private QnAVO qnaInfo;
	private String flag;
	
	public QnAVO getQnaInfo() {
		return qnaInfo;
	}

	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}


	
	public String execute(){
		flag = "2";
		IQnAService service = QnAServiceImpl.getInstance();
		int num = Integer.parseInt(service.qnaReplyCheck(qna_no));
		if(num == 1){
			flag = "1";
		}else{
			flag = "2";
		}
		
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
		
		
		
		
		
		//content-header
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("boardlist", "QnA게시판");
		request.setAttribute("boardview", "상세보기");
		request.setAttribute("boardhref", "/user/qna/qnaList.do");
		
		
		
		return addr;
	}
	
	public String getFlag() {
		return flag;
	}


}
