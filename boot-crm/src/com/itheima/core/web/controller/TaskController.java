package com.itheima.core.web.controller;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.common.utils.Page;
import com.itheima.core.po.Task;
import com.itheima.core.service.BaseDictService;
import com.itheima.core.service.TaskService;

/**
 * 客户管理控制器类
 */
@Controller
public class TaskController {
	// 依赖注入
	@Autowired
	private TaskService taskService;
	@Autowired
	private BaseDictService baseDictService;

	

	//任务、信息列表
	@RequestMapping(value = "/task/task.action")
	public String task(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows, Model model) {
		Page<Task> task = taskService.getTask(page, rows);
		model.addAttribute("page", task);
		return "task";
	}
	/**
	 * 通过id获取任务信息信息
	 */
	@RequestMapping("/task/gettaskById.action")
	@ResponseBody
	public Task getTaskById(Integer id) {
		Task TaskByid = taskService.getTaskById(id);
		// 得到一个时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		 sdf.format(TaskByid.getTask_time());
		return TaskByid;
	}
	
	/**
	 * 创建任务信息
	 */
	@RequestMapping("/task/taskcreate.action")
	@ResponseBody
	public String taskCreate(Task task) {
		// 创建Date对象
		Date date = new Date();
		// 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
		Timestamp timeStamp = new Timestamp(date.getTime());
		task.setTask_time(timeStamp);
		// 执行Service层中的创建方法，返回的是受影响的行数
		int rows = taskService.createTask(task);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	/**
	 * 删除任务信息
	 */
	@RequestMapping("/task/taskdelete.action")
	@ResponseBody
	public String taskDelete(Integer id) {
		int rows = taskService.deleteTask(id);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
