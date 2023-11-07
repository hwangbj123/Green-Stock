package com.green.greenstock.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.greenstock.dto.KakaoPayApproval;
import com.green.greenstock.dto.KakaoPayDto;
import com.green.greenstock.repository.model.Pay;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.KakaoPayService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/pay")
@RequiredArgsConstructor
public class PayController {
	
	private final KakaoPayService kakaoPayService;
	
	@Autowired
	HttpSession session;
	
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
		KakaoPayApproval kakaoPayApproval = kakaoPayService.KakaoPayInfo(pg_token);
		User user = (User)session.getAttribute("principal");
		Pay pay = new Pay();
		pay.setAid(kakaoPayApproval.getAid());
		pay.setCid(kakaoPayApproval.getCid());
		pay.setTid(kakaoPayApproval.getTid());
		pay.setSid(kakaoPayApproval.getSid());
		pay.setAmountTotal(kakaoPayApproval.getAmount().getTotal());
		pay.setCreated_at(kakaoPayApproval.getCreated_at());
		pay.setApproved_at(kakaoPayApproval.getApproved_at());
		pay.setUserId(user.getId());
		kakaoPayService.insertPayInfo(pay);
		model.addAttribute("payInfo", kakaoPayApproval);
		return "/paySuccess_test";
	}
}
