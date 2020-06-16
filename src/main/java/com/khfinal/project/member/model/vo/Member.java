package com.khfinal.project.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {

	private static final long serialVersionUID = 8576434181485559346L;

	private String m_id;
	private String m_pass;
	private int m_class;
	private int m_rating;
	private String m_name;
	private String m_nickname;
	private int m_grade;
	// 전화번호 010,011,016...
	private String m_tell1;
	// 전화번호 중간4자리
	private String m_tell2;
	// 전화번호 끝4자리
	private String m_tell3;
	// 생일 YY
	private String bith_yy;
	// 생일MM
	private String bith_mm;
	// 생일DD
	private String bith_dd;
	// 이메일 아이디부분
	private String m_email1;
	// 이메일 주소부분
	private String m_email2;
	// 우편번호
	private String zipcode;
	// 주소1
	private String address;
	// 주소2
	private String address_etc;
	private Date m_join_date;
	private String m_leave_yn;
	private String original_filepath;
	private String rename_filepath;
	// artist 회원 전용 한줄소개
	private String m_word;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String m_id, String m_pass, int m_class, int m_rating, String m_name, String m_nickname, int m_grade,
			String m_tell1, String m_tell2, String m_tell3, String bith_yy, String bith_mm, String bith_dd,
			String m_email1, String m_email2, String zipcode, String address, String address_etc, Date m_join_date,
			String m_leave_yn, String original_filepath, String rename_filepath, String m_word) {
		super();
		this.m_id = m_id;
		this.m_pass = m_pass;
		this.m_class = m_class;
		this.m_rating = m_rating;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_grade = m_grade;
		this.m_tell1 = m_tell1;
		this.m_tell2 = m_tell2;
		this.m_tell3 = m_tell3;
		this.bith_yy = bith_yy;
		this.bith_mm = bith_mm;
		this.bith_dd = bith_dd;
		this.m_email1 = m_email1;
		this.m_email2 = m_email2;
		this.zipcode = zipcode;
		this.address = address;
		this.address_etc = address_etc;
		this.m_join_date = m_join_date;
		this.m_leave_yn = m_leave_yn;
		this.original_filepath = original_filepath;
		this.rename_filepath = rename_filepath;
		this.m_word = m_word;
	}

	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_pass=" + m_pass + ", m_class=" + m_class + ", m_rating=" + m_rating
				+ ", m_name=" + m_name + ", m_nickname=" + m_nickname + ", m_grade=" + m_grade + ", m_tell1=" + m_tell1
				+ ", m_tell2=" + m_tell2 + ", m_tell3=" + m_tell3 + ", bith_yy=" + bith_yy + ", bith_mm=" + bith_mm
				+ ", bith_dd=" + bith_dd + ", m_email1=" + m_email1 + ", m_email2=" + m_email2 + ", zipcode=" + zipcode
				+ ", address=" + address + ", address_etc=" + address_etc + ", m_join_date=" + m_join_date
				+ ", m_leave_yn=" + m_leave_yn + ", original_filepath=" + original_filepath + ", rename_filepath="
				+ rename_filepath + ", m_word=" + m_word + "]";
	}

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

	public int getM_rating() {
		return m_rating;
	}

	public void setM_rating(int m_rating) {
		this.m_rating = m_rating;
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

	public String getM_tell1() {
		return m_tell1;
	}

	public void setM_tell1(String m_tell1) {
		this.m_tell1 = m_tell1;
	}

	public String getM_tell2() {
		return m_tell2;
	}

	public void setM_tell2(String m_tell2) {
		this.m_tell2 = m_tell2;
	}

	public String getM_tell3() {
		return m_tell3;
	}

	public void setM_tell3(String m_tell3) {
		this.m_tell3 = m_tell3;
	}

	public String getBith_yy() {
		return bith_yy;
	}

	public void setBith_yy(String bith_yy) {
		this.bith_yy = bith_yy;
	}

	public String getBith_mm() {
		return bith_mm;
	}

	public void setBith_mm(String bith_mm) {
		this.bith_mm = bith_mm;
	}

	public String getBith_dd() {
		return bith_dd;
	}

	public void setBith_dd(String bith_dd) {
		this.bith_dd = bith_dd;
	}

	public String getM_email1() {
		return m_email1;
	}

	public void setM_email1(String m_email1) {
		this.m_email1 = m_email1;
	}

	public String getM_email2() {
		return m_email2;
	}

	public void setM_email2(String m_email2) {
		this.m_email2 = m_email2;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_etc() {
		return address_etc;
	}

	public void setAddress_etc(String address_etc) {
		this.address_etc = address_etc;
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

	public String getM_word() {
		return m_word;
	}

	public void setM_word(String m_word) {
		this.m_word = m_word;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}