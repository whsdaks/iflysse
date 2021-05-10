package com.iflysse.config;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.iflysse.bean.User;

//角色拦截器
public class AdminInterceptor implements HandlerInterceptor {
 
	//会在进入控制器之前执行
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//需要管理员权限才能访问的页面列表
		List<String> adminPages = Arrays.asList("/termset","/term_all","/add_term","/term_activate",
				"/add_user","/add_user_save","/userlist","/user_info","/user_edit","/user_edit_save",
				"/user_frozen","/user_del_batch","/user_activate");
		
		String url = request.getRequestURI();  //获取当前访问的url地址
		if(adminPages.contains(url)) {         //如果当前访问url需要管理员权限，则检查当前登录用户是不是管理员
			User loginUser = (User)request.getSession().getAttribute("loginUser");
			if(loginUser.getuType() != 0) {
				System.out.println("此页面需要管理员权限才能访问");
				//利用request中的forward方法将请求转发到403错误页面
				request.getRequestDispatcher("/WEB-INF/jsp/error/403.jsp").forward(request, response);
				return false;
			}
		}
		return true;
	}

}
