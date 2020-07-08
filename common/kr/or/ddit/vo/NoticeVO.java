package kr.or.ddit.vo;

import java.util.List;

public class NoticeVO {
	private String rnum;
	private String notice_no;
	private String notice_title;
	private String notice_writer;
	private String notice_content;
	private String notice_hit;
	private String notice_reg_date;
	private String notice_status;
	private List<NoticeFileVO> items;

	

	public List<NoticeFileVO> getItems() {
		return items;
	}

	public void setItems(List<NoticeFileVO> items) {
		this.items = items;
	}


	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_hit() {
		return notice_hit;
	}

	public void setNotice_hit(String notice_hit) {
		this.notice_hit = notice_hit;
	}

	public String getNotice_reg_date() {
		return notice_reg_date;
	}

	public void setNotice_reg_date(String notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}

	public String getNotice_status() {
		return notice_status;
	}

	public void setNotice_status(String notice_status) {
		this.notice_status = notice_status;
	}



}
