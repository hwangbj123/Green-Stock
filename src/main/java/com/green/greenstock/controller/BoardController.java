package com.green.greenstock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.greenstock.repository.model.Board;
import com.green.greenstock.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/write")
	public String boardWrite(Model model) {
		List<String> cate = boardService.findCategoryList();
		model.addAttribute("cate", cate);
		return "board/board-write";
	}
	@PostMapping("/board-write")
	public String postBoardWrite(Board board) {
		System.out.println("board-write board : "+board);
		boardService.insertBoard(board);
		return "redirect:list";
	}
	
	@GetMapping("/list")
	public String boardList(Model model) {
		List<String> cate = boardService.findCategoryList();
		List<Board> list = boardService.selectBoardListAll();
		
		model.addAttribute("cate", cate);
		model.addAttribute("list", list);
		return "board/board-list";
	}
	
	@GetMapping("/detail/{id}")
	public String boardDetail(@PathVariable("id") int boardId, Model model) {
		
		List<String> cate = boardService.findCategoryList();
		Board board = boardService.selectBoardById(boardId);

		model.addAttribute("cate", cate);
		model.addAttribute("board", board);
		
		return "board/board-detail";
	}
	
	@GetMapping("/update/{id}")
	public String boardUpdate(@PathVariable("id") int boardId, Model model) {
		
		List<String> cate = boardService.findCategoryList();
		Board board = boardService.selectBoardById(boardId);
		
		model.addAttribute("cate", cate);
		model.addAttribute("board", board);
		return "board/board-update";
	}
	
	@PostMapping("/board-update")
	public String postBoardUpdate(Board board) {
		boardService.updateBoard(board);
		System.out.println("board update success");
		return "redirect:list";
	}
	@GetMapping("/delete/{id}")
	public String boardDelete(@PathVariable("id") int boardId) {
		boardService.deleteBoard(boardId);
		System.out.println("board delete success");
		return "redirect:/board/list";
	}

}
