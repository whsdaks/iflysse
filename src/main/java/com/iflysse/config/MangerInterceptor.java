package com.iflysse.config;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import com.iflysse.bean.User;

public class MangerInterceptor implements HandlerInterceptor {

	 
		//会在进入控制器之前执行
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			List<String> mangerPages = Arrays.asList("/weeklyList");

			String url = request.getRequestURI();  //获取当前访问的url地址
			if(mangerPages.contains(url)) {         //如果当前访问url需要管理员权限，则检查当前登录用户是不是管理员
				User loginUser = (User)request.getSession().getAttribute("loginUser");
				if(loginUser.getuType() == 2) {
					//利用request中的forward方法将请求转发到403错误页面
					request.getRequestDispatcher("/WEB-INF/jsp/error/403.jsp").forward(request, response);
					return false;
				}
			}
			
			
//			System.out.println("可以访问");
			return true;
		}

	}

	

