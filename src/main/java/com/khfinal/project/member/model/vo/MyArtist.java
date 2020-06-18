package com.khfinal.project.member.model.vo;

import java.io.Serializable;

public class MyArtist implements Serializable {

	private static final long serialVersionUID = 7136624584502980098L;
	
	private int ma_num;
	private String m_id;
	private String artist_nick;
	
	public MyArtist(int ma_num, String m_id, String artist_nick) {
		super();
		this.ma_num = ma_num;
		this.m_id = m_id;
		this.artist_nick = artist_nick;
	}

	public int getMa_num() {
		return ma_num;
	}

	public void setMa_num(int ma_num) {
		this.ma_num = ma_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getArtist_nick() {
		return artist_nick;
	}

	public void setArtist_nick(String artist_nick) {
		this.artist_nick = artist_nick;
	}

	@Override
	public String toString() {
		return "MyArtist [ma_num=" + ma_num + ", m_id=" + m_id + ", artist_nick=" + artist_nick + "]";
	}

}
