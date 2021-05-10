package com.iflysse.bean;

public class Course {

	private Integer cId;
	private String target; //课程目标
	private String content;//课程内容
	private String pattern;//教学模式，1为授课线下，0为实践线上
	private String task; //作业，1为有作业，0为无作业
	private Integer sId; //科目表id
	
	public Course(String content, String target, String pattern, String task,Integer sId) {
		super();
		this.target = target;
		this.content = content;
		this.pattern = pattern;
		this.task = task;
		this.sId = sId;
	}
	public Course(String content, String target, String pattern, String task, Integer sId, Integer cId) {
		this.target = target;
		this.content = content;
		this.pattern = pattern;
		this.task = task;
		this.sId = sId;
		this.cId = cId;
	}
	public Integer getcId() {
		return cId;
	}
	public void setcId(Integer cId) {
		this.cId = cId;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getPattern() {
		return pattern;
	}
	public void setPattern(String pattern) {
		this.pattern = pattern;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public Integer getsId() {
		return sId;
	}
	public void setsId(Integer sId) {
		this.sId = sId;
	}
}
