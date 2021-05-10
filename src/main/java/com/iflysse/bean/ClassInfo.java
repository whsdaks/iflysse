package com.iflysse.bean;

public class ClassInfo extends Course{

	private String weekTime; //上第几周的课
	private String week; //上课星期数
	private String sNumber;//上课节数
	private String classRoom; //上课教室
	


	public ClassInfo(String content, String target, String pattern, String task, Integer sId, String weekTime,
			String week, String sNumber, String classRoom) {
		super(content, target, pattern, task, sId);
		this.weekTime = weekTime;
		this.week = week;
		this.sNumber = sNumber;
		this.classRoom = classRoom;
	}



	public String getWeekTime() {
		return weekTime;
	}



	public void setWeekTime(String weekTime) {
		this.weekTime = weekTime;
	}



	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getsNumber() {
		return sNumber;
	}

	public void setsNumber(String sNumber) {
		this.sNumber = sNumber;
	}

	public String getClassRoom() {
		return classRoom;
	}

	public void setClassRoom(String classRoom) {
		this.classRoom = classRoom;
	}

	
	
	
}
