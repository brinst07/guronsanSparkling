package kr.or.ddit.thumbnail.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.freeboardfile.service.FreeboardFileServiceImpl;
import kr.or.ddit.freeboardfile.service.IFreeboardFileService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.thumbnailfile.service.IThumbnailFileService;
import kr.or.ddit.thumbnailfile.service.ThumbnailFileServiceImpl;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ThumbnailFileVO;
import kr.or.ddit.vo.ThumbnailVO;

public class ThumbnailFileDownloadAction {
	private String thumbfile_seq;
	
	
	
	
	public void execute(){
		HttpServletResponse response = ServletActionContext.getResponse();
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("thumbfile_seq", thumbfile_seq);

		IThumbnailFileService service = ThumbnailFileServiceImpl.getInstance();
		ThumbnailFileVO fileitemInfo = service.thumbnailFileInfo(params);

		File downloadFile = new File(GlobalConstant.FILE_PATH,
				fileitemInfo.getThumbfile_name());

		if (downloadFile.exists()) {
			String fileName = null;

			try {
				fileName = URLEncoder.encode(fileitemInfo.getThumbfile_name(), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			response.setHeader("Content-Disposition", "attachment;fileName="
					+ fileName);
			response.setContentType("application/octet-stream");
			response.setContentLength((int) downloadFile.length());

			byte[] buffer = new byte[(int) downloadFile.length()];

			BufferedInputStream inputStream = null;

			try {
				inputStream = new BufferedInputStream(new FileInputStream(
						downloadFile));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			BufferedOutputStream outputStream = null;

			try {
				outputStream = new BufferedOutputStream(
						response.getOutputStream());
			} catch (IOException e) {
				e.printStackTrace();
			}

			int readCNT = 0;
			try {
				while ((readCNT = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer);
				}
			} catch (IOException | IllegalStateException e) {
				e.printStackTrace();
			}

			try {
				inputStream.close();
			} catch (IOException | IllegalStateException e) {
				e.printStackTrace();
			}
			try {
				outputStream.close();
			} catch (IOException | IllegalStateException e) {
				e.printStackTrace();
			}
		}	
	}




	public void setThumbfile_seq(String thumbfile_seq) {
		this.thumbfile_seq = thumbfile_seq;
	}
}
