package com.green.greenstock.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Autowired
	private AuthInterceptor authInterceptor;
	
//	@Autowired
//	private AdminInterceptor adminInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(authInterceptor).addPathPatterns("/booking/**").addPathPatterns("/payment/**").addPathPatterns("/customerservice/inquiry/**").addPathPatterns("/user/my-info/**").addPathPatterns("/user/payList/**").addPathPatterns("/user/ticketList/**").addPathPatterns("/user/rentalList/**").addPathPatterns("/show/apply*")
//				.excludePathPatterns("/show/applyIntro").excludePathPatterns("/payment/cancel");
//		registry.addInterceptor(adminInterceptor).addPathPatterns("/admin/**");
		registry.addInterceptor(authInterceptor).addPathPatterns("/board/write").addPathPatterns("/board/update/*").addPathPatterns("/board/thumb-*").addPathPatterns("/board/board*")
				.addPathPatterns("/chat*");
		registry.addInterceptor(authInterceptor).addPathPatterns("/advisor/board/**").addPathPatterns("/advisor/register");
	}


	@Value("${spring.servlet.multipart.location}")
    private String filePath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/upload/**")
				.addResourceLocations("file:///" + filePath);
	}
}
