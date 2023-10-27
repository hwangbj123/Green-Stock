package com.green.greenstock.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.greenstock.dto.MyPortfolio;

@RestController
public class TestRestController2 {
	
	@GetMapping("/getMyPortfolioList")
	public List<MyPortfolio> test() {
		List<MyPortfolio> list = new ArrayList<>();
		for(int i = 0; i < 3; i ++) {
			MyPortfolio mp = new MyPortfolio();
			mp.setId(i + 1);
			mp.setTitle("asdf");
			mp.setDiscription("abcde");
			list.add(mp);
		}
		return list;
	}
	
	@PostMapping("/postExample")
	public void postExample(@RequestBody MyPortfolio pf) {
		// pf null 처리 해야됨.
		System.out.println(pf.toString());
	}
}
