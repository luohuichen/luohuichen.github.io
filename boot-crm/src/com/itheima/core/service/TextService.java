package com.itheima.core.service;

import com.itheima.common.utils.Page;
import com.itheima.core.po.Text;
public interface TextService {
	public Page<Text> gettext(Integer page, Integer rows);
	public int deletetext (Integer id);
	public int createtext(Text text);
	public Text gettextById(Integer id);
	
}
