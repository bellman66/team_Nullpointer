package com.khfinal.project.schedule.model.vo;

import java.io.Serializable;

public class Schedule implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2412565476416110915L;
	private int as_num;
	private String m_id;
	private String as_start_date;
	private String as_end_date;
	private String as_content;
	private String as_time;
	private String as_rent;
	
	public Schedule() {}

	public Schedule(int as_num, String m_id, String as_start_date, String as_end_date, String as_content,
			String as_time, String as_rent) {
		super();
		this.as_num = as_num;
		this.m_id = m_id;
		this.as_start_date = as_start_date;
		this.as_end_date = as_end_date;
		this.as_content = as_content;
		this.as_time = as_time;
		this.as_rent = as_rent;
	}

	public int getAs_num() {
		return as_num;
	}

	public void setAs_num(int as_num) {
		this.as_num = as_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getAs_start_date() {
		return as_start_date;
	}

	public void setAs_start_date(String as_start_date) {
		this.as_start_date = as_start_date;
	}

	public String getAs_end_date() {
		return as_end_date;
	}

	public void setAs_end_date(String as_end_date) {
		this.as_end_date = as_end_date;
	}

	public String getAs_content() {
		return as_content;
	}

	public void setAs_content(String as_content) {
		this.as_content = as_content;
	}

	public String getAs_time() {
		return as_time;
	}

	public void setAs_time(String as_time) {
		this.as_time = as_time;
	}

	public String getAs_rent() {
		return as_rent;
	}

	public void setAs_rent(String as_rent) {
		this.as_rent = as_rent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Schedule [as_num=" + as_num + ", m_id=" + m_id + ", as_start_date=" + as_start_date + ", as_end_date="
				+ as_end_date + ", as_content=" + as_content + ", as_time=" + as_time + ", as_rent=" + as_rent + "]";
	}

	
	
	
	
}
