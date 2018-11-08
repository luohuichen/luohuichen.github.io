package com.itheima.core.dao;
import java.util.List;

import com.itheima.core.po.Text;
/**
 * text接口
 */
public interface TextDao {

	//查看任务、信息
	public List<Text> gettext(Text text);
	public Integer selecttextListCount(Text text);
	// 删除任务
	int deletetext (Integer id);
	// 创建任务信息
	public int createtext(Text text);
	// 通过id查询任务信息
	public Text gettextById(Integer id);
}
