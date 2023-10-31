package com.green.greenstock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.greenstock.dto.NoticeUpdateDto;
import com.green.greenstock.repository.model.Noticeboard;
import com.green.greenstock.service.BoardNoticeService;
import com.green.greenstock.service.UserService;

import lombok.RequiredArgsConstructor;



//공지사항 컨트롤러 생성
@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class BoardNoticeController {	

	@Autowired
	private final UserService userService;
	@Autowired
	private final BoardNoticeService boardNoticeService;

	//공지사항 목록 리스트
	@GetMapping("/list")
	public String ListNotice(Model model){	
		//공지사항 목록을 불러오는 부분 
		List<Noticeboard> listNotice = boardNoticeService.noticeListService();
		if(listNotice.isEmpty()) {
			model.addAttribute("noticeList",null);
		}else {
			model.addAttribute("noticeList", listNotice);
		}
		return "notice/noticeList"; 
		
	}
	
	
	//공지사항 작성
	@PostMapping("/write")
	public String writeNotice(Noticeboard noticeboard  ) {
		System.out.println(writeNotice(noticeboard));
		boardNoticeService.noticeWriteService(noticeboard);		
	
		return "notice/noticeWrite";
	}
	
	//공지사항 수정
	@PostMapping("/update")
	public String updateNoticeProc(NoticeUpdateDto noticeupdateDto)   {						
		boardNoticeService.noticeUpdateService(noticeupdateDto);				
		return "notice/update";
		
	}
	
	//공지사항 삭제
	@GetMapping("/delete/{id}")
	public String deleteNotice(@PathVariable int id ) {
		boardNoticeService.noticeDeleteService(id);
		return "notice/delete";
	}	
	
	//공지사항 상세보기
	@GetMapping("/view")
	public String viewNotice(Model model,@PathVariable int id) {		
		model.addAttribute("view", boardNoticeService.noticeViewService(id));		
		return "notice/view";
	}
	
	
}
