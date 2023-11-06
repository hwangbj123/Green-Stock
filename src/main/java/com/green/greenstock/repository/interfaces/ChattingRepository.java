package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.greenstock.dto.ChatMessage;
import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.repository.model.User;

@Mapper
public interface ChattingRepository {
	public int createChattingRoom(ChattingRoom chattingRoom);
	public int subscribe(@Param("companyCode") int companyCode, @Param("userId") int userId);
	public int unSubscribe(@Param("companyCode") int companyCode, @Param("userId") int userId);
	public String subCheck(@Param("companyCode") int companyCode, @Param("userId") int userId);
	public int insertMessage(ChatMessage message);
	public int deleteMessage(int id);
	public List<ChatMessage> selectMessageList(@Param("companyCode") int companyCode, 
											   @Param("userId") int userId, 
											   @Param("roleTypeId") int roleTypeId);
	public User findUserById(int userId);
	public List<User> selectUserListByCode(int companyCode);
	public List<ChattingRoom> selectChatListAll(PagingDto paging);
	public int countChatList(PagingDto paging);
}
