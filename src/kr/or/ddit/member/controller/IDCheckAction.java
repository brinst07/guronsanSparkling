package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class IDCheckAction {
	
	private String mem_id;
	
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public void execute(){
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", this.mem_id);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		MemberVO vo = service.memberInfo(params);
		
		Map<String, String> jsonMap = new HashMap<>();
		if(vo == null){
			jsonMap.put("flag", "true");
		}else{
			jsonMap.put("flag", "false");
			
		}
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			String jsonData = mapper.writeValueAsString(jsonMap);
			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			out.println(jsonData);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
