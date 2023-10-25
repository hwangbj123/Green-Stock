package com.green.greenstock.service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.repository.interfaces.ChatRepository;

@Service
public class ChatService {
	
	@Autowired
	ChatRepository chatRepository;
	
	public int createChatRoom(ChattingRoom chattingRoom) {
		return chatRepository.createChatRoom(chattingRoom);
	}
	
	public List<ChattingRoom> findChatRoomById(Integer roomId){
		System.out.println("service roomId : "+roomId);
		return chatRepository.findChatRoomById(roomId);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 채팅방 목록
	public static LinkedList<ChattingRoom> chatingRoomList = new LinkedList<>();
	
	
	//	----------------------------------------------------
	// 유틸 메서드
	
	// 방 번호로 방 찾기
	public ChattingRoom findRoom(String roomNumber) {
		ChattingRoom room = ChattingRoom.builder().roomNumber(roomNumber).build(); 
		int index = chatingRoomList.indexOf(room);
		
		if(chatingRoomList.contains(room)) {
			return chatingRoomList.get(index); 
		}
		return null;
	}
	
	
	// 쿠키에 추가
	public void addCookie(String cookieName, String cookieValue) {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletResponse response = attr.getResponse();
		
		Cookie cookie = new Cookie(cookieName, cookieValue);
		
		int maxage = 60 * 60 * 24 * 7;
		cookie.setMaxAge(maxage);
		response.addCookie(cookie);
	}
	
	
	
	// 방 번호, 닉네임 쿠키 삭제
	public void deleteCookie( ) {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletResponse response = attr.getResponse();
		
		Cookie roomCookie = new Cookie("roomNumber", null);
		Cookie nicknameCookie = new Cookie("nickname",null);
		
		roomCookie.setMaxAge(0);
		nicknameCookie.setMaxAge(0);
		
		response.addCookie(nicknameCookie);
		response.addCookie(roomCookie);
	}
	
	
	
	// 쿠키에서 방번호, 닉네임 찾기
	public Map<String, String> findCookie() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		
		Cookie[] cookies = request.getCookies();
		String roomNumber = "";
		String nickname= "";
		
		if(cookies == null) {
			return null;
		}
		
		if(cookies != null) {
			for(int i=0;i<cookies.length;i++) {
				if("roomNumber".equals(cookies[i].getName())) {
					roomNumber = cookies[i].getValue();
				}
				if("nickname".equals(cookies[i].getName())) {
					nickname = cookies[i].getValue();
				}
			}
			
			if(!"".equals(roomNumber) && !"".equals(nickname)) {
				Map<String, String> map = new HashMap<>();
				map.put("nickname", nickname);
				map.put("roomNumber", roomNumber);
				
				return map;
			}
		}
		
		return null;
	}
	
	// 닉네임 생성
	public void createNickname(String nickname) {
		addCookie("nickname", nickname);
	}
	
	// 방 입장하기
	public boolean enterChatingRoom(ChattingRoom chatingRoom, String nickname) {
		createNickname(nickname);
		
		if(chatingRoom == null) {
			deleteCookie();
			return false;
		} else {
			LinkedList<String> users = chatingRoom.getUsers();
			users.add(nickname);
			
			addCookie("roomNumber", chatingRoom.getRoomNumber());
			return true;
		}
	}
}
