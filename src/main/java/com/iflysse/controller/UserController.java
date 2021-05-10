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
import com.iflysse.bean.UserQO;
import com.iflysse.dao.UserDao;

/**
 * 用户控制器
 * @author czl
 *@{date} 下午3:04:14
 *@edition bs1.0
 * @param bs1.0
 */
@Controller
public class UserController {

	@Autowired
	private UserDao userdao;

	/* 查看所有用户 */
	@RequestMapping("userlist")
	public String user_list(@RequestParam(defaultValue = "1") Integer page, HttpServletRequest request,
			UserQO queyParam) {
		int size = 5;
		/* Page<User> userPage = PageHelper.startPage(page.SIZE); */
		Page<User> userPage = PageHelper.startPage(page, size);

		List<User> userList = userdao.queryUser(queyParam);
		request.setAttribute("userList", userList);
		request.setAttribute("page", userPage.toPageInfo());
		return "userList";
	}

	/* 查看个人信息 */
	@RequestMapping("userinfo")
	public String user_info(Integer uId, HttpServletRequest request) {
		User user = userdao.getUserByIdshow(uId);
		request.setAttribute("user", user);
		return "showSecret";
	}
	
	/* 完善个人信息页面 */
	@RequestMapping("my_info")
	public String my_info( HttpServletRequest request,HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		request.setAttribute("user", loginUser);
		return "refineInfo";
	}
	
	/*
	 * 保存完善的个人信息（用户个人权限）	 
	 */
	@RequestMapping("/save_myinfo")
	public String Updatemyinfo(User user,HttpSession session) {
		userdao.updateMyinfo(user);
		session.setAttribute("loginUser", user);
		return "redirect:/userinfo";
	}
	

	/**
	 * 
	 * @return 新增用户
	 */
	@RequestMapping("add_user")
	public String adduser() {
		return "add_user";
	}
	@RequestMapping("add_user_save")
	public String saveUser(User user) {
		System.out.println("新增用户");
		user.setuState(1); // 用户默认状态
		userdao.insertUser(user);
		return "redirect:/userlist";
	}

	/*
	 * 删除用户(此功能停用)
	 * 
	 * @RequestMapping("/user_del") public String userDelete(Integer uId) {
	 * System.out.println("id:"+uId); userdao.deleteUser(uId); return
	 * "redirect:/userlist"; }
	 */
	/*
	 * 管理员查看用户信息
	 */
	@RequestMapping("/user_info")
	public String toInfo(Integer uId, HttpServletRequest request) {
		// UserDao dao=new UserDao();
		User user = userdao.getUserById(uId);
		//System.out.print("用户权限"+user.getuState());
		request.setAttribute("user", user);
		return "userInfo";
	}

	/*
	 * 管理员修改用户
	 */
	@RequestMapping("user_edit")
	public String userupdate(Integer uId, HttpServletRequest request) {
		User user = userdao.getUserById(uId);
		request.setAttribute("user", user);
		return "userEdit";
	}

	@RequestMapping("/user_edit_save")
	public String userUpdate(User user) {
		user.setuState(1);
		userdao.updateUser(user);
		return "redirect:/userlist";
	}

	/*
	 * 管理员冻结用户
	 */
	@RequestMapping("user_frozen")
	public String frozenuser(Integer uId) {
		userdao.frozenUser(uId);
		return "redirect:/userlist";
	}
	
	
	/*
	 * 管理员批量冻结用户
	 */
	@RequestMapping("user_del_batch")
	public String frozenuser2(Integer[] uId) {
		for(Integer uId_ : uId) {
			userdao.frozenUser(uId_);
		}
		return "redirect:/userlist";
	}
	
	/*
	 * 管理员激活用户
	 */
	@RequestMapping("user_activate")
	public String updateuState(Integer uId) {
		userdao.updUserState(uId);
		return "redirect:/userlist";
	}
}
