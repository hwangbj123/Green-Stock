package com.green.greenstock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.greenstock.dto.RefuseDTO;
import com.green.greenstock.repository.interfaces.AdvisorRepository;
import com.green.greenstock.service.MailSendService;

@RestController
public class AdminRestController {

	@Autowired
	MailSendService mailSendService;
	
	@Autowired
	AdvisorRepository advisorRepository;


	@PostMapping("/refuse")
	@ResponseBody
	public String refuse(@RequestBody RefuseDTO dto) throws Exception {
		advisorRepository.updateStatus(dto.getAdvisorId(),3);
		mailSendService.createRefuseMessage(dto.getEmail(), dto.getRefuseMsg());
		//mailSendService.createRefuseMessage("ysl2884@naver.com", dto.getRefuseMsg());
		return "메시지 전송 완료";
	}
	
	@GetMapping("/approve/{advisorId}/{advisorEmail}")
	public int approve(@PathVariable int advisorId, @PathVariable String advisorEmail) throws Exception {
		//System.out.println(advisorId);
		//System.out.println(advisorEmail);
		advisorRepository.updateStatus(advisorId, 1);
		//mailSendService.createRefuseMessage(advisorEmail, "전문가 등록 완료.");
		mailSendService.createAcceptMessage("ysl2884@naver.com", "전문가 등록 완료.");
		return 1;
	}
}
