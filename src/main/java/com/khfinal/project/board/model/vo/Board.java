package com.khfinal.project.board.model.vo;


import java.sql.Date;



public class Board {


	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private Date noticeDate;
	private String noticeContent;
	private String original_filepath;
	private String rename_filepath;
	private String noticePassword; 
	
	public Board() {}

	public Board(int noticeNo, String noticeTitle, String noticeWriter, Date noticeDate, String noticeContent,
			String original_filepath, String rename_filepath, String noticePassword) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
		this.noticeContent = noticeContent;
		this.original_filepath = original_filepath;
		this.rename_filepath = rename_filepath;
		this.noticePassword = noticePassword;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
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

	public String getNoticePassword() {
		return noticePassword;
	}

	public void setNoticePassword(String noticePassword) {
		this.noticePassword = noticePassword;
	}

	@Override
	public String toString() {
		return "board [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeWriter=" + noticeWriter
				+ ", noticeDate=" + noticeDate + ", noticeContent=" + noticeContent + ", original_filepath="
				+ original_filepath + ", rename_filepath=" + rename_filepath + ", noticePassword=" + noticePassword
				+ "]";
	}
	
	
}
