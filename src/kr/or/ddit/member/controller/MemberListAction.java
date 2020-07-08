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
	
	private String currentPage;
	
	private String count;
	


	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		
		if(this.currentPage==null){
			currentPage = "1";
		}
		
		
		if(this.count == null){
			this.count = "10";
		}else{
			this.count = count;
		}
		
		
		
		IMemberService service = IMemberServiceImpl.getInstance();
		
		
		
		
		Map<String, String> params = new HashMap<String, String>();
		
		Map<String, String[]> mapobject = request.getParameterMap();
		
		for (String mapkey : mapobject.keySet()){
	        String[] list = mapobject.get(mapkey);
	        params.put(mapkey, list[0]);
	    }
		
		int totalCount = service.totalCount(params);
		RolePaginationUtil pagination = new RolePaginationUtil(request, Integer.parseInt(currentPage), totalCount,Integer.parseInt(count));
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
	
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	
	public void setCount(String count) {
		this.count = count;
	}
	
	public String getCount() {
		return count;
	}
}
