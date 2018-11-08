package com.itheima.core.po;
import java.io.Serializable;
import java.util.Date;
/**
 * 客户持久化类
 */
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer cust_id;          // 客户编号
	private String cust_name;         // 客户名称
	private Integer cust_user_id;    // 负责人id
	private Integer cust_create_id;  // 创建人id
	private String cust_source;      // 客户信息来源
	private String cust_industry;    // 业务员
	private String cust_type;       // 客户类型
	private String cust_state;       // 年营业额
	private String cust_schedule;       //客户状态
	private String cust_level;       // 客户级别
	private String cust_linkman;     // 联系人
	private String cust_phone;       // 固定电话
	private String cust_mobile;      // 移动电话
	private String cust_zipcode;     // 邮政编码
	private String cust_address;     // 联系地址
	private Date cust_createtime;    // 跟进时间	
	private String cust_progress;      //最新进展
	private Integer start;            // 起始行
	private Integer rows;             // 所取行数
	
	public String getCust_progress() {
		return cust_progress;
	}
	public void setCust_progress(String cust_progress) {
		this.cust_progress = cust_progress;
	}
	public String getCust_type() {
		return cust_type;
	}
	public void setCust_type(String cust_type) {
		this.cust_type = cust_type;
	}
	public String getCust_state() {
		return cust_state;
	}
	public void setCust_state(String cust_state) {
		this.cust_state = cust_state;
	}
	public String getCust_schedule() {
		return cust_schedule;
	}
	public void setCust_schedule(String cust_schedule) {
		this.cust_schedule = cust_schedule;
	}
	public String getCust_zipcode() {
		return cust_zipcode;
	}
	public void setCust_zipcode(String cust_zipcode) {
		this.cust_zipcode = cust_zipcode;
	}
	public String getCust_address() {
		return cust_address;
	}
	public void setCust_address(String cust_address) {
		this.cust_address = cust_address;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getCust_id() {
		return cust_id;
	}
	public void setCust_id(Integer cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public Integer getCust_user_id() {
		return cust_user_id;
	}
	public void setCust_user_id(Integer cust_user_id) {
		this.cust_user_id = cust_user_id;
	}
	public Integer getCust_create_id() {
		return cust_create_id;
	}
	public void setCust_create_id(Integer cust_create_id) {
		this.cust_create_id = cust_create_id;
	}
	public String getCust_source() {
		return cust_source;
	}
	public void setCust_source(String cust_source) {
		this.cust_source = cust_source;
	}
	public String getCust_industry() {
		return cust_industry;
	}
	public void setCust_industry(String cust_industry) {
		this.cust_industry = cust_industry;
	}
	public String getCust_level() {
		return cust_level;
	}
	public void setCust_level(String cust_level) {
		this.cust_level = cust_level;
	}
	public String getCust_linkman() {
		return cust_linkman;
	}
	public void setCust_linkman(String cust_linkman) {
		this.cust_linkman = cust_linkman;
	}
	public String getCust_phone() {
		return cust_phone;
	}
	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}
	public String getCust_mobile() {
		return cust_mobile;
	}
	public void setCust_mobile(String cust_mobile) {
		this.cust_mobile = cust_mobile;
	}
	public Date getCust_createtime() {
		return cust_createtime;
	}
	public void setCust_createtime(Date cust_createtime) {
		this.cust_createtime = cust_createtime;
	}
}
