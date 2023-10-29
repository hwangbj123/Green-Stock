package com.green.greenstock.controller;


import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.greenstock.dto.DomesticStockCode;
import com.green.greenstock.dto.DomesticStockCurrentPrice;
import com.green.greenstock.dto.DomesticStockVolumeRank;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.service.StockApiService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/stock")
@Controller
public class StockApiController {

	private final StockApiService stockApiService;
	
	// 국내주식 현재가 조회
	@GetMapping("/domestic/{companyCode}")
	public String getStockDetail(Model model, @PathVariable String companyCode) {
		// 종목 코드로 api 정보 가져오기
		DomesticStockCurrentPrice stockCurrentPrice = stockApiService.getApiDomesticStockCurrentPrice(companyCode);
		// 종목 코드로 회사 이름 가져오기
		String companyName = stockApiService.getCompanyName(companyCode);
		
		if(stockCurrentPrice == null || companyName == null || companyName.isEmpty()) {
			throw new CustomRestfulException("입력하신 정보가 없습니다.", HttpStatus.BAD_REQUEST);
		}
		model.addAttribute("stockCurrentPrice",stockCurrentPrice.getOutput());
		model.addAttribute("companyName", companyName);
		model.addAttribute("companyCode", companyCode);
		
		return "/stock/detail";
	}
	
	// 국내주식 현재가 검색 목록
	@GetMapping("/domestic")
	public String getStockList(Model model, String searchData, @RequestParam(defaultValue = "1") int page) {
		model.addAttribute("responseDomesticStockSearchDto", stockApiService.getApiDomesticStockCurrentPriceList(searchData, page));
		return "/stock/searchList";
	}
	
	// 국내주식 거래량 순위
	@ResponseBody
	@GetMapping("/volumeRank")
	public DomesticStockVolumeRank getApiVolumeRank() {
		return stockApiService.getApiVolumeRank();
	}
	
	
	
	
}
