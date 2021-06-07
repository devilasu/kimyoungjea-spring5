package com.edu.vo;

import java.util.Date;

/**
 * 이 클래스는 DB에서 Model클래스로 입출력할 때,
 * Model에서 Service클래스로 입출력할 때,
 * Service에서 Controller클래스로 데이터를 입출력할 때,
 * Controller에서 JSP로 데이터를 주고받을 때,
 * 사용하는 데이터클래스 입니다.
 * 
 * @author 김영제
 *
 */
public class MemberVO {
	//ERD보고 멤버변수를 만듭니다.
	private String user_id;
	private String user_pw;
	private String user_name;
	private String email;
	private Integer m_point;//Integer null도 가능
	private Boolean enabled;//Boolean null도 가능
	private String m_level;
	private Date reg_date;
	private Date Update_date;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getM_point() {
		return m_point;
	}
	public void setM_point(Integer m_point) {
		this.m_point = m_point;
	}
	public Boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	public String getM_level() {
		return m_level;
	}
	public void setM_level(String m_level) {
		this.m_level = m_level;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUpdate_date() {
		return Update_date;
	}
	public void setUpdate_date(Date update_date) {
		Update_date = update_date;
	}
}
