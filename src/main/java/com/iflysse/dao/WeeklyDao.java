package com.iflysse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.iflysse.bean.Weekly;
import com.iflysse.bean.WeeklyQO;

public interface WeeklyDao {

	@Insert("insert into weekly(w_conter,author,w_number,u_id) values(#{wConter},#{author},#{wNumber},#{uId})")
	void insertweekly(Weekly weekly);

	/*
	 * 查询所有周报	
	 */
	
	/*
	 * @Select("SELECT DISTINCT (w_number) FROM weekly order by w_number") public
	 * List<Weekly> getWeeklyList();
	 */
	/*
	 * 预览周报详情	
	 */		
	@Select("select w_id,w_number,time,author,w_conter from weekly where w_id=#{wId}")
	public Weekly getWeeklyById(Integer wId);

	/*
	 * 高级查询周报
	 */
	public List<Weekly> queryweekly(WeeklyQO queyParam);
	
	/*
	 * 修改周报
	 */
	@Update("update weekly set w_conter = #{wConter},author = #{author},w_number = #{wNumber} where w_id=#{wId}")
	public void updateWeekly(Weekly weekly);

	/*
	 * 删除周报
	 */
	@Delete("delete from weekly where w_id=#{wId}")
	void weeklydel(Integer wId);

	/*
	 * 批量删除
	 */
	@Delete("delete from weekly where w_id=#{wId}")
	void deleteWeekly(Integer wId);

	/*
	 * 个人周报
	 */
	@Select("select w_id,w_number,time,author,w_conter from weekly where u_id = #{uId}")	
	List<Weekly> getWeeklyBywId(Integer uId);
	
	@Select("select* from weekly where w_id = #{wId}")
	Weekly weeklyInfo(Integer wId);
   //一键预览	
	  @Select("select distinct w_number from weekly order by w_number") 
	  List<Integer> getWeeklyList();
	 
	
	@Select("select w_id,w_number,time,author,w_conter from weekly where w_number = #{wNumber}")
	List<Weekly> weeklyInfoAll(Integer wNumber);

	

	

	
	
	

}
