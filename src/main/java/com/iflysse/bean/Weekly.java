package com.iflysse.bean;

import java.util.Date;

public class Weekly {

	private Integer wId; //周期编号
	private String wConter; //周报内容	
	private String author; //填写人
	private Integer wNumber; //周报周数
	private Date time;
	
	
	
	public Weekly(String wConter, String author, Integer wNumber) {
		super();
		this.wConter = wConter;
		this.author = author;
		this.wNumber = wNumber;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	private Integer uId; //用户id
	
	public Integer getwId() {
		return wId;
	}
	public void setwId(Integer wId) {
		this.wId = wId;
	}
	public String getwConter() {
		return wConter;
	}
	public void setwConter(String wConter) {
		this.wConter = wConter;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public Integer getwNumber() {
		return wNumber;
	}
	public void setwNumber(Integer wNumber) {
		this.wNumber = wNumber;
	}
	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}
	
}
