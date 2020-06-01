package com.khfinal.project.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class member implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4716941557157787677L;
	
	private String m_id;
	private String m_pass;
	private int m_class;
	private String m_name;
	private String m_nickname;
	private int m_grade;
	private String m_tell;
	private String m_email;
	private Date m_join_date;
	private String m_leave_yn;
	private String original_filepath;
	private String rename_filepath;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public int getM_class() {
		return m_class;
	}
	public void setM_class(int m_class) {
		this.m_class = m_class;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_tell() {
		return m_tell;
	}
	public void setM_tell(String m_tell) {
		this.m_tell = m_tell;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public Date getM_join_date() {
		return m_join_date;
	}
	public void setM_join_date(Date m_join_date) {
		this.m_join_date = m_join_date;
	}
	public String getM_leave_yn() {
		return m_leave_yn;
	}
	public void setM_leave_yn(String m_leave_yn) {
		this.m_leave_yn = m_leave_yn;
	}
	public String getOriginal_filepath() {
		return original_filepath;
	}
	public void setOriginal_filepath(String original_filepath) {
		this.original_filepath = original_filepath;
	}
	public String getRename_filepath() {
		return rename_filepath;
	}
	public void setRename_filepath(String rename_filepath) {
		this.rename_filepath = rename_filepath;
	}
	@Override
	public String toString() {
		return "member [m_id=" + m_id + ", m_pass=" + m_pass + ", m_class=" + m_class + ", m_name=" + m_name
				+ ", m_nickname=" + m_nickname + ", m_grade=" + m_grade + ", m_tell=" + m_tell + ", m_email=" + m_email
				+ ", m_join_date=" + m_join_date + ", m_leave_yn=" + m_leave_yn + ", original_filepath="
				+ original_filepath + ", rename_filepath=" + rename_filepath + "]";
	}

}
