package com.green.greenstock.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.green.greenstock.dto.NoticeUpdateDto;
import com.green.greenstock.dto.NoticeWriteDto;
import com.green.greenstock.repository.interfaces.BoardNoticeRepository;
import com.green.greenstock.repository.interfaces.UserRepository;
import com.green.greenstock.repository.model.Noticeboard;
import com.green.greenstock.repository.model.User;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardNoticeService {
	
	private final UserRepository userRepository;
	private final BoardNoticeRepository noticeRepository;
	/**
	 * 
	 * 공지사항 목록 
	 * @param -list
	 * @return noticeList
	 * 
	 */	
	public List<Noticeboard> noticeListService() {
		List<Noticeboard> noticeList = noticeRepository.findAll();
		return noticeList;
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
			//Noticeboard noticeboard = noticeRepository.getNoticeboard(noticeupdateDto.getId());			
			//noticeRepository.;
		
			Noticeboard noticeboard = new Noticeboard();		
			noticeboard.setId(noticeupdateDto.getId());
			noticeboard.setNoticeTitle(noticeupdateDto.getNoticeTitle());
			noticeboard.setNoticeContent(noticeupdateDto.getNoticeContent());
			noticeboard.setNoticeState(noticeupdateDto.getNoticeState());
			
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
	 * 공지 사항 리스트 갯수
	 * 
	 */
}
