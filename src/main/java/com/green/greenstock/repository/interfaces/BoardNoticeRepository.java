package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.PageCriteriation;
import com.green.greenstock.dto.NoticeUpdateDto;
import com.green.greenstock.dto.NoticeWriteDto;
import com.green.greenstock.dto.PageCriteriaDto;
import com.green.greenstock.repository.model.Noticeboard;



@Mapper
public interface BoardNoticeRepository {

	/**
	 * 공지사항 목록
	 * @return
	 */
	public List<Noticeboard>findAll(PageCriteriaDto criteriaDto);
	
	
	/**
	 * 공지사항 작성
	 * @param noticeboard
	 * @return
	 */
	public int writeNotice(Noticeboard noticeboard);
	
	
	/**
	 * 공지 사항 수정
	 * @param noticeboard
	 * @return
	 */
	public int updateNotice(Noticeboard noticeboard);	
		
	/**
	 * 공지사항 삭제 
	 * @param id
	 * @return
	 */
	public int deleteNotice(int id);

	/**
	 * 공지사항상세보기 
	 * @param id
	 * @return
	 */ 
	public Noticeboard viewNoticePage(int id);
	
	/**
	 * 조회수
	 * @param id
	 * @return
	 */
	public int noticeHitCount(int id);
	
	
	/**
	 * 한페이지의 전체 글수 는 몇개인가?
	 * @param id
	 * @return
	 */
	public int listCount(PageCriteriaDto criteriaDto);
	
	
	
	/**
	 * 검색 기능
	 */
	
	
	
	/**
	 * 파일 올리기 기능 
	 */
	
	
	/**
	 * 카테고리 기능
	 */
		
	
}
