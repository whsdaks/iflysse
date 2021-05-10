package com.iflysse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.iflysse.bean.TermSet;
import com.iflysse.bean.TermSetQO;

public interface TermSetDao {

	@Insert("insert into semester(e_name,total_weeks,start_date,end_date,e_state) "
			+ "values(#{eName},#{totalWeeks},#{startDate},#{endDate},0)")
	void inserttermset(TermSet termset);

	/*
	 * 回显学期详细信息
	 */
	@Select("select e_id,e_name,total_weeks,start_date,end_date,e_state from semester where e_state =1")
	TermSet getTermsetById(Integer eId);

	/*
	 * 学期列表
	 */
	@Select("select e_id,e_name,total_weeks,start_date,end_date,e_state from semester")
	List<TermSet> getTermList();

	/*
	 * 冻结学期
	 */
	@Update("update semester set e_state = 0 where e_id = #{eId}")
	void termFrozen(Integer eId);

	/*
	 * 激活学期
	 */
	@Update("update semester set e_state = 1 where e_id = #{eId}")
	void termActivate(Integer eId);
	/*
	 * 高级查询
	 */
	public List<TermSet> queryTermset(TermSetQO queyParam);

	/*
	 * 删除学期
	 */
	@Delete("delete from semester where e_id=#{eId}")
	void termsetDel(Integer eId);
	
	/*
	 * 查询当前学期*/
	@Select("select start_date from semester where e_state = 1")
	String nowadays();

}
