package com.green.greenstock.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.green.greenstock.dto.NoticeUpdateDto;
import com.green.greenstock.dto.NoticeWriteDto;
import com.green.greenstock.repository.model.Noticeboard;
import com.green.greenstock.repository.model.User;
import com.green.greenstock.service.BoardNoticeService;
import com.green.greenstock.service.UserService;

import lombok.RequiredArgsConstructor;



//공지사항 컨트롤러 생성
@Controller
@RequiredArgsConstructor
public class BoardNoticeController {	

	
	private final UserService userService;
	private final BoardNoticeService boardNoticeService;

	//공지사항 목록 리스트
	@ResponseBody
	@GetMapping("/list")
	public List<Noticeboard> ListNotice(Model model){	
		//공지사항 목록을 불러오는 부분 
		List<Noticeboard> listNotice = boardNoticeService.noticeListService();
//		if(ListNotice.isEmpty()) {
//			model.addAttribute("moticeList",null);
//		}else {
//			model.addAttribute("noticeList", ListNotice);
//		}
		//return "noticeboard/list"; 
		return listNotice;
		
	}
	
	
	//공지사항 작성
	@PostMapping("/write")
	@ResponseBody
	public int writeNotice(Noticeboard noticeboard  ) {
		int result = boardNoticeService.noticeWriteService(noticeboard);		
		//return ResponseEntity.ok("작성됨");
		return result;
	}
	
	//공지사항 수정
	@PostMapping("/update")
	@ResponseBody
	public int updateNoticeProc(NoticeUpdateDto noticeupdateDto)   {						
		int result = boardNoticeService.noticeUpdateService(noticeupdateDto);		
		return result;
		//return ResponseEntity.ok("수정됨");
	}
	
	//공지사항 삭제
	@GetMapping("/delete{id}")
	public int deleteNotice(@PathVariable int id ) {
		int result = boardNoticeService.noticeDeleteService(id);
		return result;
	}
	//공지사항 내용보기
	
}
