package com.green.greenstock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.green.greenstock.dto.Pagination;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.dto.ReplyPagination;
import com.green.greenstock.dto.ReplyPagingDto;
import com.green.greenstock.repository.model.Board;
import com.green.greenstock.repository.model.Reply;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.BoardService;
import com.green.greenstock.service.ReplyService;


@Controller
@RequestMapping(value="/board", method = {RequestMethod.GET, RequestMethod.POST})
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
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
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String boardList(PagingDto paging, Model model) {
		List<String> cate = boardService.findCategoryList();
		List<Board> list = boardService.selectBoardListAll(paging);
		int total = boardService.selectBoardCount(paging);
		Pagination pagination = new Pagination(total, paging);
		
		model.addAttribute("cate", cate);
		model.addAttribute("list", list);
		model.addAttribute("page", pagination);
		System.out.println("page : "+pagination);
		return "board/board-list";
	}
	
	@GetMapping("/search")
	public String boardSearchList(PagingDto paging, Model model) {
		List<String> cate = boardService.findCategoryList();
		int total = boardService.selectBoardCount(paging);
		Pagination pagination = new Pagination(total, paging);
		List<Board> list = boardService.selectBoardSearchList(paging);
		
		System.out.println("board search - page : "+pagination);
		System.out.println("board search - paging : "+paging);
		
		model.addAttribute("cate", cate);
		model.addAttribute("list", list);
		model.addAttribute("page", pagination);
		model.addAttribute("paging", paging);
		return "board/board-search";
	}
	
	@GetMapping("/detail")
	public String boardDetail(ReplyPagingDto paging, HttpServletRequest request,HttpServletResponse response, Model model) {
		System.out.println("detail : "+paging);
		System.out.println("detail offset : "+paging.getOffset());
//		HttpSession session = request.getSession();
//		User user = (User) session.getAttribute("principal");
		
		List<String> cate = boardService.findCategoryList();
		Board board = boardService.selectBoardById(paging.getBoardId());
		List<Reply> reply = replyService.selectReplyList(paging);
		int maxRef = replyService.selectMaxRef(paging.getBoardId());
		int totalReply = replyService.selectReplyCount(paging.getBoardId());
		ReplyPagination pagination = new ReplyPagination(totalReply, paging);
//		int thumb = boardService.thumbCheck(paging.getBoardId(), user.getId());
		
		model.addAttribute("cate", cate);
		model.addAttribute("board", board);
		model.addAttribute("reply", reply);
		model.addAttribute("maxRef", maxRef);
		model.addAttribute("page", pagination);
//		model.addAttribute("thumb", thumb);
		
		boardService.viewCountUpFnc(paging.getBoardId(), request, response);
		
		System.out.println("detail - reply : "+reply);
		System.out.println("detail - maxRef : "+maxRef);
		System.out.println("detail - paging : "+paging);
		System.out.println("detail - page : "+pagination);
//		System.out.println("user : "+user);
		
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

	@PostMapping("/reply-write")
	public String postReplyWrite(Reply reply) {
		System.out.println("reply-write board : "+reply);
		replyService.updateReply(reply);
		replyService.insertReply(reply);
		int boardId = reply.getBoardId();
		return "redirect:detail?boardId="+boardId;
	}
	@GetMapping("/reply-delete")
	public String postReplyDelete(Reply reply) {
		System.out.println("reply-delete board : "+reply);
		replyService.deleteReply(reply);
		int boardId = reply.getBoardId();
		return "redirect:detail?boardId="+boardId;
	}
	
	@GetMapping("/thumb-check")
	public String thumbCheck(int boardId, int userId) {
		int check = boardService.thumbCheck(boardId, userId);
		System.out.println("thumb check : "+check);
		if(check==0) {
			boardService.thumbUp(boardId, userId);
		}else {
			boardService.thumbDelete(boardId, userId);
		}
		return "redirect:detail?boardId="+boardId;
	}
	
	@GetMapping("/thumb-up")
	public String thumbUp(int boardId, int userId) {
		boardService.thumbUp(boardId, userId);
		return "redirect:detail?boardId="+boardId;
	}
	
	@GetMapping("/thumb-delete")
	public String thumbDelete(int boardId, int userId) {
		boardService.thumbDelete(boardId, userId);
		return "redirect:detail?boardId="+boardId;
	}
	
}
