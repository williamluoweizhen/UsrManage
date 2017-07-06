package cn.edu.xmu.entity;

import java.util.Date;

/*
 * @author luowz
 * @date 20170608 
 */
public class User {
	//实体类：用户名，密码，性别，电话号码，邮箱地址
	private int id;
	private String username;
	private String password;
	private String sex;
	private String phone;
	private String email;
	private String role;
	
	
	public User(int id, String username, String password, String sex, String phone, String email, String role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.role = role;
	}

	public User(int id, String username, String password, String sex, String phone, String email) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
	}
	
	public User(String username, String password, String sex, String phone, String email) {
		super();
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
	}

	public User(int id, String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}
	public User(String username, String password, String role) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}
