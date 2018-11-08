package com.itheima.core.web.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.common.utils.Page;
import com.itheima.core.po.BaseDict;
import com.itheima.core.po.Customer;
import com.itheima.core.po.Task;
import com.itheima.core.po.User;
import com.itheima.core.service.BaseDictService;
import com.itheima.core.service.CustomerService;
import com.itheima.core.service.UserService;

/**
 * 客户管理控制器类
 */
@Controller
public class CustomerController {
	// 依赖注入
	@Autowired
	private CustomerService customerService;
	@Autowired
	private UserService userService;
	@Autowired
	private BaseDictService baseDictService;
	// 客户来源
	@Value("${customer.from.type}")
	private String FROM_TYPE;
	// 客户所属行业
	@Value("${customer.industry.type}")
	private String INDUSTRY_TYPE;
	// 客户级别
	@Value("${customer.level.type}")
	private String LEVEL_TYPE;

	// 客户类型custType
	@Value("${customer.leibi.type}")
	private String LEIBI_TYPE;
	// 客户状态custState
	@Value("${customer.state.type}")
	private String STATE_TYPE;
	// 客户跟进进度custSchedule
	@Value("${customer.schedule.type}")
	private String SCHEDULE_TYPE;

	@RequestMapping(value = "/customer/list.action")
	public String list() {
		return "customer";
	}

	@RequestMapping(value = "/customer/left.action")
	public String left() {
		return "oneHomet";
	}
	
	@RequestMapping(value = "/customer/home.action")
	public String home() {
		return "PageHome";
	}

	/**
	 * 客户列表
	 */
	@RequestMapping(value = "/customer/list1.action")
	public String list1(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "13") Integer rows, String custName,
			String custSource, String custIndustry, String custLevel,
			String custType, String custState, String custSchedule, Model model) {

		// 条件查询所有客户
		Page<Customer> customers = customerService.findCustomerList(page, rows,
				custName, custSource, custIndustry, custLevel, custType,
				custState, custSchedule);
		model.addAttribute("page", customers);
		// 客户来源
		List<BaseDict> fromType = baseDictService
				.findBaseDictByTypeCode(FROM_TYPE);
		// 业务员
		List<BaseDict> industryType = baseDictService
				.findBaseDictByTypeCode(INDUSTRY_TYPE);
		// 客户级别
		List<BaseDict> levelType = baseDictService
				.findBaseDictByTypeCode(LEVEL_TYPE);
		// 客户类别
		List<BaseDict> leibiType = baseDictService
				.findBaseDictByTypeCode(LEIBI_TYPE);
		// 年营业额
		List<BaseDict> stateType = baseDictService
				.findBaseDictByTypeCode(STATE_TYPE);
		// 跟进进度
		List<BaseDict> scheduleType = baseDictService
				.findBaseDictByTypeCode(SCHEDULE_TYPE);
		// 添加参数
		model.addAttribute("fromType", fromType);
		model.addAttribute("industryType", industryType);
		model.addAttribute("levelType", levelType);
		model.addAttribute("custName", custName);
		model.addAttribute("custSource", custSource);
		model.addAttribute("custIndustry", custIndustry);
		model.addAttribute("custLevel", custLevel);
		model.addAttribute("leibiType", leibiType);
		model.addAttribute("stateType", stateType);
		model.addAttribute("scheduleType", scheduleType);
		return "content";
	} 

	/**
	 * 客户跟进进度
	 */
	@RequestMapping(value = "/customer/list2.action")
	public String list2(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "13") Integer rows, String custName,
			String custSource, String custIndustry, String custLevel,
			String custType, String custState, String custSchedule, Model model) {
		// 条件查询所有客户

		Page<Customer> customers = customerService.findCustomerList(page, rows,
				custName, custSource, custIndustry, custLevel, custType,
				custState, custSchedule);
		model.addAttribute("page", customers);
		// 客户类别
		List<BaseDict> leibiType = baseDictService
				.findBaseDictByTypeCode(LEIBI_TYPE);
		// 客年营业额
		List<BaseDict> stateType = baseDictService
				.findBaseDictByTypeCode(STATE_TYPE);
		// 业务员
		List<BaseDict> industryType = baseDictService
				.findBaseDictByTypeCode(INDUSTRY_TYPE);
		// 客户状态
		List<BaseDict> scheduleType = baseDictService
				.findBaseDictByTypeCode(SCHEDULE_TYPE);
		// 添加参数
		model.addAttribute("leibiType", leibiType);
		model.addAttribute("industryType", industryType);
		model.addAttribute("stateType", stateType);
		model.addAttribute("scheduleType", scheduleType);
		model.addAttribute("custName", custName);
		model.addAttribute("custSource", custSource);
		model.addAttribute("custIndustry", custIndustry);
		model.addAttribute("custLevel", custLevel);
		return "content_two";
	}

	/**
	 * 获取管理员信息
	 */
	@RequestMapping("/customer/info.action")
	public String getuser(Model model) {
		List<User> user = userService.getUser();
		model.addAttribute("page", user);
		return "InfoStatement";
	}

	/**
	 * 通过id获取管理员信息
	 */
	@RequestMapping("/customer/getUserById.action")
	@ResponseBody
	public User getuserById(Integer id) {
		User userByid = userService.getUserByid(id);
		return userByid;
	}

	/**
	 * 创建管理员
	 */
	@RequestMapping("/customer/usercreate.action")
	@ResponseBody
	public String userCreate(User user) {
		// 执行Service层中的创建方法，返回的是受影响的行数
		int rows = userService.createUser(user);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 更新管理员
	 */
	@RequestMapping("/customer/userUpdate.action")
	@ResponseBody
	public String userUpdate(User user) {
		int rows = userService.updateUser(user);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 删除管理员
	 */
	@RequestMapping("/customer/userDelete.action")
	@ResponseBody
	public String userDelete(Integer id) {
		int rows = userService.deleteUser(id);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 创建客户
	 */
	@RequestMapping("/customer/create.action")
	@ResponseBody
	public String customerCreate(Customer customer, HttpSession session) {
		// 获取Session中的当前用户信息
		User user = (User) session.getAttribute("USER_SESSION");
		// 将当前用户id存储在客户对象中
		customer.setCust_create_id(user.getUser_id());
		// 创建Date对象
		Date date = new Date();
		// 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
		Timestamp timeStamp = new Timestamp(date.getTime());
		customer.setCust_createtime(timeStamp);
		// 执行Service层中的创建方法，返回的是受影响的行数
		int rows = customerService.createCustomer(customer);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 通过id获取客户信息
	 */
	@RequestMapping("/customer/getCustomerById.action")
	@ResponseBody
	public Customer getCustomerById(Integer id) {
		Customer customer = customerService.getCustomerById(id);
		return customer;
	}

	/**
	 * 更新客户
	 */
	@RequestMapping("/customer/update.action")
	@ResponseBody
	public String customerUpdate(Customer customer) {
		int rows = customerService.updateCustomer(customer);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 删除客户
	 */
	@RequestMapping("/customer/delete.action")
	@ResponseBody
	public String customerDelete(Integer id) {
		int rows = customerService.deleteCustomer(id);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
