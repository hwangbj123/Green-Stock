package com.green.greenstock.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.greenstock.dto.Pagination;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.handler.exception.UnAuthorizedException;
import com.green.greenstock.handler.exception.UnSearchedException;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.MailSendService;
import com.green.greenstock.service.SuspensionService;
import com.green.greenstock.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final UserService userService;
	
	private final SuspensionService suspensionService;
	
	private final MailSendService mailSendService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/main")
	public String AdminMain(Model model) {
		
		//접근유저가 권한있는 사용자인지 확인
		if(session.getAttribute("principal") == null) {
			throw new UnAuthorizedException("권한있는 사용자가 아닙니다.", HttpStatus.UNAUTHORIZED);
		}
		
		User user = (User)session.getAttribute("principal");
		
		if(user.getRoletypeId() != 0) {
			throw new UnAuthorizedException("권한있는 사용자가 아닙니다.", HttpStatus.UNAUTHORIZED);
		}
		
		List<User> userList = userService.findAdminMainUserList();
		model.addAttribute("userList", userList);
		
		return "admin/adminMain";
	}
	
	@GetMapping("/user")
	public String AdminUser(Model model, PagingDto paging) {
		List<User> userList = userService.findAllUser(paging);
		int total = userService.countUser();
		Pagination pagination = new Pagination(total, paging);
		model.addAttribute("userList", userList);
		model.addAttribute("page", pagination);
		return "admin/adminUser";
	}
	
	@PostMapping("/suspended")
	public String suspendedUser(String userName, Integer suspendDate) {
		suspensionService.suspendUser(userName, suspendDate);
		try {
			mailSendService.sendSuspensionMessage(userName, suspendDate);
			log.info("메일발송 성공");
		} catch (Exception e) {
			log.info("메일발송 실패");
			e.printStackTrace();
		}
		return "redirect:/admin/user";
	}
	
	@GetMapping("/search-user")
	public String searchUser(String search, PagingDto paging, Model model) {
		List<User> userList = userService.findSearchUser(search ,paging);
		if(userList.isEmpty()) {
			throw new UnSearchedException("해당 유저가 존재하지 않습니다.", HttpStatus.BAD_REQUEST);
		}
		Pagination pagination = new Pagination(1, paging);
		model.addAttribute("userList", userList);
		model.addAttribute("page", pagination);
		return "admin/adminUser";
	}

	/*
		전문가 등급 관리
	 */ 
	// 신청 목록 페이지
	// 심사중 기능
	// 심사완료 등급업 기능
	// 전문가 이력 추가 페이지
	// 전문가 이력 추가 기능
	// 전문가 이력 관리 페이지
	// 전문가 이력 관리 기능



}


