package com.itheima.core.dao;
import java.util.List;

import com.itheima.core.po.Task;
/**
 * Task接口
 */
public interface TaskDao {

	//查看任务、信息
	public List<Task> getTask(Task task);
	public Integer selectTaskListCount(Task task);
	// 删除任务
	int deleteTask (Integer id);
	// 创建任务信息
	public int createTask(Task task);
	// 通过id查询任务信息
	public Task getTaskById(Integer id);
}
