package com.edu.vo;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {
	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private Integer view_count;
	private Integer reply_count;
	private Date reg_date;
	private Date update_date;
	private String board_type;
	//게시물 1개 등록시, 첨부파일 1개이상 필요, DB에 없는 필드 1개 만듬.
	private String[] save_file_names;//Null가능
	private String[] real_file_names;//Null가능
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", view_count=" + view_count + ", reply_count=" + reply_count + ", reg_date=" + reg_date
				+ ", update_date=" + update_date + ", board_type=" + board_type + ", save_file_names="
				+ Arrays.toString(save_file_names) + ", real_file_names=" + Arrays.toString(real_file_names) + "]";
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Integer getView_count() {
		return view_count;
	}
	public void setView_count(Integer view_count) {
		this.view_count = view_count;
	}
	public Integer getReply_count() {
		return reply_count;
	}
	public void setReply_count(Integer reply_count) {
		this.reply_count = reply_count;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String[] getSave_file_names() {
		return save_file_names;
	}
	public void setSave_file_names(String[] save_file_names) {
		this.save_file_names = save_file_names;
	}
	public String[] getReal_file_names() {
		return real_file_names;
	}
	public void setReal_file_names(String[] real_file_names) {
		this.real_file_names = real_file_names;
	}

	
	
}
