package com.khfinal.project.artist.model.vo;

import java.sql.Date;

//tb_artist_upload 관련
public class Artist {

	private int au_num;
	private String m_id;
	private String m_nickname;
	private Date au_date;
	private String au_content;
	private String au_file;
	private int au_like;
	
	private int ats_num;
	private String ats_start_date;
	private String ats_end_date;
	private String ats_content;
	private String ats_time;

	public Artist() {}

	public int getAu_num() {
		return au_num;
	}

	public void setAu_num(int au_num) {
		this.au_num = au_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public Date getAu_date() {
		return au_date;
	}

	public void setAu_date(Date au_date) {
		this.au_date = au_date;
	}

	public String getAu_content() {
		return au_content;
	}

	public void setAu_content(String au_content) {
		this.au_content = au_content;
	}

	public String getAu_file() {
		return au_file;
	}

	public void setAu_file(String au_file) {
		this.au_file = au_file;
	}

	public int getAu_like() {
		return au_like;
	}

	public void setAu_like(int au_like) {
		this.au_like = au_like;
	}

	public int getAts_num() {
		return ats_num;
	}

	public void setAts_num(int ats_num) {
		this.ats_num = ats_num;
	}

	public String getAts_start_date() {
		return ats_start_date;
	}

	public void setAts_start_date(String ats_start_date) {
		this.ats_start_date = ats_start_date;
	}

	public String getAts_end_date() {
		return ats_end_date;
	}

	public void setAts_end_date(String ats_end_date) {
		this.ats_end_date = ats_end_date;
	}

	public String getAts_content() {
		return ats_content;
	}

	public void setAts_content(String ats_content) {
		this.ats_content = ats_content;
	}

	public String getAts_time() {
		return ats_time;
	}

	public void setAts_time(String ats_time) {
		this.ats_time = ats_time;
	}

	@Override
	public String toString() {
		return "Artist [au_num=" + au_num + ", m_id=" + m_id + ", m_nickname=" + m_nickname + ", au_date=" + au_date
				+ ", au_content=" + au_content + ", au_file=" + au_file + ", au_like=" + au_like + ", ats_num="
				+ ats_num + ", ats_start_date=" + ats_start_date + ", ats_end_date=" + ats_end_date + ", ats_content="
				+ ats_content + ", ats_time=" + ats_time + "]";
	}
	
	
}
