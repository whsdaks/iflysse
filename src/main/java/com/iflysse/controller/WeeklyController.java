package com.iflysse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.iflysse.bean.User;

import com.iflysse.bean.Weekly;
import com.iflysse.bean.WeeklyQO;
import com.iflysse.dao.WeeklyDao;

@Controller
public class WeeklyController {
	@Autowired
	private WeeklyDao weeklydao;

	/*
	 * 填写周报
	 */
	@RequestMapping("add_weekly")
	public String addWeekly() {
		return "add_weekly";
	}

	/*
	 * 保存周报
	 */
	@RequestMapping("save_weekly")
	public String insertWeekly(Weekly weekly) {
		weeklydao.insertweekly(weekly);
		return "redirect:/weeklymyself";
	}
	/*
	 * 个人周报预览
	 */
	@RequestMapping("weeklymyself")
	public String weeklymy(@RequestParam(defaultValue = "1") Integer page,
			HttpServletRequest request,HttpSession session) {	
		int size = 5;
		User user = (User)session.getAttribute("loginUser");
		System.out.println(user.getuId());
		Page<Weekly> weeklyPage = PageHelper.startPage(page, size);
		List<Weekly> weekly = weeklydao.getWeeklyBywId(user.getuId());
		request.setAttribute("weeklymyself", weekly);
		request.setAttribute("page", weeklyPage.toPageInfo());
		return "weeklyMyself";
	}

	/*
	 * 查看所有用户周报 
	 */
	@RequestMapping("weeklyList")
	public String weeklylist(@RequestParam(defaultValue = "1") Integer page, HttpServletRequest request,
			WeeklyQO queyParam) {
		int size = 5;
		Page<Weekly> weeklyPage = PageHelper.startPage(page, size);
		List<Weekly> weeklyList = weeklydao.queryweekly(queyParam);
		request.setAttribute("weeklyList", weeklyList);
		request.setAttribute("page", weeklyPage.toPageInfo());
		return "weeklyList";

	}

	/*
	 * 预览周报
	 */
	@RequestMapping("weeklyinfo")
	public String weeklyinfo(Integer wId, HttpServletRequest request) {
		Weekly weekly = weeklydao.weeklyInfo(wId);
		request.setAttribute("weekly", weekly);
		return "weeklyInfo";
	}

	/*
	 * 管理员编辑周报
	 */
	@RequestMapping("weekly_edit")
	public String weeklyedit(Integer wId, HttpServletRequest request) {
		Weekly weekly = weeklydao.getWeeklyById(wId);
		request.setAttribute("weekly", weekly);
		return "weeklyEdit";
	}

	/*
	 * 用户编辑周报
	 */
	@RequestMapping("weekly_edit2")
	public String weeklyedit2(Integer wId, HttpServletRequest request) {
		Weekly weekly = weeklydao.getWeeklyById(wId);
		request.setAttribute("weekly", weekly);
		return "weeklyEdit2";
	}
	/*
	 * 管理员保存编辑后的周报 
	 */
	@RequestMapping("/weekly_edit_save")
	public String weeklyUpdate(Weekly weekly) {
		System.out.println(weekly.getwNumber());
		weeklydao.updateWeekly(weekly);
		return "redirect:/weeklyList";
	}
	/*
	 * 用户个人保存编辑后的周报 
	 */
	@RequestMapping("/weekly_edit_save2")
	public String weeklyUpdate2(Weekly weekly) {
		System.out.println(weekly.getwNumber());
		weeklydao.updateWeekly(weekly);
		return "redirect:/weeklymyself";
	}

	/*
	 * 管理员删除用户周报
	 */
	@RequestMapping("weekl_del")
	public String weeklydel(Integer wId) {
		weeklydao.weeklydel(wId);
		return "redirect:/weeklyList";
	}
	/*
	 * 用户个人删除周报
	 */
	@RequestMapping("weekl_del2")
	public String weeklydel2(Integer wId) {
		weeklydao.weeklydel(wId);
		return "redirect:/weeklymyself";
	}
	/*
	 * 批量删除
	 */
	@RequestMapping("/weekly_del_batch")
	public String weeeklyDelete(Integer[] wIds) {
		for(Integer wId : wIds) {
			weeklydao.deleteWeekly(wId);
		}
		return "redirect:/weeklyList";
	}
	/*
	 * 一键预览周报	
	 */
	
	@RequestMapping("weekly_view")
	public String weeklyView(HttpServletRequest request) {
		List<Integer> weeklyList = weeklydao.getWeeklyList();
		//System.out.println(weekly.getwNumber());
		request.setAttribute("weeklylist", weeklyList);
		return "weeklyView";
	}
	/*
	 * 预览指定周数所有成员周报
	 */
	@RequestMapping("weeklyinfoall")
	public String weeklyinfoAll(Integer wNumber,HttpServletRequest request) {
		request.setAttribute("wNumber", wNumber);
		List<Weekly> weekly = weeklydao.weeklyInfoAll(wNumber);
		//System.out.println(weekly.get(0).getwNumber());
		request.setAttribute("weekly", weekly);
		return "weeklyInfoAll";
	}
	
	 
}
