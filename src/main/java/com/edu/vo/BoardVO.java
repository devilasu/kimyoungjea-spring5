package com.edu.vo;

import java.util.Date;

public class BoardVO {
	private int BNO;
	private String title;
	private String content;
	private String writer;
	private int view_count;
	private int reply_count;
	private Date reg_date;
	private Date update_date;
	private int board_type;
	
	@Override
	public String toString() {
		return "BoardVO [BNO=" + BNO + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", view_count=" + view_count + ", reply_count=" + reply_count + ", reg_date=" + reg_date
				+ ", update_date=" + update_date + ", board_type=" + board_type + "]";
	}
	public int getBNO() {
		return BNO;
	}
	public void setBNO(int bNO) {
		BNO = bNO;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
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
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
}
