package com.khfinal.project.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MyRecord implements Serializable {

	private static final long serialVersionUID = 4903813529132794495L;
	
	private int mr_num;
	private String m_id;
	private int au_num;
	private String m_nickname;
	private Date mr_date;

	public MyRecord() {
		
	}

	public int getMr_num() {
		return mr_num;
	}

	public void setMr_num(int mr_num) {
		this.mr_num = mr_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getAu_num() {
		return au_num;
	}

	public void setAu_num(int au_num) {
		this.au_num = au_num;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public Date getMr_date() {
		return mr_date;
	}

	public void setMr_date(Date mr_date) {
		this.mr_date = mr_date;
	}

	@Override
	public String toString() {
		return "MyRecord [mr_num=" + mr_num + ", m_id=" + m_id + ", au_num=" + au_num + ", m_nickname=" + m_nickname
				+ ", mr_date=" + mr_date + "]";
	}
}
