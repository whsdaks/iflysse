package com.iflysse.bean;


public class ClassTime {

	private Integer tId; //编号
	private String startTime; //上课开始周
	private String endTime; //上课结束周
	private String weekTime; //上第几周的课
	private String week; //上课星期数
	private String sNumber;//上课节数
	private String classRoom; //上课教室
	private Integer sId; //科目表id

	
	
	public ClassTime(String weekTime, String week, String sNumber, String classRoom,Integer sId) {
		super();
		this.weekTime = weekTime;
		this.week = week;
		this.sNumber = sNumber;
		this.classRoom = classRoom;
		this.sId = sId;
	}
	public ClassTime(String weekTime, String week, String sNumber, String classRoom,Integer sId,Integer tId) {
		super();
		this.weekTime = weekTime;
		this.week = week;
		this.sNumber = sNumber;
		this.classRoom = classRoom;
		this.sId = sId;
		this.tId = tId;
	}
	public Integer gettId() {
		return tId;
	}
	public void settId(Integer tId) {
		this.tId = tId;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
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
	public Integer getsId() {
		return sId;
	}
	public void setsId(Integer sId) {
		this.sId = sId;
	}
}
