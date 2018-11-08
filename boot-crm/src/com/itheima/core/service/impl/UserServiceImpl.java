package com.itheima.core.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.core.dao.UserDao;
import com.itheima.core.po.User;
import com.itheima.core.service.UserService;
/**
 * 用户Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	// 注入UserDao
	@Autowired
	private UserDao userDao;
	// 通过账号和密码查询用户
	@Override
	public User findUser(String usercode, String password) {
		User user = this.userDao.findUser(usercode, password);
		return user;
	}
	@Override
	public int createUser(User user) {
		int createUser = userDao.createUser(user);
		return createUser;
	}
	@Override
	public List<User> getUser() {
		List<User> users = userDao.getUser();
		return users;
	}
	@Override
	public int updateUser(User user) {
		int updateUser = userDao.updateUser(user);
		return updateUser;
	}
	@Override
	public int deleteUser(Integer id) {
		int deleteUser = userDao.deleteUser(id);
		return deleteUser;
	}
	@Override
	public User getUserByid(Integer id) {
		User userByid = userDao.getUserByid(id);
		return userByid;
	}
	@Override
	public User getUserCode(String code) {
		User userCode = userDao.getUserCode(code);
		return userCode;
	}
}
