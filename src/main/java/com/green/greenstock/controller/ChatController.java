package com.green.greenstock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.greenstock.dto.ChatMessage;
import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.ChattingService;

@Controller
public class ChatController {

	@Autowired
	ChattingService chattingService;

	@GetMapping("/chat")
	public String chatMain(int roomId, int userId, Model model) {
		List<ChatMessage> list = chattingService.selectMessageList(roomId, userId);
		List<User> userList = chattingService.selectUserListByRoomId(roomId);
		
		model.addAttribute("roomId", roomId);
		model.addAttribute("userId", userId);
		model.addAttribute("list", list);
		model.addAttribute("userList", userList);
		
		return "chatting/chat";
	}

	@RequestMapping("/subCheck")
	@ResponseBody
	public String subCheck(int roomId, int userId) {
		System.out.println("controller subCheck roomId = "+roomId);
		String res = chattingService.subCheck(roomId, userId);
		return res;
	}
	
	@GetMapping("/subscribe")
	public String subscribe(int roomId, int userId) {
		chattingService.subscribe(roomId, userId);
		return "redirect:product/"+roomId;
	}
	
	@GetMapping("/un-subscribe")
	public String unSubscribe(int roomId, int userId) {
		chattingService.unSubscribe(roomId, userId);
		return "redirect:product/"+roomId;
	}
	
    @GetMapping("product/{roomId}")
    public String product(@PathVariable("roomId") int roomId,HttpServletRequest request, Model model) {
    	
    	HttpSession session =  request.getSession();
    	
    	model.addAttribute("roomId", roomId);

    	User principal = (User) session.getAttribute("principal");

    	if(principal!=null) {
    		System.out.println("principal : "+principal);
    		String subCheck = chattingService.subCheck(roomId, principal.getId());
    		model.addAttribute("subCheck", subCheck);
    		System.out.println("subCheck : "+subCheck);
    	}
    	
    	return "chatting/product";
    }

    @MessageMapping("/chat/{roomId}")
    @SendTo("/topic/{roomId}")
    public ChatMessage sendChatMessage(@DestinationVariable String roomId, ChatMessage message) {
    	
    	chattingService.insertMessage(message);
    	
    	System.out.println("roomId : "+roomId);
    	System.out.println("message : "+message);
    	return message;
    }
}

