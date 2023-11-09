package com.green.greenstock.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.greenstock.dto.AdminExpertDTO;
import com.green.greenstock.service.UserService;

@Controller
public class PortfolioController {

	@Autowired
	UserService userService;

	@GetMapping("/expert")
	public String expert(Model model) {
		List<AdminExpertDTO> dtoList = new ArrayList<>();
		List<AdminExpertDTO> refusedList = new ArrayList<>();
		for (int i = 0; i < 5; i++) {
			AdminExpertDTO adto = AdminExpertDTO.builder().advisorFullName("abcdabcd").advisorId(i)
					.birthDate(new Date()).career("하하하하하하하하하하하하하하하").status(1).createdAt(new Date()).regDate(new Date())
					.email("abcd" + i + "@naver.com").id(i).introduction("내가내다").specialization(1).tel("010-1010-0101")
					.build();
			dtoList.add(adto);
		}
		for (int i = 0; i < 5; i++) {
			AdminExpertDTO adto = AdminExpertDTO.builder().advisorFullName("abcdabcd").advisorId(i)
					.birthDate(new Date()).career("하하하하하하하하하하하하하하하").createdAt(new Date()).regDate(new Date())
					.email("abcd" + i + "@naver.com").id(i).introduction("내가내다").status(3).specialization(1).tel("010-1010-0101")
					.build();
			refusedList.add(adto);
		}
		model.addAttribute("expertList", dtoList);
		model.addAttribute("refusedList", refusedList);
		// board 가져오기
		return "/admin/adminExpert";
	}

	@GetMapping("/portfolio")
	public String test() {
		return "/portfolio/userPortfolio";
	}

	@GetMapping("/portfolio/popUpPage")
	public String popUpPage() {
		return "/portfolio/popUpPage";
	}

}
