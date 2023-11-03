package com.green.greenstock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.greenstock.dto.ChatMessage;
import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.repository.interfaces.ChattingRepository;
import com.green.greenstock.repository.model.User;

@Service
public class ChattingService {
	
	@Autowired
	ChattingRepository chattingRepository;
	
	public int createChattingRoom(ChattingRoom chattingRoom) {
		return chattingRepository.createChattingRoom(chattingRoom);
	}
	
	public List<ChattingRoom> findChattingRoomAll() {
		return chattingRepository.findChattingRoomAll();
	}

	public int subscribe(int roomId, int userId) {
		return chattingRepository.subscribe(roomId, userId);
	}
	
	public int unSubscribe(int roomId, int userId) {
		return chattingRepository.unSubscribe(roomId, userId);
	}
	
	public String subCheck(int roomId, int userId) {
		System.out.println("subCheck Service ");
		String res = chattingRepository.subCheck(roomId, userId);
		System.out.println("userId : "+res);
		return res;
	}
	
	public int insertMessage(ChatMessage message) {
		return chattingRepository.insertMessage(message);
	}

	public List<ChatMessage> selectMessageList(int roomId, int userId) {
		return chattingRepository.selectMessageList(roomId, userId);
	}
	
	public User findUserById(int userId) {
		return chattingRepository.findUserById(userId);
	}
	
	public List<User> selectUserListByRoomId(int roomId){
		return chattingRepository.selectUserListByRoomId(roomId);
	}
}
