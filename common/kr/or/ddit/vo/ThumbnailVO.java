package kr.or.ddit.vo;

import java.util.List;

public class ThumbnailVO {
	private String rnum;
	private String thumbnail_no;
	private String thumbnail_title;
	private String thumbnail_writer;
	private String thumbnail_nickname;
	private String thumbnail_pwd;
	private String thumbnail_mail;
	private String thumbnail_ip;
	private String thumbnail_content;
	private String thumbnail_hit;
	private String thumbnail_reg_date;
	private String thumbnail_status;
	private List<ThumbnailFileVO> items;
	
	public String getRnum() {
		return rnum;
	}	
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public List<ThumbnailFileVO> getItems() {
		return items;
	}
	public void setItems(List<ThumbnailFileVO> items) {
		this.items = items;
	}
	public String getThumbnail_no() {
		return thumbnail_no;
	}
	public void setThumbnail_no(String thumbnail_no) {
		this.thumbnail_no = thumbnail_no;
	}
	public String getThumbnail_title() {
		return thumbnail_title;
	}
	public void setThumbnail_title(String thumbnail_title) {
		this.thumbnail_title = thumbnail_title;
	}
	public String getThumbnail_writer() {
		return thumbnail_writer;
	}
	public void setThumbnail_writer(String thumbnail_writer) {
		this.thumbnail_writer = thumbnail_writer;
	}
	public String getThumbnail_nickname() {
		return thumbnail_nickname;
	}
	public void setThumbnail_nickname(String thumbnail_nickname) {
		this.thumbnail_nickname = thumbnail_nickname;
	}
	public String getThumbnail_pwd() {
		return thumbnail_pwd;
	}
	public void setThumbnail_pwd(String thumbnail_pwd) {
		this.thumbnail_pwd = thumbnail_pwd;
	}
	public String getThumbnail_mail() {
		return thumbnail_mail;
	}
	public void setThumbnail_mail(String thumbnail_mail) {
		this.thumbnail_mail = thumbnail_mail;
	}
	public String getThumbnail_ip() {
		return thumbnail_ip;
	}
	public void setThumbnail_ip(String thumbnail_ip) {
		this.thumbnail_ip = thumbnail_ip;
	}
	public String getThumbnail_content() {
		return thumbnail_content;
	}
	public void setThumbnail_content(String thumbnail_content) {
		this.thumbnail_content = thumbnail_content;
	}
	public String getThumbnail_hit() {
		return thumbnail_hit;
	}
	public void setThumbnail_hit(String thumbnail_hit) {
		this.thumbnail_hit = thumbnail_hit;
	}
	public String getThumbnail_reg_date() {
		return thumbnail_reg_date;
	}
	public void setThumbnail_reg_date(String thumbnail_reg_date) {
		this.thumbnail_reg_date = thumbnail_reg_date;
	}
	public String getThumbnail_status() {
		return thumbnail_status;
	}
	public void setThumbnail_status(String thumbnail_status) {
		this.thumbnail_status = thumbnail_status;
	}
	
	
}
