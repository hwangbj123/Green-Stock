package com.green.greenstock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.greenstock.dto.ChatMessage;
import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.repository.interfaces.ChatRepository;
import com.green.greenstock.repository.model.User;

@Service
public class ChattingService {
	
	@Autowired
	ChatRepository chatRepository;
	
	public int createChattingRoom(ChattingRoom chattingRoom) {
		return chatRepository.createChattingRoom(chattingRoom);
	}
	
	public List<ChattingRoom> findChattingRoomAll() {
		return chatRepository.findChattingRoomAll();
	}

	public int subscribe(int roomId, int userId) {
		return chatRepository.subscribe(roomId, userId);
	}
	
	public String subCheck(int roomId, int userId) {
		System.out.println("subCheck Service ");
		String res = chatRepository.subCheck(roomId, userId);
		System.out.println("userId : "+res);
		return res;
	}
	
	public int insertMessage(ChatMessage message) {
		return chatRepository.insertMessage(message);
	}

	public List<ChatMessage> selectMessageList(int roomId, int userId) {
		return chatRepository.selectMessageList(roomId, userId);
	}
	
	public User findUserById(int userId) {
		return chatRepository.findUserById(userId);
	}
}
