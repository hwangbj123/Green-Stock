package com.green.greenstock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.repository.interfaces.ChatRepository;

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
	
	public int subCheck(int roomId, int userId) {
		System.out.println("subCheck Service ");
		int res = chatRepository.subCheck(roomId, userId);
		System.out.println("userId : "+res);
		return res;
	}
}
