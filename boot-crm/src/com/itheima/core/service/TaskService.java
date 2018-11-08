package com.itheima.core.service;

import com.itheima.common.utils.Page;
import com.itheima.core.po.Task;
public interface TaskService {
	//查看任务、信息
	public Page<Task> getTask(Integer page, Integer rows);
	// 删除任务
	public int deleteTask (Integer id);
	// 创建任务信息
	public int createTask(Task task);
		// 通过id查询任务信息
	public Task getTaskById(Integer id);
	
}
