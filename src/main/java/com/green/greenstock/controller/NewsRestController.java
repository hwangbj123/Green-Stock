package com.green.greenstock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.greenstock.dto.NewsCrawlDTO;
import com.green.greenstock.service.CrawlService;

@RestController
public class NewsRestController {
	
	@Autowired
	CrawlService crawlService;
	
	@GetMapping("/getNews")
	public List<NewsCrawlDTO> getNews(){
		return crawlService.newsCrawl();
	}
}
