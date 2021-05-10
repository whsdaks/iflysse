package com.iflysse.controller;


import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.iflysse.bean.User;
import com.iflysse.dao.UserDao;

@Controller
public class LoginController<JSONObject> {

	@Autowired
	private UserDao userdao;

	
	@RequestMapping("/login")
	public String Login() {
		return "login";
	}

	/* 登录页 */
	@RequestMapping("/login_bs")
	public String Bsindex() {
		return "redirect:/menu";
	}

	/* 检查登录信息 */
	@RequestMapping("/loginCheck")
	public String loginCheck(User user,HttpServletRequest request, HttpSession session,HttpServletResponse resp) {
		
		// 根据用户名去数据库查找用户
		User dbUser = userdao.getUserByusername(user.getUsername());
		// 用户名不存在，或者密码错误
		if (dbUser == null || !dbUser.getPassword().equals(user.getPassword())) {
			
			return "login";
		}		
		// 获取页面提交的验证码
		// String inputCode = request.getParameter("code");
		 //System.out.println("验证码:"+inputCode);							
		

//				System.out.println("登陆成功"+user.getusername());

		// 检查用户类型是否正确
		/*
		 * if(!(dbUser.getuType() != 1)) { System.out.println("您的账号不属于经理"); return
		 * "login"; }else if(!(dbUser.getuType() != 0)) {
		 * System.out.println("您的账号不属于管理员"); return "login"; }
		 */
		// 登录用户的信息放入session中
		session.setAttribute("loginUser", dbUser);

		// 统计登录人数
		ServletContext application = request.getServletContext();
		int online = application.getAttribute("online") == null ? 0 : (int) application.getAttribute("online");
		application.setAttribute("online", online + 1);

		return "redirect:/menu";
	}

	// 退出登录功能
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();

		ServletContext application = request.getServletContext();
		int online = application.getAttribute("online") == null ? 1 : (int) application.getAttribute("online");
		application.setAttribute("online", online > 0 ? online - 1 : 0);

		return "redirect:/login";
	}

	/* 菜单栏页 */
	@RequestMapping("menu")
	public String menu() {
		return "menu";
	}
	/* 管理员菜单栏页 */
	/*@RequestMapping("adminMenu")
	public String adminMenu() {
		return "adminMenu";
	}*/
	
	
	/* 经理菜单栏页 */
	/*@RequestMapping("mangerMenu")
	public String mangerMenu() {
		return "mangerMenu";
	}*/

	/* 修改密码页 */
	@RequestMapping("new_pwd")
	public String new_pwd() {
		return "pwdEdit";
	}

	/*
	 * 保存用户修改密码
	 */
	@RequestMapping("/pwd_save")
	/*
	 * public String new_modify(User user, HttpServletRequest request) { User
	 * loginUser = (User) request.getSession().getAttribute("loginUser"); User
	 * dbuser = userdao.getUserById(loginUser.getuId()); String password =
	 * dbuser.getPassword(); System.out.println("--->密码：" + password);
	 * if(!dbuser.getPassword().equals(user.getPassword())) {
	 * System.out.print("密码错误");; } else
	 * if(!user.getPassword().equals(user.getNewpwd())) { return "两次密码不一致！"; }
	 * 
	 * System.out.println("--->用户：" + dbuser.getUsername());
	 * System.out.println("--->密码：" + password); System.out.println("----->新密码：" +
	 * user.getNewpwd()); // user.setPassword(user.getNewPassword());
	 * userdao.updatepwd(user.getNewpwd(), dbuser.getuId()); return
	 * "redirect:/login";
	 */
	public String save_pwd(Integer uId, String password, String oldpwd) {
		User loginUser = userdao.getUserById(uId);

		System.out.println("原密码" + loginUser.getPassword());
		if (!loginUser.getPassword().equals(oldpwd)) {
			System.out.println("密码不一致");
			return "pwdEdit";
		}
		System.out.println("密码一致");
		System.out.println(password);
		userdao.updatepwd(uId, password);
		System.out.println("新密码" + loginUser.getPassword());
		return "login";
	}
	/* 用户管理页 */
	/*
	 * @RequestMapping("userlist") public String user_list() { return "userList"; }
	 */
	
}
