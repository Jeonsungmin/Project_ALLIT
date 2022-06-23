package com.prj.edu.dto;

import java.sql.Date;

public class BoardDTO {

	private int board_idx;
	private String board_title;
	private String board_content;
	private Date board_date;
	private int board_hits;
	private String board_category;
	private boolean board_blind;
	private String mb_id;
	
	
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_hits() {
		return board_hits;
	}
	public void setBoard_hits(int board_hits) {
		this.board_hits = board_hits;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public boolean isBoard_blind() {
		return board_blind;
	}
	public void setBoard_blind(boolean board_blind) {
		this.board_blind = board_blind;
	}
	
	
	
	
	
}
