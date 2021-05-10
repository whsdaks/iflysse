package com.iflysse.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iflysse.bean.Email;
import com.iflysse.bean.User;
import com.iflysse.dao.EmailDao;

import com.iflysse.util.SendMail;

@Controller
public class EmailController {

	@Autowired
	private EmailDao emaildao;
	
	@RequestMapping("/ademail")
	public String adEmail() {
		return "email";
	}
	// 找回密码控制器
	//@SuppressWarnings({ "deprecation", "unused" })
	@RequestMapping(value = "/email", method = RequestMethod.POST, produces = "text/html;charset=UTF-8;")
	@ResponseBody //ajax接受返回值
	public String retrievePassword(HttpServletRequest request, HttpServletResponse response,
			String Email,User user)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		String email = request.getParameter("email");// email

		// 实例化一个发送邮件的对象
		SendMail mySendMail = new SendMail();
		// 修改密码并返回
		// 产生随机的6位数密码((int) ((Math.random() * 9 + 1) * 100000))
		String Password = "bs1111";
		// 根据邮箱寻找是否有该用户信息，找到就修改密码，否则就提示用户无效的用户Email
		System.out.println("邮箱为："+email);
		/*
		 
		 */
		request.setAttribute("Email", Email);
		List<Email> emails= emaildao.selectemail(Email);
		request.setAttribute("emails", emails);
		
		//跟数据库用户邮箱比较，是否存在此用户
		for(int i=0;i<emails.size();i++) {
			System.out.println("已有用户邮箱为："+emails.get(i).getEmail());
			if(email.equals(emails.get(i).getEmail())) {
				// 修改密码成功后进行发送邮件
				// 设置收件人和消息内容userdao.updateUser(user);
				emaildao.updEmail(user);
				mySendMail.sendMail(email, "教师辅助办公平台提醒，您的密码为：" + Password);
				System.out.println("密码："+Password);
				map.put("code", 200);
				map.put("msg", "恭喜，找回密码成功，请前往邮箱查看密码！");
				//JSONObject jsonFail = new JSONObject(map);
				return "恭喜，找回密码成功，请前往邮箱查看密码！";
			}
		}
		
		return "该邮箱未绑定任何账号，请重试！";
		
		
		
	}

}
