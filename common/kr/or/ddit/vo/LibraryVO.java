package kr.or.ddit.vo;

import java.util.List;

public class LibraryVO {
	private String rnum;
	private String library_no;
	private String library_title;
	private String library_writer;
	private String library_nickname;
	private String library_pwd;
	private String library_mail;
	private String library_ip;
	private String library_content;
	private String library_hit;
	private String library_reg_date;
	private String library_status;
	private String library_group;
	private String library_seq;
	private String library_depth;
	private List<LibraryFileVO> items;
	
	public List<LibraryFileVO> getItems() {
		return items;
	}

	public void setItems(List<LibraryFileVO> items) {
		this.items = items;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getLibrary_no() {
		return library_no;
	}

	public void setLibrary_no(String library_no) {
		this.library_no = library_no;
	}

	public String getLibrary_title() {
		return library_title;
	}

	public void setLibrary_title(String library_title) {
		this.library_title = library_title;
	}

	public String getLibrary_writer() {
		return library_writer;
	}

	public void setLibrary_writer(String library_writer) {
		this.library_writer = library_writer;
	}

	public String getLibrary_nickname() {
		return library_nickname;
	}

	public void setLibrary_nickname(String library_nickname) {
		this.library_nickname = library_nickname;
	}

	public String getLibrary_pwd() {
		return library_pwd;
	}

	public void setLibrary_pwd(String library_pwd) {
		this.library_pwd = library_pwd;
	}

	public String getLibrary_mail() {
		return library_mail;
	}

	public void setLibrary_mail(String library_mail) {
		this.library_mail = library_mail;
	}

	public String getLibrary_ip() {
		return library_ip;
	}

	public void setLibrary_ip(String library_ip) {
		this.library_ip = library_ip;
	}

	public String getLibrary_content() {
		return library_content;
	}

	public void setLibrary_content(String library_content) {
		this.library_content = library_content;
	}

	public String getLibrary_hit() {
		return library_hit;
	}

	public void setLibrary_hit(String library_hit) {
		this.library_hit = library_hit;
	}

	public String getLibrary_reg_date() {
		return library_reg_date;
	}

	public void setLibrary_reg_date(String library_reg_date) {
		this.library_reg_date = library_reg_date;
	}

	public String getLibrary_status() {
		return library_status;
	}

	public void setLibrary_status(String library_status) {
		this.library_status = library_status;
	}

	public String getLibrary_group() {
		return library_group;
	}

	public void setLibrary_group(String library_group) {
		this.library_group = library_group;
	}

	public String getLibrary_seq() {
		return library_seq;
	}

	public void setLibrary_seq(String library_seq) {
		this.library_seq = library_seq;
	}

	public String getLibrary_depth() {
		return library_depth;
	}

	public void setLibrary_depth(String library_depth) {
		this.library_depth = library_depth;
	}

}
