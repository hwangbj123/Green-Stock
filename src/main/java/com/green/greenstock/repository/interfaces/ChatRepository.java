package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.greenstock.dto.ChattingRoom;

@Mapper
public interface ChatRepository {
	public int createChattingRoom(ChattingRoom chattingRoom);
	public List<ChattingRoom> findChattingRoomAll();
	public int subscribe(@Param("roomId") int roomId, @Param("userId") int userId);
	public int subCheck(@Param("roomId") int roomId, @Param("userId") int userId);
}
