package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.vo.ZipcodeVO;
import kr.or.ddit.zipcode.service.IZipcodeService;
import kr.or.ddit.zipcode.service.ZipcodeServiceImpl;

import org.apache.struts2.ServletActionContext;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;


public class ZipcodeSearchResultAction {
	private String dong;
	
	
	
	public void execute(){
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("dong", dong);
		
		//웹 애플리케이션 : 테이블 1개당 service, dao, vo가 하나씩 맵핑.
		IZipcodeService service = ZipcodeServiceImpl.getInstance();
		List<ZipcodeVO> zipcodeList = service.zipcodeList(params);

		ObjectMapper mapper = new ObjectMapper();
		String jsonData;
		try {
			jsonData = mapper.writeValueAsString(zipcodeList);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.println(jsonData);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}



	public void setDong(String dong) {
		this.dong = dong;
	}
}
