package com.itheima.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.common.utils.Page;
import com.itheima.core.dao.TaskDao;
import com.itheima.core.po.Task;
import com.itheima.core.service.TaskService;

/**
 * 客户管理
 */
@Service("TaskService")
@Transactional
public class TaskServiceImpl implements TaskService {
	// 声明DAO属性并注入
	@Autowired
	private TaskDao taskDao;


	@Override
	public Page<Task> getTask(Integer page, Integer rows) {
		// 当前页
		Task task = new Task();
				task.setStart((page - 1) * rows);
				// 每页数
				task.setRows(rows);
				// 查询客户列表
				List<Task> tasks = taskDao.getTask(task);
				// 查询客户列表总记录数
				Integer count = taskDao.selectTaskListCount(task);
				// 创建Page返回对象
				Page<Task> result = new Page<>();
				result.setPage(page);
				result.setRows(tasks);
				result.setSize(rows);
				result.setTotal(count);
				return result;
	}

	@Override
	public int deleteTask(Integer id) {
		int deleteTask = taskDao.deleteTask(id);
		return deleteTask;
	}

	@Override
	public int createTask(Task task) {
		int createTask = taskDao.createTask(task);
		return createTask;
	}

	@Override
	public Task getTaskById(Integer id) {
		Task taskById = taskDao.getTaskById(id);
		return taskById;
	}

}
