package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.NoticeUpdateDto;
import com.green.greenstock.dto.NoticeWriteDto;
import com.green.greenstock.repository.model.Noticeboard;



@Mapper
public interface BoardNoticeRepository {

	//공지사항 리스트
	public List<Noticeboard>findAll();
	
	
	//공지사항 작성
	public int writeNotice(Noticeboard noticeboard);
	//공지사항 수정
	public int updateNotice(Noticeboard noticeboard);
	//public Noticeboard getNoticeboard(int id);
		
	//공지사항 삭제
	public int deleteNotice(int id);

	/**
	 * 공지사항 번로 상세보기 
	 * @param id
	 * @return
	 */
	//공지사항 상세보기 
	public int viewNoticePage(int id);
	
	//페이징 
	
	//카테고리
	
	//조회수
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
