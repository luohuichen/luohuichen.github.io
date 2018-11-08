package com.itheima.core.web.controller;


import java.io.File;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itheima.common.utils.Page;
import com.itheima.core.po.Text;
import com.itheima.core.service.BaseDictService;
import com.itheima.core.service.TextService;

/**
 * 客户管理控制器类
 */
@Controller
public class TextController {
	// 依赖注入
	@Autowired
	private TextService textService;
	@Autowired
	private BaseDictService baseDictService;

	

	//任务、信息列表
	@RequestMapping(value = "/text/text.action")
	public String text(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows, Model model) {
		Page<Text> text = textService.gettext(page, rows);
		model.addAttribute("page", text);
		return "text";
	}
	/**
	 * 通过id获取文件信息
	 */
	@RequestMapping("/text/gettextById.action")
	@ResponseBody
	public Text gettextById(Integer id) {
		Text textByid = textService.gettextById(id);
		Date date = new Date();
		// 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
		Timestamp timeStamp = new Timestamp(date.getTime());
		textByid.setText_time(timeStamp);
		return textByid;
	}
	
	/**
	 * 创建文件
	 */
	@RequestMapping("/text/textcreate.action")
	@ResponseBody
	public String textCreate(@RequestParam(required = false ,value = "name") String name,@RequestParam(required = false ,value = "file") List<MultipartFile> files,HttpServletRequest request) {
		Text text = new Text();
		// 创建Date对象
		Date date = new Date();
		// 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
		Timestamp timeStamp = new Timestamp(date.getTime());
		text.setText_time(timeStamp);
		text.setText_name(name);
		//判断文件是否存在
		if (!files.isEmpty() && files.size() > 0) {
			//循环输出上传的文件
			for (MultipartFile multipartFile : files) {
				//获取上传文件的原始名称
				String originalFilename = multipartFile.getOriginalFilename();
				//设置上传文件的保存地址目录
				String realPath = request.getServletContext().getRealPath("/upload/");
				File filepath = new File(realPath);
				if (!filepath.exists()) {
					filepath.mkdirs();
				}
				try {
					multipartFile.transferTo(new File(realPath + originalFilename));
				} catch (Exception e) {
					return "FAIL";
				}
				text.setText_file(originalFilename);
				int createtext = textService.createtext(text);
				if (createtext>0) {
					return "OK";
				}
				else {
					return "FAIL";
				}
			}
			return "OK";
		}
		else {
			return "FAIL";
		}
	}
	

	@RequestMapping("/text/download.action")
	public ResponseEntity<byte[]> fileDownload(HttpServletRequest request,
	                                           String filename) throws Exception{
	    // 指定要下载的文件所在路径
	    String path = request.getServletContext().getRealPath("/upload/");
	    // 创建该文件对象
	    File file = new File(path+File.separator+filename);
	    // 对文件名编码，防止中文文件乱码
	    filename = this.getFilename(request, filename);
	    // 设置响应头
	    HttpHeaders headers = new HttpHeaders();
	    // 通知浏览器以下载的方式打开文件
	    headers.setContentDispositionFormData("attachment", filename);
	    // 定义以流的形式下载返回文件数据
	    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	    // 使用Sring MVC框架的ResponseEntity对象封装返回下载数据
	   return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
	                                           headers,HttpStatus.OK);
	}
	/**
	 * 根据浏览器的不同进行编码设置，返回编码后的文件名
	 */
	public String getFilename(HttpServletRequest request,
	                                            String filename) throws Exception { 
	    // IE不同版本User-Agent中出现的关键词
	    String[] IEBrowserKeyWords = {"MSIE", "Trident", "Edge"};  
	    // 获取请求头代理信息
	    String userAgent = request.getHeader("User-Agent");  
	    for (String keyWord : IEBrowserKeyWords) { 
	         if (userAgent.contains(keyWord)) { 
	              //IE内核浏览器，统一为UTF-8编码显示
	              return URLEncoder.encode(filename, "UTF-8");
	         }
	    }  
	    //火狐等其它浏览器统一为ISO-8859-1编码显示
	    return new String(filename.getBytes("UTF-8"), "ISO-8859-1");  
	}  

	/**
	 * 删除文件
	 */
	@RequestMapping("/text/textdelete.action")
	@ResponseBody
	public String textDelete(Integer id) {
		int rows = textService.deletetext(id);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
