package com.edu.vo;

import java.util.Date;

/**
 * 첨부파일 VO
 * @author 김영제
 *
 */
public class AttachVO {
	private String save_file_name;
	private String real_file_name;
	private Date reg_date;
	private int bno;
	
	@Override
	public String toString() {
		return "AttachVO [save_file_name=" + save_file_name + ", real_file_name=" + real_file_name + ", reg_date="
				+ reg_date + ", bno=" + bno + "]";
	}
	
	public String getSave_file_name() {
		return save_file_name;
	}
	public void setSave_file_name(String save_file_name) {
		this.save_file_name = save_file_name;
	}
	public String getReal_file_name() {
		return real_file_name;
	}
	public void setReal_file_name(String real_file_name) {
		this.real_file_name = real_file_name;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
}
