package com.green.greenstock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	@GetMapping("/test")
	public String test() {
		return "/portfolio/userPortfolio";
	}
	
	@GetMapping("/portfolio/popUpPage")
	public String popUpPage() {
		return "/portfolio/popUpPage";
	}
}
