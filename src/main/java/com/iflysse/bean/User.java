package com.iflysse.bean;

public class User {
	/**
	 * 
	 */
	private Integer uId; //用户id
	private String username; //用户名
	private String sex;  //性别
	private String password; //密码
	private String email; //邮箱
	private String phone; //电话
	private String realName;  //真实姓名
	private Integer uType;  //用户类型，1为经理，2为普通用户，0为管理员
	private Integer uState; //用户状态，1为正常，0为冻结
	
	public User() {}
	
	

	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Integer getuType() {
		return uType;
	}

	public void setuType(Integer uType) {
		this.uType = uType;
	}

	public Integer getuState() {
		return uState;
	}

	public void setuState(Integer uState) {
		this.uState = uState;
	}
	
		

}
