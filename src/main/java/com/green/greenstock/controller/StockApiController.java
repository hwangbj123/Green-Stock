package com.green.greenstock.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.greenstock.dto.AskingSellingPriceOutputDto;
import com.green.greenstock.dto.DomesticStockCurrentPriceOutput;
import com.green.greenstock.dto.DomesticStockVolumeRankOutPut;
import com.green.greenstock.dto.ResponseApiInfo;
import com.green.greenstock.dto.ResponseApiInfoList;
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
		
		if(companyCode == null || companyCode.isEmpty()) {
			companyCode = "005930";
		}
		
		
		// 종목 코드로 api 정보 가져오기
		ResponseApiInfo<?> resInfo = stockApiService.getApiDomesticStockCurrentPrice(companyCode);
		
		// 종목 코드로 회사 이름 가져오기
		String companyName = stockApiService.getCompanyName(companyCode);
		
		if(resInfo == null || companyName == null || companyName.isEmpty()) {
			throw new CustomRestfulException("입력하신 정보가 없습니다.", HttpStatus.BAD_REQUEST);
		}
		// 제네릭 타입 확정
		ObjectMapper mapper = new ObjectMapper();
		DomesticStockCurrentPriceOutput outputPrice = mapper.convertValue(
				resInfo.getOutput(), DomesticStockCurrentPriceOutput.class);
		
		// 호가 10단계
		ResponseApiInfoList<?> resInfo2 = stockApiService.getAskingSellingPrice(companyCode);
		AskingSellingPriceOutputDto ouputAsking = mapper.convertValue(resInfo2.getOutput1(), AskingSellingPriceOutputDto.class);
		
		
		model.addAttribute("stockCurrentPrice", outputPrice);
		model.addAttribute("askingSellingPrice", ouputAsking);
		model.addAttribute("companyName", companyName);
		model.addAttribute("companyCode", companyCode);
		
		return "/stock/detail";
	}
	
	// 국내주식 현재가 조회 JSON 데이터
	@ResponseBody
	@GetMapping("/domestic/data/{companyCode}")
	public DomesticStockCurrentPriceOutput getStockDetailJson(@PathVariable String companyCode) {
		
		if(companyCode == null || companyCode.isEmpty()) {
			companyCode = "005930";
		}
		
		// 종목 코드로 api 정보 가져오기
		ResponseApiInfo<?> resInfo = stockApiService.getApiDomesticStockCurrentPrice(companyCode);
		
		if(resInfo == null) {
			throw new CustomRestfulException("입력하신 정보가 없습니다.", HttpStatus.BAD_REQUEST);
		}
		// 제네릭 타입 확정
		ObjectMapper mapper = new ObjectMapper();
		return mapper.convertValue(resInfo.getOutput(), DomesticStockCurrentPriceOutput.class);
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
	public DomesticStockVolumeRankOutPut getApiVolumeRank() {
		ResponseApiInfo<?> resInfo = stockApiService.getApiVolumeRank();
		ObjectMapper mapper = new ObjectMapper();
		return mapper.convertValue(resInfo.getOutput(), DomesticStockVolumeRankOutPut.class);
	}
	
	// 웹소켓키 보내기
	@ResponseBody
	@GetMapping("/approvalKey")
	public ResponseEntity<Map<String, String>> getApprovalKey(){
		String webSocketKey = stockApiService.validateWebSocketKey();
		Map<String, String> result = new HashMap<>();
		result.put("webSocketKey", webSocketKey);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	// 국내주식기간별시세(일/주/월/년)
	@ResponseBody
	@GetMapping("/InquireDailyItemChartPrice/{companyCode}/{date}")
	public String getDailyPrice(@PathVariable String companyCode, @PathVariable String date) {
		if(companyCode == null || date == null || companyCode.isEmpty() || date.isEmpty()) {
			throw new CustomRestfulException("잘못된 입력입니다.", HttpStatus.BAD_REQUEST);
		}
		return stockApiService.getDailyitemchartprice(companyCode, date);
	}
}