package kr.or.ddit.vo;

import java.io.File;
import java.util.List;

public class QnAVO {
	
	private String rnum;
	private String qna_no;
	private String qna_title;
	private String qna_writer;
	private String qna_nickname;
	private String qna_pwd;
	private String qna_mail;
	private String qna_ip;
	private String qna_content;
	private String qna_hit;
	private String qna_reg_date;
	private String qna_status;
	private String qna_group;
	private String qna_seq;
	private String qna_depth;
	private List<QnAFileVO> items;
	
	private List<File> files;
	// 전송되는 파일 컨텐츠 타입
	// 변수명명 규칙 : 필드네임 + ContentType 
	private List<String> filesContentType;
	// 전송되는 파일명
	// 변수명명 규칙 : 필드네임 + FileName
	private List<String> filesFileName;
	
	
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public List<QnAFileVO> getItems() {
		return items;
	}
	public void setItems(List<QnAFileVO> items) {
		this.items = items;
	}
	public String getQna_no() {
		return qna_no;
	}
	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public String getQna_nickname() {
		return qna_nickname;
	}
	public void setQna_nickname(String qna_nickname) {
		this.qna_nickname = qna_nickname;
	}
	public String getQna_pwd() {
		return qna_pwd;
	}
	public void setQna_pwd(String qna_pwd) {
		this.qna_pwd = qna_pwd;
	}
	public String getQna_mail() {
		return qna_mail;
	}
	public void setQna_mail(String qna_mail) {
		this.qna_mail = qna_mail;
	}
	public String getQna_ip() {
		return qna_ip;
	}
	public void setQna_ip(String qna_ip) {
		this.qna_ip = qna_ip;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_hit() {
		return qna_hit;
	}
	public void setQna_hit(String qna_hit) {
		this.qna_hit = qna_hit;
	}
	public String getQna_reg_date() {
		return qna_reg_date;
	}
	public void setQna_reg_date(String qna_reg_date) {
		this.qna_reg_date = qna_reg_date;
	}
	public String getQna_status() {
		return qna_status;
	}
	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}
	public String getQna_group() {
		return qna_group;
	}
	public void setQna_group(String qna_group) {
		this.qna_group = qna_group;
	}
	public String getQna_seq() {
		return qna_seq;
	}
	public void setQna_seq(String qna_seq) {
		this.qna_seq = qna_seq;
	}
	public String getQna_depth() {
		return qna_depth;
	}
	public void setQna_depth(String qna_depth) {
		this.qna_depth = qna_depth;
	}
	public List<File> getFiles() {
		return files;
	}

	public List<String> getFilesContentType() {
		return filesContentType;
	}

	public List<String> getFilesFileName() {
		return filesFileName;
	}

	public void setFiles(List<File> files) {
		this.files = files;
	}

	public void setFilesContentType(List<String> filesContentType) {
		this.filesContentType = filesContentType;
	}

	public void setFilesFileName(List<String> filesFileName) {
		this.filesFileName = filesFileName;
	}
	
}
