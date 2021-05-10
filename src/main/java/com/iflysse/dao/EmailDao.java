package com.iflysse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.iflysse.bean.Email;
import com.iflysse.bean.User;

public interface EmailDao {

	//查找用户邮箱
	@Select("select email from user")
	List<Email> selectemail(String email);

	@Update("update user set password='bs1111' where email=#{email}")
	void updEmail(User user);

	
	

}
