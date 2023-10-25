package com.green.greenstock.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.service.ChatService;


@Controller
public class ChatController {
	
	@Autowired
	public ChatService chatService;
 
	// 채팅방 목록
	public static LinkedList<ChattingRoom> chatingRoomList = new LinkedList<>();
	
	//	----------------------------------------------------
	
	// 컨트롤러
	
	// 홈
	@GetMapping("/")
	public String home() {
		return "chatting/home";
	}
	@GetMapping("out")
	public String out(HttpSession session) {
		session.invalidate();
		return "chatting/home";
	}
	@PostMapping("/home")
	public String home(int userId, HttpSession session, Model model) {
		session.setAttribute("user", userId);
		System.out.println("user : "+userId);
//		model.addAttribute("user",user);
		return "chatting/home";
	}
	// 메인화면
	@GetMapping("/chat")
	public String main(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("user");
		session.setAttribute("user", userId);
		
		return "chatting/chat";
	}
	
	
	// 채팅방 목록
	@GetMapping("/chatingRoomList")
	public ResponseEntity<?> chatingRoomList() {
		return new ResponseEntity<LinkedList<ChattingRoom>>(chatingRoomList, HttpStatus.OK);
	}
	
	
	// 방 만들기
	@PostMapping("/chatingRoom")
	public ResponseEntity<?> chatingRoom(String roomName, String nickname, HttpServletRequest request) {
		
		// 방을 만들고 채팅방목록에 추가
		String roomNumber = UUID.randomUUID().toString();
		ChattingRoom chattingRoom = ChattingRoom.builder()
				.roomNumber(roomNumber)
				.users(new LinkedList<>())
				.roomName(roomName)
				.build();
		
		String userId = (String) request.getAttribute("userId");
		
		System.out.println("create chattingRoom : "+chattingRoom);
		
		chatService.createChatRoom(chattingRoom);
		
		chatingRoomList.add(chattingRoom);
		
		// 방 입장하기
		chatService.enterChatingRoom(chattingRoom, nickname);
		
		return new ResponseEntity<>(chattingRoom, HttpStatus.OK);
	}
	
	
	// 방 들어가기
	@GetMapping("/chatingRoom-enter")
	public ResponseEntity<?> EnterChatingRoom(String roomNumber, String nickname){
		
		// 방 번호로 방 찾기
		ChattingRoom chatingRoom = chatService.findRoom(roomNumber);
		
		if(chatingRoom == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} else {
			// 방 들어가기
			chatService.enterChatingRoom(chatingRoom, nickname);
			
			return new ResponseEntity<>(chatingRoom, HttpStatus.OK);
		}
	}
	
	// 방 나가기
	@PatchMapping("/chatingRoom-exit")
	public ResponseEntity<?> ExitChatingRoom(){
			
		Map<String, String> map = chatService.findCookie();
			
		if(map == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		
		String roomNumber = map.get("roomNumber");
		String nickname = map.get("nickname");
		
		// 방목록에서 방번호에 맞는 유저목록 가져오기
		ChattingRoom chatingRoom = chatService.findRoom(roomNumber);
		List<String> users = chatingRoom.getUsers();
		
		// 닉네임 삭제
		users.remove(nickname);
		
		// 쿠키에서 닉네임과 방번호 삭제
		chatService.deleteCookie();
		
		// 유저가 한명도 없다면 방 삭제
		if(users.size() == 0) {
			chatingRoomList.remove(chatingRoom);
		}
		
		return new ResponseEntity<>(chatingRoom, HttpStatus.OK);
	}
	
	
	// 참가 중이었던 대화방
	@GetMapping("/chatingRoom")
	public ResponseEntity<?> chatingRoom() {
		// 쿠키에 닉네임과 방번호가 있다면 대화중이던 방이 있던것
		Map<String, String> map = chatService.findCookie();
		
		if(map == null) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		String roomNumber = map.get("roomNumber");
		String nickname = map.get("nickname");
		
		ChattingRoom chatingRoom = chatService.findRoom(roomNumber);
		
		if(chatingRoom == null) {
			chatService.deleteCookie(); 
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} else {
			Map<String, Object> map2 = new HashMap<>();
			map2.put("chatingRoom", chatingRoom);
			map2.put("myNickname", nickname);
			
			return new ResponseEntity<>(map2, HttpStatus.OK);
		}
	}
	
	
}
