package com.khfinal.project.artist.model.vo;

public class ArtistPlus {
	
	private int a_num;
	private String m_id;
	private String m_nickname;
	private String a_word;
	private int a_subscribe;
	
	public ArtistPlus() {
		
	}
	
	public ArtistPlus(int a_num, String m_id, String m_nickname, String a_word, int a_subscribe) {
		super();
		this.a_num = a_num;
		this.m_id = m_id;
		this.m_nickname = m_nickname;
		this.a_word = a_word;
		this.a_subscribe = a_subscribe;
	}

	public int getA_num() {
		return a_num;
	}

	public void setA_num(int a_num) {
		this.a_num = a_num;
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

	public String getA_word() {
		return a_word;
	}

	public void setA_word(String a_word) {
		this.a_word = a_word;
	}

	public int getA_subscribe() {
		return a_subscribe;
	}

	public void setA_subscribe(int a_subscribe) {
		this.a_subscribe = a_subscribe;
	}

	@Override
	public String toString() {
		return "ArtistPlus [a_num=" + a_num + ", m_id=" + m_id + ", m_nickname=" + m_nickname + ", a_word=" + a_word
				+ ", a_subscribe=" + a_subscribe + "]";
	}

}
