package com.itheima.core.service;
import java.util.List;

import com.itheima.core.po.User;
/**
 * 用户Service层接口
 */
public interface UserService {
	// 通过账号和密码查询用户
	public User findUser(String usercode,String password);
	// 创建客户
		public int createUser(User user);
		// 查询客户
		public List<User> getUser();
		// 通过账号查询客户
		public User getUserCode(String code);
		public User getUserByid(Integer id);
		// 更新客户信息
		public int updateUser(User user);
		// 删除客户
		public int deleteUser (Integer id);
}
