package com.itheima.core.po;

import java.util.Date;

public class Task {
	private Integer task_id;      //id 
	private String task_name;   //发布人
	private Date task_time;     //时间
	private String task_info;     //任务、信息
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
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
	public Integer getTask_id() {
		return task_id;
	}
	public void setTask_id(Integer task_id) {
		this.task_id = task_id;
	}
	public Date getTask_time() {
		return task_time;
	}
	public void setTask_time(Date task_time) {
		this.task_time = task_time;
	}
	public String getTask_info() {
		return task_info;
	}
	public void setTask_info(String task_info) {
		this.task_info = task_info;
	}
	
}
