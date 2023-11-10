package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.green.greenstock.repository.model.Noticeboard;



@Mapper
public interface BoardNoticeRepository {

	/**
	 * 공지사항 목록
	 * @return
	 */	
	public List<Noticeboard> findAll(@Param("offset")int offset ,
			@Param("noticeState") String noticeState, 
			@Param("noticeTitle")String noticeTitle );
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
	 * 공지사항 상세보기 
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
	 * 공개 비공개 글 처리
	 * 
	 */
	public int noticeState(int id);
	
	/**
	 * 공개, 비공개글 나누기 (어드민과 일반 사용자)
	 * @param id
	 * @return
	 */
	public int listCount(@Param("noticeState") String noticeState, @Param("noticeTitle") String noticeTitle);
	
	/**
	 * 파일 올리기 
	 * 
	 */
	
	
		
	
}
