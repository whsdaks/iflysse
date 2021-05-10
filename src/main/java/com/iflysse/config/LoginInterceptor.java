package com.iflysse.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

//登录拦截器
public class LoginInterceptor implements HandlerInterceptor {

	//会在进入控制器之前执行
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(request.getSession().getAttribute("loginUser") == null) {
		  //System.out.println("用户没有登录");
		  response.sendRedirect("/login");    //重定向
		  return false;
		}
		return true;   //true代表放行，false代表拦截
	}


}
