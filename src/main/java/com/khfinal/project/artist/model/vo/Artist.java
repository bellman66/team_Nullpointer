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
	private int au_type;
	private String m_word;

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

	public int getAu_type() {
		return au_type;
	}

	public void setAu_type(int au_type) {
		this.au_type = au_type;
	}

	public String getM_word() {
		return m_word;
	}

	public void setM_word(String m_word) {
		this.m_word = m_word;
	}

	@Override
	public String toString() {
		return "Artist [au_num=" + au_num + ", m_id=" + m_id + ", m_nickname=" + m_nickname + ", au_date=" + au_date
				+ ", au_content=" + au_content + ", au_file=" + au_file + ", au_like=" + au_like + ", au_type="
				+ au_type + ",m_word=" + m_word + "]";
	}
}
