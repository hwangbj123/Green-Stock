package com.green.greenstock.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/sign-in")
	public String SignIn() {
		return "user/signIn";
	}
	
	@PostMapping("/sign-in")
	public String SignInProc(User user) {
		User principal = userService.findUserByUserName(user);
		if(principal != null) {
			principal.setPassword(null);
			session.setAttribute("principal", principal);
			return "redirect:/main";
		} else {
			return "redirect:/user/sign-in";
		}
	}
	
	@GetMapping("/sign-up")
	public String SignUp() {
		return "user/signUp";
	}
	
	@PostMapping("/sign-up")
	public String SignUpProc(User user) {
		userService.insertUser(user);
		return "user/signIn";
	}
	
	@PostMapping("/duplicate-check")
	public ResponseEntity<Integer> duplicateCheck(@RequestParam("username") String username) {
		if(userService.findUserName(username)!=null) {
			System.out.println("실패");
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}else {
			System.out.println("성공");
			return ResponseEntity.status(HttpStatus.OK).body(200);
		}
	}
	
}
