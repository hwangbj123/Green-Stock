package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.greenstock.dto.BoardSearchDto;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.repository.model.Board;

@Mapper
public interface BoardRepository {

	public List<String> findCategoryList();
	public int insertBoard(Board board);
	public List<Board> selectBoardListAll(PagingDto paging);
	public int selectBoardCount(PagingDto paging);
	public Board selectBoardById(int id);
	public int updateBoard(Board board);
	public int deleteBoard(int boardId);
	public List<Board> selectBoardSearchList(PagingDto paging);
}
