package com.iflysse.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//SpringMVC的配置类
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	
		registry.addInterceptor(new LoginInterceptor())   //添加一个拦截器到SpringMVC中
			.addPathPatterns("/**")					//拦截器拦截哪些请求    
			.excludePathPatterns("/login")
			.excludePathPatterns("/ademail")
			.excludePathPatterns("/email")
			.excludePathPatterns("/loginCheck")
			.excludePathPatterns("/bootstrap/**")    
			.excludePathPatterns("/css/**")   
			.excludePathPatterns("/layui/**")    
			.excludePathPatterns("/js/**")
			.excludePathPatterns("/images/**");    //拦截器不拦截哪些请求    
		
		
		registry.addInterceptor(new AdminInterceptor())   //添加一个拦截器到SpringMVC中
			.addPathPatterns("/**")					//拦截器拦截哪些请求    
			.excludePathPatterns("/login")
			.excludePathPatterns("/ademail")
			.excludePathPatterns("/email")
			.excludePathPatterns("/loginCheck")
			.excludePathPatterns("/bootstrap/**")    
			.excludePathPatterns("/css/**")   
			.excludePathPatterns("/layui/**")   
			.excludePathPatterns("/images/**")    
			.excludePathPatterns("/js/**");    //拦截器不拦截哪些请求  
		
		
		registry.addInterceptor(new MangerInterceptor())   //添加一个拦截器到SpringMVC中
		.addPathPatterns("/**")					//拦截器拦截哪些请求    
		.excludePathPatterns("/login")
		.excludePathPatterns("/ademail")
		.excludePathPatterns("/email")
		.excludePathPatterns("/loginCheck")
		.excludePathPatterns("/bootstrap/**")    
		.excludePathPatterns("/css/**")   
		.excludePathPatterns("/layui/**")   
		.excludePathPatterns("/images/**")    
		.excludePathPatterns("/js/**");    //拦截器不拦截哪些请求  
		
	}

	
}
