package com.iflysse.bean;

import java.util.Date;

/**
 * 学期设置实体类
 * @author czl
 *@{date} 下午9:36:09
 *@edition bs1.0
 * @param bs1.0
 */
public class TermSet {
	private Integer eId; //学期编号
	private String eName; //学期名
	private Integer totalWeeks; //总周数
	private String startDate; //开始时间
	private String endDate; //结束时间
	private Integer eState; //学期状态
	public Integer geteId() {
		return eId;
	}
	public void seteId(Integer eId) {
		this.eId = eId;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public Integer getTotalWeeks() {
		return totalWeeks;
	}
	public void setTotalWeeks(Integer totalWeeks) {
		this.totalWeeks = totalWeeks;
	}
	
	
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Integer geteState() {
		return eState;
	}
	public void seteState(Integer eState) {
		this.eState = eState;
	}
	

}
