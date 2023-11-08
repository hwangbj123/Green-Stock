package com.green.greenstock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class PortfolioController {
	
	@GetMapping("/portfolio")
	public String test() {
		return "/portfolio/userPortfolio";
	}
	
	@GetMapping("/portfolio/popUpPage")
	public String popUpPage() {
		return "/portfolio/popUpPage";
	}
}