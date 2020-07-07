package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;

public class MemberListAction implements Action{
	
	private List<MemberVO> memberList;
	
	private String pagination;

	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String currentPage = request.getParameter("currentPage");
		
		if(currentPage==null){
			currentPage = "1";
		}
		
		String count = request.getParameter("count");
		
		if(count == null){
			count = "10";
		}
		
		IMemberService service = IMemberServiceImpl.getInstance();
		
		int totalCount = service.totalCount();
		
		RolePaginationUtil pagination = new RolePaginationUtil(request, Integer.parseInt(currentPage), totalCount);
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		
		
		List<MemberVO> list = service.memberList(params);
		String pagingHTML = pagination.getPagingHtmls();
		
		this.memberList = list;
		this.pagination = pagingHTML;
		
		return SUCCESS;
	}

	public List<MemberVO> getMemberList() {
		return memberList;
	}
	
	public String getPagination() {
		return pagination;
	}
}
