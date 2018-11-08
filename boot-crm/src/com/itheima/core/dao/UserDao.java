package com.itheima.core.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.core.po.Customer;
import com.itheima.core.po.User;
/**
 * 用户DAO层接口
 */
public interface UserDao {
	/**
	 * 通过账号和密码查询用户
	 */
	public User findUser(@Param("usercode") String usercode,
			                @Param("password") String password);
	
	
	// 创建客户
	public int createUser(User user);
	// 查询客户
	public List<User> getUser();
	// 通过id查询客户
	public User getUserByid(Integer id);
	// 通过账号查询客户
	public User getUserCode(String code);
	// 更新客户信息
	public int updateUser(User user);
	// 删除客户
	int deleteUser (Integer id);

}
