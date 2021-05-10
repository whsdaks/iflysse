package com.iflysse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.iflysse.bean.Email;
import com.iflysse.bean.User;
import com.iflysse.bean.UserQO;

public interface UserDao {
	
	
	/*
	 * 查询所有用户
	 */
	@Select("select u_id,username,email,phone,u_type from user where u_state != 0")
	public List<User> getUserlist();
	/*
	 * 新增用户
	 */
	@Insert("insert into user(username,real_name,password,sex,u_type,u_state) values(#{username},#{realName},#{password},#{sex},#{uType},#{uState})")
	public void insertUser(User user);
	
	/*
	 * 删除用户(此功能停用)
	 */
	/*
	 * @Delete("delete from user where u_id=#{uId}") public void deleteUser(Integer
	 * uId);
	 */
	/*
	 * 管理员查看用户信息
	 */
	@Select("select u_id,username,sex,password,email,phone,real_name,u_type,u_state from user where u_id = #{uId}")
	public User getUserById(Integer uId);
	//修改个人信息（管理员权限）
	@Update("update user set username=#{username},real_name=#{realName},sex=#{sex},"
			+ "email=#{email},phone=#{phone},password=#{password},u_type=#{uType},u_state=#{uState} where u_id=#{uId}")
	public void updateUser(User user);
	
	/*
	 * 管理员冻结用户
	 */
	@Update("update user set u_state=0 where u_id=#{uId}")
	public void frozenUser(Integer uId);
	
	/*
	 * 管理员激活用户
	 */
	@Update("update user set u_state=1 where u_id=#{uId}")
	public void updUserState(Integer uId);

	@Select("select * from user where username=#{username} and u_state != 0")
	public User getUserByusername(String username);

	
	/*
	 * 高级查询所有用户
	 */
	public List<User> queryUser(UserQO queyParam);
	
	@Select("select u_id,username,email,phone,u_type from user where u_id=#{loginUser.uId} and u_state != 0")
	public User getUserByIdshow(Integer uId);
	
	
	/*
	 * 修改密码
	 */
	@Update("update user set password=#{password} where u_id=#{uId}")
	public void updatepwd( @Param("uId")Integer uId, @Param("password")String password);
	/*
	 * 修改个人信息（用户个人权限）
	 */
	@Update("update user set sex=#{sex},phone=#{phone},email=#{email} where u_id=#{uId}")
	public void updateMyinfo(User user);
	
	
	
	
	
	/*
	 * 分页查询
	 */
}
