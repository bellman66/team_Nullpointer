package com.khfinal.project.member.model.vo;

import java.io.Serializable;

public class MyArtist implements Serializable {

	private static final long serialVersionUID = 7136624584502980098L;
	
	private int ma_num;
	private String m_id;
	private String m_nickname;
	
	public MyArtist() {
		
	}
	
	public MyArtist(int ma_num, String m_id, String m_nickname) {
		super();
		this.ma_num = ma_num;
		this.m_id = m_id;
		this.m_nickname = m_nickname;
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

	public String getm_nickname() {
		return m_nickname;
	}

	public void setm_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	@Override
	public String toString() {
		return "MyArtist [ma_num=" + ma_num + ", m_id=" + m_id + ", m_nickname=" + m_nickname + "]";
	}

}
