package com.khfinal.project.board.model.vo;


import java.io.Serializable;
import java.sql.Date;



public class Board implements Serializable{


	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2570643417583448527L;
	
	private int b_category;
	private int b_num;
	private String m_id;
	private Date b_date;
	private String b_title;
	private String b_content;
	private String b_file;
	
	public Board(){}

	public Board(int b_category, int b_num, String m_id, Date b_date, String b_title, String b_content, String b_file) {
		super();
		this.b_category = b_category;
		this.b_num = b_num;
		this.m_id = m_id;
		this.b_date = b_date;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_file = b_file;
	}

	public int getB_category() {
		return b_category;
	}

	public void setB_category(int b_category) {
		this.b_category = b_category;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_file() {
		return b_file;
	}

	public void setB_file(String b_file) {
		this.b_file = b_file;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Board [b_category=" + b_category + ", b_num=" + b_num + ", m_id=" + m_id + ", b_date=" + b_date
				+ ", b_title=" + b_title + ", b_content=" + b_content + ", b_file=" + b_file + "]";
	}

	
	
	
	
}