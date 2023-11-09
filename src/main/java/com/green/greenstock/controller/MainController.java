package com.green.greenstock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.greenstock.dto.ChattingRoom;
import com.green.greenstock.dto.DomesticStockVolumeRankOutPut;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.dto.ResponseApiInfoList;
import com.green.greenstock.repository.model.Board;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.BoardService;
import com.green.greenstock.service.ChattingService;
import com.green.greenstock.service.StockApiService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {

	private final ChattingService chattingService;

	private final BoardService boardService;

	private final StockApiService stockApiService;

	@GetMapping({ "/main", "/" })
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

		// 회원일 때만 chatting 가져오기
		if (user != null) {
			List<ChattingRoom> chatList = chattingService.selectChatListNotPaging(user.getId());
			model.addAttribute("chatList", chatList);
			
			List<ChattingRoom> advisorChatList = chattingService.advisorChatList(user.getId());
			model.addAttribute("advisorChatList", advisorChatList);
		}

		// 거래량 순위
		ResponseApiInfoList<?> resInfo = stockApiService.getApiVolumeRank();
		ObjectMapper mapper = new ObjectMapper();
		List<DomesticStockVolumeRankOutPut> outPuts = mapper.convertValue(resInfo.getOutput(),
				new TypeReference<List<DomesticStockVolumeRankOutPut>>() {
				});
		model.addAttribute("volumeRank", outPuts);
		return "/main";
	}
}
