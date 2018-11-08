package com.itheima.core.po;

import java.util.Date;

public class Text {
	private Integer text_id;      //id 
	private String text_name;   //上传人
	private Date text_time;     //时间
	private String text_file;     //上传文件
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
	public Integer getText_id() {
		return text_id;
	}
	public void setText_id(Integer text_id) {
		this.text_id = text_id;
	}
	public String getText_name() {
		return text_name;
	}
	public void setText_name(String text_name) {
		this.text_name = text_name;
	}
	public Date getText_time() {
		return text_time;
	}
	public void setText_time(Date text_time) {
		this.text_time = text_time;
	}
	public String getText_file() {
		return text_file;
	}
	public void setText_file(String text_file) {
		this.text_file = text_file;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
}
