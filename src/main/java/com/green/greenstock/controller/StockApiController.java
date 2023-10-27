package com.green.greenstock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.greenstock.dto.DomesticStockCurrentPrice;
import com.green.greenstock.dto.DomesticStockVolumeRank;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.service.StockApiService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Mono;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/stock")
@Controller
public class StockApiController {

	private final StockApiService stockApiService;
	
	// 국내주식 현재가 조회
	@GetMapping("/domestic")
	public String getStockDetail(Model model, 
			@RequestParam(defaultValue = "삼성전자") String companyName, 
			@RequestParam(defaultValue = "1") int filter) {
		
		String companyCode = stockApiService.getCompanyCode(filter, companyName);
		Mono<DomesticStockCurrentPrice> monoStockCurrentPrice = stockApiService.getApiDomesticStockCurrentPrice(companyCode);
		log.debug("data : {}", monoStockCurrentPrice.block());
		model.addAttribute("stockCurrentPrice",monoStockCurrentPrice.block());
		model.addAttribute("companyName", companyName);
		model.addAttribute("companyCode", companyCode);
		
		return "/stockApi/detail";
	}
	
	// 국내주식 거래량 순위
	@ResponseBody
	@GetMapping("/volumeRank")
	public DomesticStockVolumeRank getApiVolumeRank() {
		return stockApiService.getApiVolumeRank().block();
		
	}
}
