package com.iflysse.bean;

import java.util.Date;

public class Subject {

	private Integer sId; //科目编号
	private String sName;  //科目名称
	private Integer classHour; //总课时
	private Integer theoryClass; //理论课时
	private Integer practiceClass; //实践课时
	private String teacher; //授课教师
	private String assistant; //助教
	private String sclass; //班级
	private Integer type; //科目类型，1为方向课·，0为基础课
	private Integer uId; //用户id
	private Date addTime; //添加课程的时间
	

	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}
	public Integer getsId() {
		return sId;
	}
	public void setsId(Integer sId) {
		this.sId = sId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public Integer getClassHour() {
		return classHour;
	}
	public void setClassHour(Integer classHour) {
		this.classHour = classHour;
	}
	public Integer getTheoryClass() {
		return theoryClass;
	}
	public void setTheoryClass(Integer theoryClass) {
		this.theoryClass = theoryClass;
	}
	public Integer getPracticeClass() {
		return practiceClass;
	}
	public void setPracticeClass(Integer practiceClass) {
		this.practiceClass = practiceClass;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getAssistant() {
		return assistant;
	}
	public void setAssistant(String assistant) {
		this.assistant = assistant;
	}
	
	public Integer gettype() {
		return type;
	}
	public void settype(Integer type) {
		this.type = type;
	}
	public String getSclass() {
		return sclass;
	}
	public void setSclass(String sclass) {
		this.sclass = sclass;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	
	
	
}
