package com.green.greenstock.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.green.greenstock.dto.NoticeUpdateDto;
import com.green.greenstock.repository.interfaces.BoardNoticeRepository;
import com.green.greenstock.repository.interfaces.UserRepository;
import com.green.greenstock.repository.model.Noticeboard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardNoticeService {
	
	private final UserRepository userRepository;
	private final BoardNoticeRepository noticeRepository;
	/**
	 * 
	 * 공지사항 목록 조회
	 * @param -list
	 * @return noticeList
	 * 
	 */	
	public List<Noticeboard> noticeListService(int offset, String noticeState, String noticeTitle) {				
		return noticeRepository.findAll(offset, noticeState, noticeTitle);

	}
		
	/**
	 * 공지사항 작성
	 * @param 
	 */
	public int noticeWriteService(Noticeboard noticeboard) {
		int result = noticeRepository.writeNotice(noticeboard);
		return result;							
	}

	/**
	 * 공지 사항 수정
	 * @return 
	 * 
	 */
	public int noticeUpdateService(NoticeUpdateDto noticeupdateDto) {
			Noticeboard noticeboard = new Noticeboard();		
			noticeboard.setId(noticeupdateDto.getId());
			noticeboard.setNoticeTitle(noticeupdateDto.getNoticeTitle());
			noticeboard.setNoticeContent(noticeupdateDto.getNoticeContent());
			noticeboard.setNoticeState(noticeupdateDto.getNoticeState());
			System.out.println(noticeupdateDto);
			System.out.println(noticeboard);
			int result = noticeRepository.updateNotice(noticeboard);	
			return result;
	}	
	
	/**
	 * 공지 사항 삭제
	 * 
	 */
	public int noticeDeleteService(int id) {
		return noticeRepository.deleteNotice(id);		
	}

	/**
	 *	공지사항 상세보기  
	 *  
	 */
	public Noticeboard noticeViewService(int id) {
		Noticeboard noticeboard = noticeRepository.viewNoticePage(id);
		return noticeboard;
		
	}
	/**
	 * 공개 비공개 처리
	 */
	
	public int noticeStateService(int id) {
		return noticeRepository.noticeState(id);
	}
	
		
	/**
	 * 조회수 증가 
	 */
	
	public int noticeHitCountService(int id) {
		int result = noticeRepository.noticeHitCount(id);
		return result;
	}


	/**
	 * 댓글 전체 카운트(공개,비공개) 
	 */
	public int noticeListCount( ) {		
		return noticeRepository.listCount();
		
	}
	
	/**
	 * 한페이지에 보이는 글수는 몇개인가?
	 * 
	 */
	public int noticeLiveListCount( ) {
		return noticeRepository.listCount();
	}



	
}
