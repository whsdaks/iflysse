package com.iflysse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.iflysse.bean.ClassTime;
import com.iflysse.bean.Course;
import com.iflysse.bean.Subject;


public interface CourseDao {

	@Insert("insert into subject(s_name,class_hour,theory_class,practice_class,teacher,assistant,sclass,type,u_id) "
			+ "values (#{sName},#{classHour},#{theoryClass},#{practiceClass},#{teacher},#{assistant},#{sclass},#{type},#{uId})")
	void Insertsubject(Subject subject);
	
	
	@Select("select * from subject where u_id = #{uId}")
	List<Subject> getSubjectByUId(Integer uId);
	

	/*
	 * 修改课表
	 */
	@Select("select * from subject where s_id=#{sId}")
	public Subject getSubjectById(Integer sId);
	
	@Update("update subject set s_name=#{sName},class_hour=#{classHour},theory_class=#{theoryClass},"
			+ "practice_class=#{practiceClass},teacher=#{teacher},assistant=#{assistant},sclass=#{sclass},"
			+ "type=#{type} where s_id=#{sId}")
	public void updateSubject(Subject subject);


	/*
	 * 添加上课时间
	 */
	@Insert("insert into class_time(week_time,week,s_number,class_room,s_id) "
			+ "values(#{weekTime},#{week},#{sNumber},#{classRoom},#{sId})")
	void insrtclasstime(ClassTime classtime);
	
	/*
	 *查询上课时间 
	 */
	@Select("select * from class_time where s_id = #{sId} order by week_time")
	List<ClassTime> showCTime(Integer sId);

	/*
	 * 添加上课内容
	 */
	@Insert("insert into course(content,target,pattern,task,s_id) "
			+ "values(#{content},#{target},#{pattern},#{task},#{sId})")
	void addscourse(Course course);

	/*
	 * 查询时间id
	 * */
	@Select("select t_id from class_time order by week_time,week")
//			+ "where s_id = #{sId} and week_time=#{weekTime},week=#{week},s_number=#{sNumber},class_room=#{classRoom}")
	List<String> showT_id();
	
	/*
	 * 更新上课时间
	 * */
	@Update("update class_time set week_time=#{weekTime},week=#{week},s_number=#{sNumber},"
			+ "class_room=#{classRoom} where s_id=#{sId} and t_id=#{tId}")
	void upadteTime(ClassTime classtime);
	
	/*
	 * 获取总课时
	 */
	@Select("select class_hour from subject where s_id = #{sId}")
	Integer getHour(Integer sId);

	/*
	 * 通过sid查询具体课程内容（course）
	  */
	@Select("select * from course where s_id = #{sId} ")
	List<Course> showCourse(Integer sId);

	//查询上课内容id
	@Select("select c_id from course where s_id=#{sId}")
	List<String> showC_id(Integer sId);


	//保存修改上课内容
	@Update("update course set content=#{content},target=#{target},pattern=#{pattern},"
			+ "task=#{task} where c_id=#{cId} and s_id=#{sId}")
	void updateCourse(Course course);

	//删除课程列表
	@Delete("DELETE `subject`,course,class_time FROM `subject`\r\n" + 
			"  LEFT JOIN course ON `subject`.s_id=course.s_id\r\n" + 
			"	LEFT JOIN class_time ON course.s_id=class_time.s_id\r\n" + 
			"	WHERE `subject`.s_id=#{subject.sId}")
	void courseDel(Integer sIds);

	//移除某个上课时间
	@Delete("delete class_time where t_id=#{tId} and s_id=#{sId}")
	void deletetime(Integer tId);

}
