package com.green.greenstock.controller;

import java.util.List;

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
import com.green.greenstock.service.ChattingService;

@Controller
public class ChatController {

	@Autowired
	ChattingService chattingService;
	
	@GetMapping("/chatList")
	public String chatList(Model model) {
		List<ChattingRoom> chattingRooms = chattingService.findChattingRoomAll();
		model.addAttribute("rooms", chattingRooms);
		
		return "chatting/chatList";
	}
	
	@GetMapping("/chatCreate")
	public String chatCreate(String roomNumber, String roomName) {
		System.out.println("roomNumber : "+roomNumber);
		System.out.println("roomName : "+roomName);
		
		ChattingRoom chattingRoom = new ChattingRoom();
		chattingRoom.setRoomNumber(roomNumber);
		chattingRoom.setRoomName(roomName);
		
		chattingService.createChattingRoom(chattingRoom);
		return "redirect:chatList";
	}

	@GetMapping("/chat")
	public String chatMain(int roomId, int userId, Model model) {
		model.addAttribute("roomId", roomId);
		model.addAttribute("userId", userId);
		
		List<ChatMessage> list = chattingService.selectMessageList(roomId, userId);
		model.addAttribute("list", list);
//		System.out.println("list : "+list);
		
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
		return "redirect:chatList";
	}
	
    @MessageMapping("/chat/{roomId}")
    @SendTo("/topic/{roomId}")
    public ChatMessage sendChatMessage(@DestinationVariable String roomId, ChatMessage message) {

    	chattingService.insertMessage(message);
    	
    	System.out.println("roomId : "+roomId);
    	System.out.println("message : "+message);
        return message;
    }
    
    @GetMapping("product/{roomId}")
    public String product(@PathVariable("roomId") int roomId, Model model) {
    	model.addAttribute("roomId", roomId);
    	return "chatting/product";
    }

}
