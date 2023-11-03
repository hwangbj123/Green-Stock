package com.green.greenstock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.greenstock.dto.PageCriteriation;
import com.green.greenstock.dto.NoticeUpdateDto;
import com.green.greenstock.dto.PageCriteriaDto;
import com.green.greenstock.dto.PagingDto;
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

	/**
	 * 
	 * @param 어드민 상태 일때 보이는 공지사항 목록
	 * @return
	 */
	//공지사랑 목록 (어드민)
	
	@GetMapping("/admin/list")
	public String adminListNotice(Model model, PageCriteriaDto pageCriteriaDto){	
		//공지사항 목록을 불러오는 부분 	
		List<Noticeboard> listNotice = boardNoticeService.noticeListService(pageCriteriaDto);
		int total =  boardNoticeService.noticeListCount(pageCriteriaDto);
		PageCriteriation pageCriteriation = new PageCriteriation(total, pageCriteriaDto);			
		model.addAttribute("page",pageCriteriation);
		System.out.println("tdddd :" + total);
		if(listNotice.isEmpty()) {
			model.addAttribute("noticeList",null);
		}else {
			model.addAttribute("noticeList", listNotice);
		}
		return "notice/admin/adminNoticeList"; 
		
	}
	/**
	 * 
	 * @param 일반 사용자한태 보여지는 공지사항 목록 
	 * @return
	 */
	//공지사항 목록 리스트(일반)
//	@GetMapping("/list")
//	public String listNotice(Model model){	
//		//공지사항 목록을 불러오는 부분 
//		List<Noticeboard> listNotice = boardNoticeService.noticeListService();
//		if(listNotice.isEmpty()) {
//			model.addAttribute("noticeList",null);
//		}else {
//			model.addAttribute("noticeList", listNotice);
//		}
//		return "notice/noticeList"; 
//		
//	}
	
	//공지사항 작성된것을 보내는 주소 
	@GetMapping("/admin/write")
	public String writeNoticeForm() {			
		return "notice/admin/adminNoticeWrite";
	}
	
	//공지사항 작성(받는주소)
	@PostMapping("/admin/write")
	public String writeNotice(Noticeboard noticeboard) {
		System.out.println(noticeboard);
		
		boardNoticeService.noticeWriteService(noticeboard);		
		return "redirect:/notice/admin/list";
	}
		
	/**
	 *   
	 * @param 수정할때 페이지로 보내주는 주소(어드민 상태일때만)
	 * @param id
	 * @return
	 */
	@GetMapping("/admin/update/{id}")
	public String updateNotice(Model model, @PathVariable int id) {
		model.addAttribute("notice", boardNoticeService.noticeViewService(id));		
		return "notice/admin/adminNoticeUpdate";
	}
		
	/**
	 * 
	 * @param  공지사항 수정할때 받는 주소(어드민 상태일때만)
	 * @return
	 */
	//공지사항 수정 받으면 주소
	@PostMapping("/update")
	public String updateNoticeProc(NoticeUpdateDto noticeupdateDto)   {		
		System.out.println(noticeupdateDto);
		
		int result = boardNoticeService.noticeUpdateService(noticeupdateDto);				
		System.out.println(result);
		
		return "redirect:/notice/admin/list";
		
	}
	/**
	 * 
	 * @param 공지사항 삭제 기능(어드민 상태만 가능)
	 * @return
	 */
	//공지사항 삭제(어드민)
	@GetMapping("/admin/delete/{id}")
	public String deleteNotice(@PathVariable int id ) {
		boardNoticeService.noticeDeleteService(id);
		return "redirect:/notice/admin/list";
	}	
	
	/**
	 * 
	 * @param 공지사항 상세보기(어드민 페이지)
	 * @return adminNoticeView
	 */	
	@GetMapping("/admin/view/{id}")
	public String adminViewNotice(Model model, @PathVariable int id) {		
		model.addAttribute("view", boardNoticeService.noticeViewService(id));		
		return "notice/admin/adminNoticeView";
	}
	
	/**
	 * 
	 * @param 공지사항 상세보기(일반 페이지)
	 * @param 조회수 추가 
	 * @param id
	 * @return notice/noticeView
	 */		
	@GetMapping("/view/{id}")	
	public String viewNotice(Model model, @PathVariable int id) {
		// 하나의 글 찾기
		Noticeboard noticeboard = boardNoticeService.noticeViewService(id) ;
		// 조회수 증가
		boardNoticeService.noticeHitCountService(id);			
		model.addAttribute("view", noticeboard);		
		return "notice/noticeView";
	}
}
