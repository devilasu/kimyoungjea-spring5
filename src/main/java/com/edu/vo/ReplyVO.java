package com.edu.vo;

import java.util.Date;

/**
 * 이클래스는 댓글 처리 저장소
 * @author 김영제
 *
 */
public class ReplyVO {
	private Integer rno;
	private String reply_text;
	private String replyer;
	private Date reg_date;
	private Date update_date;
	private Integer bno;
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", reply_text=" + reply_text + ", replyer=" + replyer + ", reg_date=" + reg_date
				+ ", update_date=" + update_date + ", bno=" + bno + "]";
	}
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
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
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	
}
