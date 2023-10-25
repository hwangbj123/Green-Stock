package com.green.greenstock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.green.greenstock.dto.Output;
import com.green.greenstock.service.StockApiService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class StockApiController {

	private final StockApiService stockApiService;
	
	@GetMapping("/stock")
	public String test(Model model, String companyName) {
		// TODO 회사명 으로 코드번호찾기
		
		Output stockCurrentPrice = stockApiService.getDomesticStokCurrentPrice().block().getOutput();
		log.info("data : {}", stockCurrentPrice);
		model.addAttribute("stockCurrentPrice",stockCurrentPrice);
		return "/stockApi/detail";
	}
}
