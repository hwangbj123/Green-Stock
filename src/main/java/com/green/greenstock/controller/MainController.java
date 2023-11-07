package com.green.greenstock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.repository.model.Board;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.BoardService;
import com.green.greenstock.service.ChattingService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {

	private final ChattingService chattingService;
	
	private final BoardService boardService;
	
	@GetMapping({"/main", "/"})
	public String Main(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("principal");
		
		// board 가져오기
		PagingDto paging = new PagingDto();
		paging.setOrderType("recommand");
		List<Board> boardList = boardService.selectBoardSearchList(paging);
		List<String> cate = boardService.findCategoryList();
		model.addAttribute("boardList", boardList);
		model.addAttribute("cate", cate);
		
//		회원일 때 처리
		if(user!=null) {
			List<ChattingRoom> chatList = chattingService.selectChatListNotPaging();
			model.addAttribute("chatList", chatList);
		}

		return "/main";
	}
}
