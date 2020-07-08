package kr.or.ddit.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;

public class MemberExcelAction implements Action {
	
	private String selects;
	
	private List<MemberVO> memberList;


	@Override
	public String execute() throws Exception {
		
		HttpServletResponse response = ServletActionContext.getResponse();
		
		String[] select = selects.split(",");
		
		IMemberService service = IMemberServiceImpl.getInstance();
		
		this.memberList = new ArrayList<>();
		
		for(int i = 0; i<select.length; i++){
			this.memberList.add(service.selectByID(select[i]));
		}
		
		response.setHeader("Content-Disposition", "attachment;fileName=members.xls");
	 	response.setHeader("Content-Description", "Generate Excel File");
	 	response.setContentType("application/vnd.ms-excel");
		
		return SUCCESS;
	}
	
	public void setSelects(String selects) {
		this.selects = selects;
	}

	public List<MemberVO> getMemberList() {
		return memberList;
	}
	
}
