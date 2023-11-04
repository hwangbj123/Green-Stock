package com.green.greenstock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.greenstock.dto.KakaoPayDto;
import com.green.greenstock.service.KakaoPayService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/pay")
@RequiredArgsConstructor
public class PayController {
	
	private final KakaoPayService kakaoPayService;
	
	@GetMapping("/kakao")
	public String KakaoPay() {
		return "/pay_test";
	}
	
	@PostMapping("/kakao")
	@ResponseBody
	public String KakaoPayProc(KakaoPayDto kakaoPayDto) {
		return kakaoPayService.kakaoPayReady();
	}
	
	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		log.info("pg_token : " + pg_token);
		
		model.addAttribute("payInfo", kakaoPayService.KakaoPayInfo(pg_token));
		return "/paySuccess_test";
	}
}
