package com.itheima.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.common.utils.Page;
import com.itheima.core.dao.TextDao;
import com.itheima.core.po.Text;
import com.itheima.core.service.TextService;

/**
 * 客户管理
 */
@Service("textService")
@Transactional
public class TextServiceImpl implements TextService {
	// 声明DAO属性并注入
	@Autowired
	private TextDao textDao;


	@Override
	public Page<Text> gettext(Integer page, Integer rows) {
		// 当前页
		Text text = new Text();
				text.setStart((page - 1) * rows);
				// 每页数
				text.setRows(rows);
				// 查询客户列表
				List<Text> texts = textDao.gettext(text);
				// 查询客户列表总记录数
				Integer count = textDao.selecttextListCount(text);
				// 创建Page返回对象
				Page<Text> result = new Page<>();
				result.setPage(page);
				result.setRows(texts);
				result.setSize(rows);
				result.setTotal(count);
				return result;
	}

	@Override
	public int deletetext(Integer id) {
		int deletetext = textDao.deletetext(id);
		return deletetext;
	}

	@Override
	public int createtext(Text text) {
		int createtext = textDao.createtext(text);
		return createtext;
	}

	@Override
	public Text gettextById(Integer id) {
		Text textById = textDao.gettextById(id);
		return textById;
	}

}
