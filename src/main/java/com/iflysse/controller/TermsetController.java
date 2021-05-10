package com.iflysse.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.iflysse.bean.TermSet;
import com.iflysse.bean.TermSetQO;
import com.iflysse.bean.User;
import com.iflysse.bean.UserQO;
import com.iflysse.dao.TermSetDao;

@Controller
public class TermsetController {
	
	@Autowired
	private TermSetDao termsetdao;	

	/*
	 * 创建学期
	 */
	@RequestMapping("/termset")
	public String BsLogin() {
		return "termSet";
	}
	/*
	 * 保存学期
	 */
	@RequestMapping("add_term")
	public String insertterm(TermSet termset) {
		termsetdao.inserttermset(termset);
		return "redirect:/term_all";	
	}
	/*
	 * 查询学期情况
	 * 
	 */
	@RequestMapping("termset_info")
	public String termsetInfo(Integer eId,HttpServletRequest request) {
		TermSet termset = termsetdao.getTermsetById(eId);
		//System.out.print("学期Id："+termset.geteId());
		request.setAttribute("termset", termset);
		return "homePage";
	}
	/*
	 * 显示全部学期
	 */
	@RequestMapping("/term_all")
	public String termAll(@RequestParam(defaultValue = "1") Integer page,HttpServletRequest request,TermSetQO queyParam) {
		int size = 5;
		Page<TermSet> termsetPage = PageHelper.startPage(page,size);
		List<TermSet> termset = termsetdao.queryTermset(queyParam);
		request.setAttribute("termset", termset);
		request.setAttribute("page", termsetPage.toPageInfo());
		return "termList";
	}
	/*
	 * 冻结学期
	 */
	@RequestMapping("term_frozen")
	public String  termdfrozen(Integer eId) {
		termsetdao.termFrozen(eId);
		return "redirect:/term_all";
	}
	
	/*
	 * 激活学期
	 */
	@RequestMapping("term_activate")
	public String  termactivate(Integer eId) {
		termsetdao.termActivate(eId);
		return "redirect:/term_all";
	}
	/*
	 * 删除学期（包括批量删除）
	 */
	@RequestMapping("/termset_del_batch")
	public String termsetDel(Integer[] eId) {		
			for(Integer eIds : eId) {
				termsetdao.termsetDel(eIds);
			}
			return "redirect:/term_all";
		}
					
}
