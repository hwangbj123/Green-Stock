package com.green.greenstock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.green.greenstock.service.ChatService;


@Controller
public class ChattingController {
	
	@Autowired
	public ChatService chatService;
 

}
