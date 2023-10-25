package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.ChattingRoom;

@Mapper
public interface ChatRepository {
	public int createChatRoom(ChattingRoom chattingRoom);
	public List<ChattingRoom> findChatRoomById(Integer roomId);
}
