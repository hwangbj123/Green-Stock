package com.green.greenstock.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.greenstock.dto.Pagination;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.handler.exception.UnAuthorizedException;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.MailSendService;
import com.green.greenstock.service.SuspensionService;
import com.green.greenstock.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SuspensionService suspensionService;
	
	@Autowired
	private MailSendService mailSendService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/main")
	public String AdminMain() {
		
		//접근유저가 권한있는 사용자인지 확인
		if(session.getAttribute("principal") == null) {
			throw new UnAuthorizedException("권한있는 사용자가 아닙니다.", HttpStatus.UNAUTHORIZED);
		}
		
		User user = (User)session.getAttribute("principal");
		
		if(user.getRoletypeId() != 0) {
			throw new UnAuthorizedException("권한있는 사용자가 아닙니다.", HttpStatus.UNAUTHORIZED);
		}
		
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
		int total = 1;
		Pagination pagination = new Pagination(total, paging);
		model.addAttribute("userList", userList);
		model.addAttribute("page", pagination);
		return "admin/adminUser";
	}
}
