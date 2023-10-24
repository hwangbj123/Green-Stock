package com.green.greenstock.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.greenstock.dto.StockCurrentPrice;
import com.green.greenstock.service.StockApiService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Mono;

@Slf4j
@RequiredArgsConstructor
@RestController
public class StockApiController {

	private final StockApiService stockApiService;
	
	@GetMapping("/stock")
	public Mono<StockCurrentPrice> test() {
		Mono<StockCurrentPrice> data = stockApiService.getDomesticStokCurrentPrice();
		log.info("data : {}", data);
		return data;
	}
}
