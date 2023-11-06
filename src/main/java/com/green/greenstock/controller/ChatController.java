package com.green.greenstock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.greenstock.dto.ChatMessage;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.ChattingService;

@Controller
public class ChatController {

	@Autowired
	ChattingService chattingService;

	@GetMapping("/chat")
	public String chatMain(String companyCode, int userId, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("principal");
		int roleTypeId = user.getRoletypeId();
		List<ChatMessage> list = chattingService.selectMessageList(companyCode, userId, roleTypeId);
		List<User> userList = chattingService.selectUserListByCode(companyCode);
		
		model.addAttribute("companyCode", companyCode);
		model.addAttribute("userId", userId);
		model.addAttribute("list", list);
		model.addAttribute("userList", userList);
		
		return "chatting/chat";
	}

	@RequestMapping("/subCheck")
	@ResponseBody
	public String subCheck(String companyCode, int userId) {
		System.out.println("controller subCheck companyCode = "+companyCode);
		String res = chattingService.subCheck(companyCode, userId);
		return res;
	}
	
	@GetMapping("/subscribe")
	public String subscribe(String companyCode, int userId) {
		chattingService.subscribe(companyCode, userId);
		return "redirect:product/"+companyCode;
	}
	
	@GetMapping("/un-subscribe")
	public String unSubscribe(String companyCode, int userId) {
		chattingService.unSubscribe(companyCode, userId);
		return "redirect:product/"+companyCode;
	}
	
    @GetMapping("product/{companyCode}")
    public String product(@PathVariable("companyCode") String companyCode,HttpServletRequest request, Model model) {
    	
    	HttpSession session =  request.getSession();
    	
    	model.addAttribute("companyCode", companyCode);
    	System.out.println("companyCode : "+companyCode);

    	User principal = (User) session.getAttribute("principal");

    	if(principal!=null) {
    		System.out.println("principal : "+principal);
    		String subCheck = chattingService.subCheck(companyCode, principal.getId());
    		model.addAttribute("subCheck", subCheck);
    		System.out.println("subCheck : "+subCheck);
    	}
    	
    	return "chatting/product";
    }

    @MessageMapping("/chat/{companyCode}")
    @SendTo("/topic/{companyCode}")
    public ChatMessage sendChatMessage(@DestinationVariable String companyCode, ChatMessage message) {
    	
    	chattingService.insertMessage(message);
    	
    	System.out.println("companyCode : "+companyCode);
    	System.out.println("message : "+message);
    	return message;
    }
}

